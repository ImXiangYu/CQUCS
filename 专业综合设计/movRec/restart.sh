#!/bin/bash
# 1. 定义项目路径（请确保路径正确）
PROJECT_DIR="/var/www/movRec/movie_recommendation"

# 2. 强行关闭旧进程
fuser -k 8000/tcp

# 3. 使用虚拟环境里的 python 绝对路径直接启动
# 这样不需要 source 也能精准运行
nohup $PROJECT_DIR/venv/bin/python $PROJECT_DIR/manage.py runserver 0.0.0.0:8000 > $PROJECT_DIR/backend.log 2>&1 &

echo "后端服务已在后台启动！"
sleep 2  # 等待2秒看是否报错
tail -n 5 $PROJECT_DIR/backend.log
