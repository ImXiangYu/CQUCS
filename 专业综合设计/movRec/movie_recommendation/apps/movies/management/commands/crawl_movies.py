"""
Django管理命令：爬取IMDB电影数据并导入到MongoDB
"""
from django.core.management.base import BaseCommand
from apps.movies.spider import crawl_imdb_movies
from utils.database import get_collection
from utils.helpers import generate_int_id


class Command(BaseCommand):
    help = "从IMDB爬取电影数据并导入到MongoDB"

    def add_arguments(self, parser):
        parser.add_argument(
            '--keywords',
            nargs='+',
            help='搜索关键词列表（用空格分隔）',
        )
        parser.add_argument(
            '--limit',
            type=int,
            default=20,
            help='每个关键词最多爬取的电影数量（默认20）',
        )

    def handle(self, *args, **options):
        keywords = options.get('keywords')
        limit = options.get('limit', 20)
        
        # 海报保存路径（项目根目录的poster文件夹）
        from pathlib import Path
        base_dir = Path(__file__).resolve().parent.parent.parent.parent.parent
        poster_path = base_dir / "poster"
        
        self.stdout.write("开始爬取IMDB电影数据...")
        self.stdout.write(f"关键词: {keywords or '高分电影'}")
        self.stdout.write(f"数量限制: {limit}")
        self.stdout.write(f"海报保存路径: {poster_path}")
        self.stdout.write("")
        
        # 爬取电影数据
        movies = crawl_imdb_movies(keywords=keywords, limit=limit, poster_path=str(poster_path))
        
        if not movies:
            self.stdout.write(self.style.WARNING("未爬取到任何电影数据"))
            return
        
        self.stdout.write(f"共爬取 {len(movies)} 部电影")
        self.stdout.write("")
        
        # 导入到MongoDB
        collection = get_collection("movies")
        imported = 0
        updated = 0
        skipped = 0
        
        for movie in movies:
            try:
                # 检查是否已存在（通过IMDB ID或标题）
                existing = None
                if movie.get('imdb_id'):
                    existing = collection.find_one({"imdb_id": movie['imdb_id']})
                if not existing:
                    existing = collection.find_one({"title": movie['title']})
                
            movie_doc = {
                "title": movie['title'],
                "genres": movie.get('genres', []),
                "plot": movie.get('plot', ''),
                "year": movie.get('year'),
                "rating": movie.get('rating'),
                "poster_url": movie.get('poster_url'),  # 原始URL
                "poster_local": movie.get('poster_local'),  # 本地路径
                "imdb_id": movie.get('imdb_id'),
                "directors": movie.get('directors', []),
                "actors": movie.get('actors', []),
                "writers": movie.get('writers', []),
                "duration": movie.get('duration'),
                "release_time": movie.get('release_time'),
                "imdb_url": movie.get('url'),
            }
                
                if existing:
                    # 更新现有电影
                    collection.update_one(
                        {"_id": existing["_id"]},
                        {"$set": movie_doc}
                    )
                    updated += 1
                    self.stdout.write(f"更新: {movie['title']}")
                else:
                    # 插入新电影
                    movie_doc["_id"] = generate_int_id(collection, "_id")
                    collection.insert_one(movie_doc)
                    imported += 1
                    self.stdout.write(f"导入: {movie['title']}")
                    
            except Exception as e:
                skipped += 1
                self.stdout.write(self.style.ERROR(f"处理失败 {movie.get('title', 'Unknown')}: {e}"))
        
        self.stdout.write("")
        self.stdout.write(self.style.SUCCESS(f"导入完成！"))
        self.stdout.write(f"  新增: {imported} 部")
        self.stdout.write(f"  更新: {updated} 部")
        self.stdout.write(f"  跳过: {skipped} 部")

