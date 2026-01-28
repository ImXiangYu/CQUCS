"""
从CSV文件导入电影数据到MongoDB
"""
import csv
import re
from pathlib import Path
from django.core.management.base import BaseCommand
from utils.database import get_collection


class Command(BaseCommand):
    help = "从CSV文件导入电影数据到MongoDB"

    def add_arguments(self, parser):
        parser.add_argument(
            '--csv-path',
            type=str,
            default='data/reco_artifacts_2026-01-16/info/info.csv',
            help='CSV文件路径',
        )
        parser.add_argument(
            '--poster-dir',
            type=str,
            default='data/reco_artifacts_2026-01-16/poster',
            help='海报目录路径',
        )

    def handle(self, *args, **options):
        # 获取项目根目录
        BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent.parent.parent
        
        csv_path = Path(options.get('csv_path'))
        poster_dir = Path(options.get('poster_dir'))
        
        # 如果是相对路径，从项目根目录开始
        if not csv_path.is_absolute():
            csv_path = BASE_DIR / csv_path
        if not poster_dir.is_absolute():
            poster_dir = BASE_DIR / poster_dir
        
        if not csv_path.exists():
            self.stdout.write(self.style.ERROR(f"CSV文件不存在: {csv_path}"))
            self.stdout.write(self.style.ERROR(f"请检查路径是否正确"))
            return
        
        if not poster_dir.exists():
            self.stdout.write(self.style.WARNING(f"海报目录不存在: {poster_dir}"))
        
        self.stdout.write(f"正在从 {csv_path} 导入电影数据...")
        self.stdout.write(f"海报目录: {poster_dir}")
        self.stdout.write("")
        
        collection = get_collection("movies")
        imported = 0
        updated = 0
        skipped = 0
        
        with open(csv_path, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                try:
                    movie_id = int(row.get('id', 0))
                    if not movie_id:
                        continue
                    
                    # 解析标题和年份
                    name = row.get('name', '').strip()
                    year_match = re.search(r'\((\d{4})\)', name)
                    year = int(year_match.group(1)) if year_match else None
                    title = re.sub(r'\s*\(\d{4}\)\s*', '', name).strip()
                    
                    # 解析类型
                    genres_str = row.get('genre', '')
                    genres = [g.strip() for g in genres_str.split('|') if g.strip()] if genres_str else []
                    
                    # 解析简介
                    intro = row.get('intro', '').strip()
                    
                    # 解析导演、编剧、演员
                    directors_str = row.get('directors', '')
                    directors = [d.strip() for d in directors_str.split('|') if d.strip()] if directors_str else []
                    
                    writers_str = row.get('writers', '')
                    writers = [w.strip() for w in writers_str.split('|') if w.strip()] if writers_str else []
                    
                    actors_str = row.get('starts', '')  # 注意CSV中是starts不是actors
                    actors = [a.strip() for a in actors_str.split('|') if a.strip()] if actors_str else []
                    
                    # 海报路径
                    poster_url = row.get('url', '').strip().strip('"')
                    poster_local = None
                    if poster_dir.exists():
                        poster_file = poster_dir / f"{movie_id}.jpg"
                        if poster_file.exists():
                            # 保存相对路径（从项目根目录开始）
                            try:
                                # 计算相对路径
                                relative_path = poster_file.relative_to(BASE_DIR)
                                poster_local = str(relative_path).replace('\\', '/')
                            except:
                                # 如果计算失败，使用固定路径
                                poster_local = f"data/reco_artifacts_2026-01-16/poster/{movie_id}.jpg"
                    
                    # 解析时长
                    duration = row.get('time', '').strip()
                    
                    # 解析发行时间
                    release_time = row.get('release_time', '').strip()
                    
                    # 检查是否已存在
                    existing = collection.find_one({"_id": movie_id})
                    
                    movie_doc = {
                        "title": title,
                        "genres": genres,
                        "plot": intro,
                        "year": year,
                        "rating": None,  # CSV中没有评分
                        "poster_url": poster_url,
                        "poster_local": poster_local,
                        "directors": directors,
                        "writers": writers,
                        "actors": actors,
                        "duration": duration,
                        "release_time": release_time,
                    }
                    
                    if existing:
                        # 更新现有电影
                        collection.update_one(
                            {"_id": movie_id},
                            {"$set": movie_doc}
                        )
                        updated += 1
                        self.stdout.write(f"更新: {title} (ID: {movie_id})")
                    else:
                        # 插入新电影
                        movie_doc["_id"] = movie_id
                        collection.insert_one(movie_doc)
                        imported += 1
                        self.stdout.write(f"导入: {title} (ID: {movie_id})")
                        
                except Exception as e:
                    skipped += 1
                    self.stdout.write(self.style.ERROR(f"处理失败 ID {row.get('id', 'Unknown')}: {e}"))
        
        self.stdout.write("")
        self.stdout.write(self.style.SUCCESS(f"导入完成！"))
        self.stdout.write(f"  新增: {imported} 部")
        self.stdout.write(f"  更新: {updated} 部")
        self.stdout.write(f"  跳过: {skipped} 部")

