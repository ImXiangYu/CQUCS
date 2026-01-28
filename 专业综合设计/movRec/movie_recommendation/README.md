# 电影推荐系统后端

## 快速启动（本地环境）
1. 安装依赖
   ```bash
   cd movie_recommendation
   python -m venv .venv && source .venv/bin/activate
   pip install -r requirements.txt
   ```
2. 配置环境变量
   ```bash
   cp .env.example .env
   # 按需修改 DJANGO_SECRET_KEY、MONGO_URI、JWT_SECRET 等
   ```
3. 启动 MongoDB（不使用 Docker）
   - 若已安装本地 MongoDB：
     ```bash
     # 常见方式 1：systemd 服务
     sudo systemctl start mongodb.service
     # 常见方式 2：手动指定数据目录（示例）
     mongod --dbpath "$HOME/mongodata" --bind_ip 127.0.0.1 --port 27017

     # 查看MongoDB的服务状态
     sudo systemctl status mongodb.service
     # 停止 MongoDB 服务
     sudo systemctl stop mongodb.service
     ```
   - `.env` 中的 `MONGO_URI` 改为本地地址，例如：`MONGO_URI=mongodb://localhost:27017`

4. 导入样例数据（可选，无 mongoimport 工具时的 Python 方案）
   假设数据位于 `../data/reco_artifacts_2026-01-16/`，使用 Python 将 JSONL 写入 Mongo：
   ```bash
   python - <<'PY'
   import json
   from pathlib import Path
   from pymongo import MongoClient

   mongo_uri = "mongodb://localhost:27017"  # 如与 .env 不同请调整
   db_name = "movie_rec_db"
   base = Path("../data/reco_artifacts_2026-01-16")

   client = MongoClient(mongo_uri)
   db = client[db_name]

   def load_jsonl(path: Path, coll: str) -> None:
       docs = []
       with open(path, "r", encoding="utf-8") as f:
           for line in f:
               line = line.strip()
               if not line:
                   continue
               docs.append(json.loads(line))
       if not docs:
           print(f"{coll}: 无数据")
           return
       db[coll].insert_many(docs, ordered=False)
       print(f"{coll}: 导入 {len(docs)} 条")

   load_jsonl(base / "movies.jsonl", "movies")
   load_jsonl(base / "item_sim_topk.jsonl", "item_sim_topk")
   PY
   ```

5. 创建索引（建议）
   进入 Django shell 执行：
   ```bash
   python manage.py shell <<'PY'
   from utils.database import ensure_indexes
   print(ensure_indexes())
   PY
   ```
6. 运行服务
   ```bash
   python manage.py runserver 0.0.0.0:8000
   ```

## 主要接口
- Swagger 文档：`/api/docs/`
- Redoc 文档：`/api/redoc/`
- 健康检查：`/api/health`
- 登录注册：`/api/auth/register`、`/api/auth/login`
- 电影接口：`/api/movies`、`/api/movies/search`、`/api/movies/genres`
- 评分接口：`/api/ratings`（POST/PUT/DELETE）、`/api/ratings/user`、`/api/ratings/movie/{movieId}`
- 推荐接口：`/api/recommendations/item-based`（已实现）、`/user-based`、`/hybrid`、`/trending`、`/new`

## 接口作用与参数

### 认证/Auth（需登录的接口必须带 `Authorization: Bearer <token>`）
- `POST /api/auth/register`
   - 作用：注册新用户。
   - 请求体：`username` 字符串；`email` 邮箱；`password` 字符串（>=6）。
- `POST /api/auth/login`
   - 作用：登录并获取 JWT。
   - 请求体：`username`，`password`。
- `GET /api/auth/profile`
   - 作用：获取当前登录用户信息。
   - 参数：无（需 JWT）。
- `PUT /api/auth/profile`
   - 作用：更新邮箱/密码/偏好。
   - 请求体可选字段：`email`，`password`，`favorite_genres` 数组，`excluded_genres` 数组。

### 电影（无需登录）
- `GET /api/movies`
   - 作用：获取电影列表。
   - 查询参数：`page` 页码，`page_size` 每页数量（<=100），`genre` 按类型过滤。
- `GET /api/movies/{id}`
   - 作用：获取电影详情。
   - 路径参数：`id` 电影 ID。
- `GET /api/movies/search`
   - 作用：按标题模糊搜索。
   - 查询参数：`q` 关键词（必填），`page`，`page_size`（<=50）。
- `GET /api/movies/genres`
   - 作用：获取全部电影类型列表。
   - 参数：无。

### 评分（需登录）
- `POST /api/ratings`
   - 作用：新增或覆盖当前用户对电影的评分。
   - 请求体：`movieId`，`rating`(1.0~5.0)。
- `PUT /api/ratings/{id}`
   - 作用：更新评分。
   - 路径参数：`id` 评分文档 ID（Mongo `_id` 字符串）。
   - 请求体：`rating`。
- `DELETE /api/ratings/{id}`
   - 作用：删除/失效评分。
   - 路径参数：`id` 评分文档 ID。
- `GET /api/ratings/user`
   - 作用：查看自己的评分历史。
   - 查询参数：`page`，`page_size`（<=100）。
- `GET /api/ratings/movie/{movieId}`
   - 作用：查看某电影的评分统计（数量、平均分）。
   - 路径参数：`movieId`。

### 推荐
- `GET /api/recommendations/item-based`
   - 作用：基于 item_sim_topk 的物品协同过滤推荐（需登录，基于用户历史评分）。
   - 查询参数：`top` 返回条数，默认 10。
- `GET /api/recommendations/user-based`
   - 作用：用户协同过滤（占位，未实现）。
   - 查询参数：`top`，默认 10。
- `GET /api/recommendations/hybrid`
   - 作用：混合推荐（占位）。
   - 查询参数：`top`，默认 10。
- `GET /api/recommendations/trending`
   - 作用：热门推荐，按评分数量与均分排序（公开）。
   - 查询参数：`top`，默认 10。
- `GET /api/recommendations/new`
   - 作用：新片推荐，按 movieId 倒序（公开）。
   - 查询参数：`top`，默认 10。

### 系统
- `GET /api/health`
   - 作用：健康检查（检查 Mongo 连接）。
   - 参数：无。
- `GET /api/metrics`
   - 作用：简单运行指标。
   - 参数：无。
- `POST /api/batch/recommend`
   - 作用：批量推荐任务触发占位，未实现计算。
   - 参数：无（需登录）。

## 认证与限流
- 认证：使用 JWT，HTTP 头 `Authorization: Bearer <token>`
- 限流：默认 `anon` 100/天，`user` 1000/天，可在 `config/settings.py` 调整

## 注意事项
- Python 版本：3.11+（建议与 Docker 基础镜像保持一致）
- 评分区间：1.0 ~ 5.0，重复评分视为更新
- item-based 推荐依赖集合 `item_sim_topk` 与用户评分数据，空历史用户将返回空列表
- 预留批量推荐与 Spark/Hadoop 接口：`/api/batch/recommend` 当前为占位
