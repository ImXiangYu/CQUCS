import math
from pyspark.sql import SparkSession, functions as F, Window

def build_spark(app="item_item_topk"):
    spark = (
        SparkSession.builder.appName(app)
        .config("spark.sql.parquet.enableVectorizedReader", "true")
        .getOrCreate()
    )
    spark.sparkContext.setLogLevel("WARN")
    return spark

def main():
    spark = build_spark()

    # ---- 参数（建议先用这套跑通）----
    ratings_path = "data/clean/ratings_clean.parquet"
    out_path = "data/model/item_similarity_topk.parquet"

    min_movie_ratings = int(spark.conf.get("spark.reco.min_movie_ratings", "1000"))
    max_ratings_per_user = int(spark.conf.get("spark.reco.max_ratings_per_user", "150"))
    topk = int(spark.conf.get("spark.reco.topk", "20"))

    # ---- 读取 ratings ----
    # 预期字段：userId, movieId, rating, timestamp（你的 clean 结果一般都有这些）
    ratings = spark.read.parquet(ratings_path).select("userId", "movieId", "rating", "timestamp")

    # ---- 热门电影过滤 ----
    movie_cnt = ratings.groupBy("movieId").agg(F.count("*").alias("cnt"))
    popular = movie_cnt.filter(F.col("cnt") >= F.lit(min_movie_ratings)).select("movieId")

    ratings_pop = ratings.join(popular, on="movieId", how="inner")

    # ---- 每用户截断：保留最近 N 条（按 timestamp desc）----
    w = Window.partitionBy("userId").orderBy(F.col("timestamp").desc_nulls_last())
    ratings_cap = (
        ratings_pop
        .withColumn("rn", F.row_number().over(w))
        .filter(F.col("rn") <= F.lit(max_ratings_per_user))
        .select("userId", "movieId", "rating")
    )

    # ---- 转 RDD：按 user 聚合为 [(movieId, rating), ...] ----
    user_items = (
        ratings_cap
        .groupBy("userId")
        .agg(F.collect_list(F.struct("movieId", "rating")).alias("items"))
        .select("items")
        .rdd
        .map(lambda row: [(int(x["movieId"]), float(x["rating"])) for x in row["items"]])
    )

    # ---- 为每个用户生成 pairs (i<j)，并输出 (pair, (x, y, x^2, y^2, 1)) ----
    def gen_pairs(items):
        # items: list[(movieId, rating)]
        # 去重 movieId（极端情况下同一用户同一电影多条）
        dedup = {}
        for mid, r in items:
            dedup[mid] = r
        arr = sorted(dedup.items(), key=lambda x: x[0])
        n = len(arr)
        for a in range(n):
            i, xi = arr[a]
            for b in range(a + 1, n):
                j, yj = arr[b]
                yield ((i, j), (xi * yj, xi * xi, yj * yj, 1))

    pair_stats = (
        user_items.flatMap(gen_pairs)
        .reduceByKey(lambda p, q: (p[0] + q[0], p[1] + q[1], p[2] + q[2], p[3] + q[3]))
    )

    # ---- 计算 cosine 相似度，并过滤掉异常/过小分母 ----
    def to_edges(kv):
        (i, j), (sum_xy, sum_x2, sum_y2, cnt) = kv
        denom = math.sqrt(sum_x2) * math.sqrt(sum_y2)
        if denom <= 0:
            return []
        sim = float(sum_xy / denom)
        # 输出双向边，便于每个 movie 做 TopK
        return [
            (i, (j, sim, cnt)),
            (j, (i, sim, cnt)),
        ]

    edges = pair_stats.flatMap(to_edges)

    # ---- 每个 movie 取 TopK（用 combineByKey 做局部堆，避免 groupByKey 撑爆）----
    def comb_create(v):
        return [v]

    def comb_merge_value(acc, v):
        acc.append(v)
        return acc

    def comb_merge_combiners(a, b):
        a.extend(b)
        return a

    # 先做局部聚合，再在 mapValues 内排序截断（K=20 很小，成本可控）
    topk_edges = (
        edges.combineByKey(comb_create, comb_merge_value, comb_merge_combiners)
        .mapValues(lambda vs: sorted(vs, key=lambda x: x[1], reverse=True)[:topk])
        .flatMap(lambda kv: [(kv[0], v[0], v[1], v[2]) for v in kv[1]])
    )

    # ---- 写出 Parquet ----
    out_df = spark.createDataFrame(topk_edges, schema=["movieId", "similar_movieId", "similarity", "common_users"])
    (
        out_df
        .repartition(200)  # 产物分片，便于后续导入/读取；可按磁盘与文件数调整
        .write.mode("overwrite")
        .parquet(out_path)
    )

    # 简单校验
    print("Output:", out_path)
    out_df.select(F.count("*").alias("rows")).show()
    out_df.orderBy(F.desc("similarity")).show(20, truncate=False)

    spark.stop()

if __name__ == "__main__":
    main()

