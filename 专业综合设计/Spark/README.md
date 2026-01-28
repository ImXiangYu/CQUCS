# 离线数据处理与建模模块（Spark）

本目录用于电影推荐系统的离线数据处理与建模，基于 MovieLens 大规模评分数据计算 item-item 相似度 TopK，并生成可导入 MongoDB 的离线模型产物。在线推荐系统（Django）不依赖 Spark 环境，仅依赖本模块生成并导入 MongoDB 的结果数据。

## 模块定位

- 本模块属于【离线预处理 / 离线建模阶段】
- 不属于在线系统运行路径的一部分
- 在线推荐系统仅使用本模块生成的“模型产物”（MongoDB 中的相似电影 TopK）

## 功能说明

- 基于 Spark 计算电影之间的余弦相似度（Item-based Collaborative Filtering）
- 采用“按用户聚合后生成 item pairs（flatMap）”策略，避免 DataFrame 自连接带来的中间态膨胀
- 通过工程化规模控制避免 OOM：
  - 热门电影过滤（min_movie_ratings）
  - 单用户评分截断（max_ratings_per_user）
  - 并发与 shuffle 参数控制（local 模式）
- 输出每个电影的 Top20 相似电影列表（TopK）

## 运行环境

- Ubuntu 24.04
- Java 17
- Python venv + PySpark
- 云服务器：8 vCPU / 64GB（离线计算按需使用，计算完成后可释放资源）

## 当前产物目录说明（与本仓库结构对应）

本仓库（或本次交付包）包含以下关键目录/文件：

```
.
├── artifacts/
│   └── reco_artifacts_2026-01-16/
├── item_similarity_topk.parquet
└── offline_spark/
    └── logs/
```

说明如下：

- `item_similarity_topk.parquet`
  Spark 离线建模的核心输出（Parquet 格式），包含字段：`movieId, similar_movieId, similarity, common_users(可选)`。该文件可用于复现实验、抽查验证和二次导出。
- `artifacts/reco_artifacts_2026-01-16/`
  推荐系统可交付产物目录（面向部署/导入），通常包含：
  - `item_sim_topk.jsonl`：MongoDB 可直接导入的相似电影 TopK 文档（每个电影一条文档，内嵌 TopK 数组）
  - `movies.jsonl`（如已导出）：电影元数据（用于展示）
  - `README.md`：产物说明与导入命令
    该目录用于将离线结果从 Spark 环境解耦出来，便于在任意部署环境复用。
- `offline_spark/logs/`
  Spark 运行日志留存目录，用于证明离线作业运行过程、排障与答辩/验收佐证。

## 输出结果（逻辑层面）

离线阶段最终产生两类输出：

1. Spark 原始模型产物（面向计算/归档）

- `item_similarity_topk.parquet`

1. 可部署交付物（面向 MongoDB 导入）

- `item_sim_topk.jsonl`（位于 `artifacts/.../` 中）

## 导入与使用方式（后端对接）

在线系统不进行相似度重计算，仅从 MongoDB 查询离线 TopK 结果。推荐的 MongoDB 存储结构为：每个 `movieId` 一条文档，内嵌 TopK 数组：

```json
{
  "_id": 1,
  "sims": [
    {"mid": 356, "sim": 0.8123, "cu": 1432},
    {"mid": 593, "sim": 0.8011, "cu": 1310}
  ],
  "updatedAt": "..."
}
```

导入示例（以 artifacts 内的 JSONL 为准）：

```bash
mongoimport \
  --uri "<MONGO_URI>" \
  --collection item_sim_topk \
  --drop \
  --file artifacts/reco_artifacts_2026-01-16/item_sim_topk.jsonl
```

如包含电影元数据：

```bash
mongoimport \
  --uri "<MONGO_URI>" \
  --collection movies \
  --drop \
  --file artifacts/reco_artifacts_2026-01-16/movies.jsonl
```

## 与后端的关系

- 本模块仅负责生成离线推荐模型数据（相似电影 TopK）
- 后端（Django）通过 MongoDB 查表获取 TopK 相似列表，并进行轻量加权/排序生成推荐结果
- 在线服务不依赖 Spark/Java 等离线运行环境，部署时只需 MongoDB + 后端代码

