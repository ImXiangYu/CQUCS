from pyspark.sql import SparkSession, functions as F

spark = SparkSession.builder.appName("export_movies_jsonl").getOrCreate()
df = spark.read.parquet("data/clean/movies_clean.parquet")

# 你清洗后的字段名可能略有不同；这里按常见字段写
cols = df.columns
id_col = "movieId"
title_col = "title" if "title" in cols else None
genres_col = "genres" if "genres" in cols else None

sel = [F.col(id_col).cast("int").alias("_id")]
if title_col: sel.append(F.col(title_col).cast("string").alias("title"))
if genres_col: sel.append(F.col(genres_col).cast("string").alias("genres"))

out = df.select(*sel)

(out.coalesce(1).write.mode("overwrite").json("data/export/movies_jsonl"))
spark.stop()
