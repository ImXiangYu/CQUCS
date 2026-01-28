from pyspark.sql import SparkSession, functions as F

spark = SparkSession.builder.appName("export_item_sim_jsonl").getOrCreate()

df = spark.read.parquet("data/model/item_similarity_topk.parquet")

# 标准化字段
df2 = df.select(
    F.col("movieId").cast("int").alias("movieId"),
    F.col("similar_movieId").cast("int").alias("mid"),
    F.col("similarity").cast("double").alias("sim"),
    F.col("common_users").cast("int").alias("cu"),
)

# 保证每个 movieId 内部按相似度降序（TopK 本身不大）
df2 = df2.orderBy("movieId", F.desc("sim"))

out = (
    df2.groupBy("movieId")
    .agg(F.collect_list(F.struct("mid", "sim", "cu")).alias("sims"))
    .select(
        F.col("movieId").alias("_id"),
        F.col("sims"),
        F.current_timestamp().alias("updatedAt"),
    )
)

(out.coalesce(1).write.mode("overwrite").json("data/export/item_sim_topk_jsonl"))

spark.stop()
