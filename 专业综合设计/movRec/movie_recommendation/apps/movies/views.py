from pathlib import Path
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema

from apps.movies.models import Movie
from utils.database import get_collection
from django.conf import settings


class MovieListView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(
        manual_parameters=[
            openapi.Parameter("page", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=1),
            openapi.Parameter("page_size", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=20),
            openapi.Parameter("keyword", openapi.IN_QUERY, type=openapi.TYPE_STRING, required=False),
            openapi.Parameter("genre", openapi.IN_QUERY, type=openapi.TYPE_STRING, required=False),
        ]
    )
    def get(self, request):
        page = int(request.query_params.get("page", 1))
        page_size = min(int(request.query_params.get("page_size", 20)), 20)  # 每页最多20个
        keyword = request.query_params.get("keyword", "").strip()
        genre = request.query_params.get("genre", "").strip()

        collection = get_collection("movies")
        
        # 构建查询条件
        query = {}
        if keyword:
            query["$or"] = [
                {"title": {"$regex": keyword, "$options": "i"}},
                {"genres": {"$regex": keyword, "$options": "i"}},
                {"directors": {"$regex": keyword, "$options": "i"}},
                {"actors": {"$regex": keyword, "$options": "i"}},
            ]
        if genre:
            query["genres"] = {"$regex": genre, "$options": "i"}

        total = collection.count_documents(query)
        cursor = (
            collection.find(query)
            .sort("_id", 1)
            .skip((page - 1) * page_size)
            .limit(page_size)
        )
        items = [Movie.from_doc(doc).to_dict() for doc in cursor]
        
        # 如果数据库为空，尝试从本地文件读取所有电影
        if total == 0:
            all_items = self._get_movies_from_local_posters()
            print(f"MovieListView - 从本地文件读取到 {len(all_items)} 部电影")
            
            # 应用搜索和筛选
            if keyword:
                keyword_lower = keyword.lower()
                all_items = [m for m in all_items if 
                            keyword_lower in m.get("title", "").lower() or
                            any(keyword_lower in str(g).lower() for g in m.get("genres", [])) or
                            any(keyword_lower in str(d).lower() for d in m.get("directors", [])) or
                            any(keyword_lower in str(a).lower() for a in m.get("actors", []))]
            
            if genre:
                genre_lower = genre.lower()
                all_items = [m for m in all_items if 
                            any(genre_lower in str(g).lower() for g in m.get("genres", []))]
            
            total = len(all_items)
            print(f"MovieListView - 筛选后剩余 {total} 部电影")
            # 只返回当前页的数据
            start = (page - 1) * page_size
            end = min(start + page_size, total)
            items = all_items[start:end]
            print(f"MovieListView - 返回第 {page} 页，共 {len(items)} 部电影 (start={start}, end={end})")
        
        # 为所有电影添加评分信息（从数据库获取）
        items = self._add_ratings_to_movies(items)
        
        return Response({"count": total, "page": page, "page_size": page_size, "results": items})
    
    def _get_movies_from_local_posters(self):
        """从本地poster目录读取电影列表，从movies.jsonl读取genres，从info.csv读取其他信息"""
        import os
        import csv
        import re
        current_file = Path(__file__).resolve()
        
        # 尝试多种方法找到项目根目录
        BASE_DIR = None
        
        # 方法1: 从views.py向上5级
        test_dir = current_file.parent.parent.parent.parent.parent
        if (test_dir / "data" / "reco_artifacts_2026-01-16" / "poster").exists():
            BASE_DIR = test_dir
        
        # 方法2: 从当前工作目录的父目录
        if not BASE_DIR:
            test_dir = Path(os.getcwd()).parent
            if (test_dir / "data" / "reco_artifacts_2026-01-16" / "poster").exists():
                BASE_DIR = test_dir
        
        # 方法3: 从当前文件向上查找
        if not BASE_DIR:
            test_dir = current_file.parent
            for _ in range(10):
                if (test_dir / "data" / "reco_artifacts_2026-01-16" / "poster").exists():
                    BASE_DIR = test_dir
                    break
                parent = test_dir.parent
                if parent == test_dir:  # 到达根目录
                    break
                test_dir = parent
        
        if not BASE_DIR:
            print(f"错误: 无法找到项目根目录")
            print(f"当前文件: {current_file}")
            print(f"当前工作目录: {os.getcwd()}")
            print(f"请确保 data/reco_artifacts_2026-01-16/poster/ 目录存在")
            return []
        
        poster_dir = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "poster"
        
        print(f"找到项目根目录: {BASE_DIR}")
        print(f"海报目录: {poster_dir}")
        print(f"海报目录存在: {poster_dir.exists()}")
        
        if not poster_dir.exists():
            print(f"错误: 海报目录不存在: {poster_dir}")
            return []
        
        print(f"正在从 {poster_dir} 读取海报文件...")
        
        # 读取movies.jsonl获取genres
        movies_jsonl_path = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "movies.jsonl"
        genres_dict = {}
        if movies_jsonl_path.exists():
            import json
            import ast
            try:
                with open(movies_jsonl_path, 'r', encoding='utf-8') as f:
                    for line in f:
                        line = line.strip()
                        if not line:
                            continue
                        try:
                            movie_data = json.loads(line)
                            movie_id = movie_data.get('movieId') or movie_data.get('_id') or movie_data.get('id')
                            if movie_id:
                                # 解析genres（可能是字符串格式的数组）
                                genres_str = movie_data.get('genres', '')
                                if genres_str:
                                    try:
                                        # 尝试解析为列表
                                        if isinstance(genres_str, str):
                                            # 如果是字符串格式的数组，如 "[Adventure, Children, Fantasy]"
                                            genres_str = genres_str.strip()
                                            if genres_str.startswith('[') and genres_str.endswith(']'):
                                                genres_list = ast.literal_eval(genres_str)
                                                genres_dict[int(movie_id)] = [g.strip() for g in genres_list if g]
                                            else:
                                                # 如果是用|分隔的字符串
                                                genres_dict[int(movie_id)] = [g.strip() for g in genres_str.split('|') if g.strip()]
                                        elif isinstance(genres_str, list):
                                            genres_dict[int(movie_id)] = [g.strip() for g in genres_str if g]
                                    except (ValueError, SyntaxError):
                                        pass
                        except (json.JSONDecodeError, ValueError, TypeError):
                            continue
            except Exception as e:
                print(f"读取movies.jsonl失败: {e}")
        
        movies = []
        # 直接从CSV读取所有电影（不依赖poster文件）
        csv_path = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "info" / "info.csv"
        
        if csv_path.exists():
            print(f"从CSV文件读取所有电影信息: {csv_path}")
            try:
                with open(csv_path, 'r', encoding='utf-8') as f:
                    reader = csv.DictReader(f)
                    for row in reader:
                        try:
                            movie_id = int(row.get('id', 0))
                            if movie_id <= 0:
                                continue
                            
                            name = row.get('name', '').strip()
                            year_match = re.search(r'\((\d{4})\)', name)
                            year = int(year_match.group(1)) if year_match else None
                            title = re.sub(r'\s*\(\d{4}\)\s*', '', name).strip()
                            
                            genres_str = row.get('genre', '')
                            genres = [g.strip() for g in genres_str.split('|') if g.strip()] if genres_str else []
                            
                            intro = row.get('intro', '').strip()
                            
                            # url字段是图片网址，CSV中可能用双引号包裹，需要正确处理
                            poster_url_raw = row.get('url', '').strip()
                            # 移除首尾的双引号（如果有）
                            if poster_url_raw.startswith('"') and poster_url_raw.endswith('"'):
                                poster_url = poster_url_raw[1:-1]
                            else:
                                poster_url = poster_url_raw
                            
                            directors_str = row.get('directors', '')
                            directors = [d.strip() for d in directors_str.split('|') if d.strip()] if directors_str else []
                            
                            actors_str = row.get('starts', '')
                            actors = [a.strip() for a in actors_str.split('|') if a.strip()] if actors_str else []
                            
                            # 读取其他字段
                            time_str = row.get('time', '').strip()
                            release_time = row.get('release_time', '').strip()
                            writers_str = row.get('writers', '')
                            writers = [w.strip() for w in writers_str.split('|') if w.strip()] if writers_str else []
                            
                            # 优先使用movies.jsonl的genres，如果没有则使用CSV的genres
                            genres = genres_dict.get(movie_id, genres)
                            
                            movies.append({
                                "movieId": movie_id,
                                "_id": movie_id,
                                "title": title,
                                "genres": genres,
                                "plot": intro,
                                "year": year,
                                "rating": None,
                                "poster_url": poster_url,  # 使用CSV中的url字段
                                "poster_local": None,  # 不使用本地poster，直接用CSV的URL
                                "directors": directors,
                                "actors": actors,
                                "writers": writers,  # 新增
                                "time": time_str,  # 新增
                                "release_time": release_time,  # 新增
                            })
                            
                            if len(movies) <= 5:
                                print(f"示例电影 {len(movies)}: id={movie_id}, title={title}, poster_url={poster_url[:60] if poster_url else 'None'}...")
                        except Exception as e:
                            print(f"处理CSV行失败: {e}, id={row.get('id', 'unknown')}")
                            import traceback
                            traceback.print_exc()
                            continue
            except Exception as e:
                print(f"读取CSV文件失败: {e}")
                import traceback
                traceback.print_exc()
        else:
            print(f"错误: CSV文件不存在: {csv_path}")
            return []
        
        # 按ID排序
        movies.sort(key=lambda x: x["movieId"])
        print(f"成功读取 {len(movies)} 部电影")
        if len(movies) > 0:
            print(f"第一部电影示例: id={movies[0].get('movieId')}, title={movies[0].get('title')}, poster_url={movies[0].get('poster_url', '')[:60] if movies[0].get('poster_url') else 'None'}...")
        
        # 注意：这里不添加评分，因为_get_movies_from_local_posters返回的是所有电影
        # 评分会在调用这个方法后，在get方法中添加
        return movies
    
    def _add_ratings_to_movies(self, movies):
        """为电影列表添加评分信息（从数据库获取）"""
        if not movies:
            return movies
        
        ratings_coll = get_collection("ratings")
        comments_coll = get_collection("comments")
        
        # 获取所有电影ID
        movie_ids = [m.get("movieId") or m.get("_id") for m in movies]
        
        # 从ratings集合获取评分统计
        rating_pipeline = [
            {"$match": {"movieId": {"$in": movie_ids}, "is_active": True}},
            {"$group": {"_id": "$movieId", "count": {"$sum": 1}, "avg": {"$avg": "$rating"}}},
        ]
        rating_agg_results = list(ratings_coll.aggregate(rating_pipeline))
        
        # 从comments集合获取评分统计（只统计有评分且用户不在ratings集合中的评论）
        comment_pipeline = [
            {"$match": {"movieId": {"$in": movie_ids}, "is_active": True, "rating": {"$ne": None}}},
            {"$lookup": {
                "from": "ratings",
                "let": {"comment_user": "$userId", "comment_movie": "$movieId"},
                "pipeline": [
                    {"$match": {
                        "$expr": {
                            "$and": [
                                {"$eq": ["$userId", "$$comment_user"]},
                                {"$eq": ["$movieId", "$$comment_movie"]},
                                {"$eq": ["$is_active", True]}
                            ]
                        }
                    }}
                ],
                "as": "user_rating"
            }},
            {"$match": {"user_rating": {"$size": 0}}},
            {"$group": {"_id": "$movieId", "count": {"$sum": 1}, "avg": {"$avg": "$rating"}}},
        ]
        comment_agg_results = list(comments_coll.aggregate(comment_pipeline))
        
        # 合并评分数据
        movie_ratings = {}
        for res in rating_agg_results + comment_agg_results:
            movie_id = res["_id"]
            current_count = movie_ratings.get(movie_id, {"count": 0, "sum_rating": 0.0})
            movie_ratings[movie_id] = {
                "count": current_count["count"] + res["count"],
                "sum_rating": current_count["sum_rating"] + (res["avg"] * res["count"])
            }
        
        # 为每个电影添加评分信息
        for movie in movies:
            movie_id = movie.get("movieId") or movie.get("_id")
            if movie_id in movie_ratings:
                stats = movie_ratings[movie_id]
                if stats["count"] > 0:
                    movie["rating"] = round(stats["sum_rating"] / stats["count"], 2)
                    movie["rating_count"] = stats["count"]
                else:
                    movie["rating"] = None
                    movie["rating_count"] = 0
            else:
                movie["rating"] = None
                movie["rating_count"] = 0
        
        return movies
    
    def _get_movie_info_from_csv(self, csv_path, movie_id):
        """从CSV文件读取电影信息（使用缓存提高性能）"""
        import csv
        import re
        
        if not csv_path.exists():
            return {}
        
        # 使用类变量缓存CSV数据
        if not hasattr(self.__class__, '_csv_cache'):
            print(f"开始读取CSV文件: {csv_path}")
            self.__class__._csv_cache = {}
            count = 0
            try:
                with open(csv_path, 'r', encoding='utf-8') as f:
                    reader = csv.DictReader(f)
                    for row in reader:
                        try:
                            row_id = int(row.get('id', 0))
                            if row_id > 0:
                                name = row.get('name', '').strip()
                                year_match = re.search(r'\((\d{4})\)', name)
                                year = int(year_match.group(1)) if year_match else None
                                title = re.sub(r'\s*\(\d{4}\)\s*', '', name).strip()
                                
                                genres_str = row.get('genre', '')
                                genres = [g.strip() for g in genres_str.split('|') if g.strip()] if genres_str else []
                                
                                intro = row.get('intro', '').strip()
                                
                                # url字段是图片网址，CSV中可能用双引号包裹，需要正确处理
                                poster_url_raw = row.get('url', '').strip()
                                # 移除首尾的双引号（如果有）
                                if poster_url_raw.startswith('"') and poster_url_raw.endswith('"'):
                                    poster_url = poster_url_raw[1:-1]
                                else:
                                    poster_url = poster_url_raw
                                
                                directors_str = row.get('directors', '')
                                directors = [d.strip() for d in directors_str.split('|') if d.strip()] if directors_str else []
                                
                                actors_str = row.get('starts', '')  # 注意CSV中是starts不是actors
                                actors = [a.strip() for a in actors_str.split('|') if a.strip()] if actors_str else []
                                
                                # 读取其他字段
                                time_str = row.get('time', '').strip()
                                release_time = row.get('release_time', '').strip()
                                writers_str = row.get('writers', '')
                                writers = [w.strip() for w in writers_str.split('|') if w.strip()] if writers_str else []
                                
                                self.__class__._csv_cache[row_id] = {
                                    "title": title,
                                    "year": year,
                                    "genres": genres,
                                    "plot": intro,
                                    "poster_url": poster_url,  # 使用CSV中的url字段
                                    "directors": directors,
                                    "actors": actors,
                                    "writers": writers,  # 新增
                                    "time": time_str,  # 新增
                                    "release_time": release_time,  # 新增
                                }
                                count += 1
                                if count <= 5:  # 打印前5条用于调试
                                    print(f"示例记录 {count}: id={row_id}, title={title}, poster_url={poster_url[:50]}...")
                                if count % 1000 == 0:
                                    print(f"已缓存 {count} 条CSV记录...")
                        except Exception as e:
                            print(f"处理CSV行失败: {e}, row: {row.get('id', 'unknown')}")
                            continue
                print(f"CSV缓存完成，共 {len(self.__class__._csv_cache)} 条记录")
            except Exception as e:
                print(f"读取CSV失败: {e}")
                import traceback
                traceback.print_exc()
        
        result = self.__class__._csv_cache.get(movie_id, {})
        if not result and movie_id:
            print(f"警告: 在CSV中未找到movie_id={movie_id}的记录")
        return result


class MovieDetailView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("movie_id", openapi.IN_PATH, type=openapi.TYPE_INTEGER)]
    )
    def get(self, request, movie_id):
        print(f"MovieDetailView - 收到请求，movie_id={movie_id}, type={type(movie_id)}")
        
        collection = get_collection("movies")
        doc = collection.find_one({"_id": movie_id})
        
        if not doc:
            # 如果数据库没有，尝试从本地文件读取
            print(f"MovieDetailView - 数据库中未找到movie_id={movie_id}，尝试从CSV读取")
            
            # 尝试多种方法找到项目根目录
            current_file = Path(__file__).resolve()
            BASE_DIR = None
            
            # 方法1: 从views.py向上5级
            test_dir = current_file.parent.parent.parent.parent.parent
            if (test_dir / "data" / "reco_artifacts_2026-01-16" / "info" / "info.csv").exists():
                BASE_DIR = test_dir
            
            # 方法2: 从当前工作目录的父目录
            if not BASE_DIR:
                import os
                test_dir = Path(os.getcwd()).parent
                if (test_dir / "data" / "reco_artifacts_2026-01-16" / "info" / "info.csv").exists():
                    BASE_DIR = test_dir
            
            # 方法3: 从当前文件向上查找
            if not BASE_DIR:
                test_dir = current_file.parent
                for _ in range(10):
                    if (test_dir / "data" / "reco_artifacts_2026-01-16" / "info" / "info.csv").exists():
                        BASE_DIR = test_dir
                        break
                    parent = test_dir.parent
                    if parent == test_dir:  # 到达根目录
                        break
                    test_dir = parent
            
            if not BASE_DIR:
                print(f"MovieDetailView - 错误: 无法找到项目根目录")
                return Response({"detail": "无法找到数据文件"}, status=status.HTTP_404_NOT_FOUND)
            
            csv_path = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "info" / "info.csv"
            print(f"MovieDetailView - CSV路径: {csv_path}, 存在: {csv_path.exists()}")
            
            if csv_path.exists():
                movie_info = MovieListView()._get_movie_info_from_csv(csv_path, movie_id)
                print(f"MovieDetailView - 从CSV读取结果: {movie_info}")
                
                if not movie_info:
                    print(f"MovieDetailView - 警告: 在CSV中未找到movie_id={movie_id}的记录")
                    # 检查CSV缓存中是否有数据
                    if hasattr(MovieListView, '_csv_cache'):
                        print(f"MovieDetailView - CSV缓存中有 {len(MovieListView._csv_cache)} 条记录")
                        print(f"MovieDetailView - 缓存中的前5个ID: {list(MovieListView._csv_cache.keys())[:5]}")
                    return Response({"detail": f"电影不存在 (ID: {movie_id})"}, status=status.HTTP_404_NOT_FOUND)
                
                # 从movies.jsonl获取genres
                movies_jsonl_path = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "movies.jsonl"
                genres = movie_info.get("genres", [])
                if movies_jsonl_path.exists():
                    import json
                    import ast
                    try:
                        with open(movies_jsonl_path, 'r', encoding='utf-8') as f:
                            for line in f:
                                line = line.strip()
                                if not line:
                                    continue
                                try:
                                    movie_data = json.loads(line)
                                    line_movie_id = movie_data.get('movieId') or movie_data.get('_id') or movie_data.get('id')
                                    if line_movie_id == movie_id:
                                        genres_str = movie_data.get('genres', '')
                                        if genres_str:
                                            if isinstance(genres_str, str):
                                                if genres_str.startswith('[') and genres_str.endswith(']'):
                                                    genres_list = ast.literal_eval(genres_str)
                                                    genres = [g.strip() for g in genres_list if g]
                                                else:
                                                    genres = [g.strip() for g in genres_str.split('|') if g.strip()]
                                            elif isinstance(genres_str, list):
                                                genres = [g.strip() for g in genres_str if g]
                                        break
                                except (json.JSONDecodeError, ValueError, SyntaxError):
                                    continue
                    except Exception as e:
                        print(f"读取movies.jsonl失败: {e}")
                
                # 优先使用CSV中的poster_url
                poster_url = movie_info.get("poster_url", "")
                poster_local = None
                if not poster_url:
                    poster_dir = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "poster"
                    poster_file = poster_dir / f"{movie_id}.jpg"
                    if poster_file.exists():
                        poster_local = f"data/reco_artifacts_2026-01-16/poster/{poster_file.name}"
                
                movie = {
                    "movieId": movie_id,
                    "_id": movie_id,
                    "title": movie_info.get("title", f"Movie {movie_id}"),
                    "genres": genres,
                    "plot": movie_info.get("plot", ""),
                    "year": movie_info.get("year"),
                    "rating": None,
                    "poster_url": poster_url,
                    "poster_local": poster_local,
                    "directors": movie_info.get("directors", []),
                    "actors": movie_info.get("actors", []),
                    "writers": movie_info.get("writers", []),
                    "time": movie_info.get("time", ""),
                    "release_time": movie_info.get("release_time", ""),
                }
                
                # 添加评分信息（从数据库获取）
                movie_list_view = MovieListView()
                movies_with_rating = movie_list_view._add_ratings_to_movies([movie])
                if movies_with_rating:
                    movie = movies_with_rating[0]
                
                print(f"MovieDetailView - 成功返回电影数据: title={movie.get('title')}, movieId={movie.get('movieId')}, rating={movie.get('rating')}")
                return Response(movie)
            
            print(f"MovieDetailView - CSV文件不存在: {csv_path}")
            return Response({"detail": "数据文件不存在"}, status=status.HTTP_404_NOT_FOUND)
        
        movie = Movie.from_doc(doc)
        movie_dict = movie.to_dict()
        
        # 添加评分信息（从数据库获取）
        movie_list_view = MovieListView()
        movies_with_rating = movie_list_view._add_ratings_to_movies([movie_dict])
        if movies_with_rating:
            movie_dict = movies_with_rating[0]
        
        return Response(movie_dict)


class MovieSearchView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(
        manual_parameters=[
            openapi.Parameter("keyword", openapi.IN_QUERY, type=openapi.TYPE_STRING, required=False),
            openapi.Parameter("director", openapi.IN_QUERY, type=openapi.TYPE_STRING, required=False),
            openapi.Parameter("actor", openapi.IN_QUERY, type=openapi.TYPE_STRING, required=False),
            openapi.Parameter("plot", openapi.IN_QUERY, type=openapi.TYPE_STRING, required=False),
            openapi.Parameter("genres", openapi.IN_QUERY, type=openapi.TYPE_STRING, required=False, description="多个类型用逗号分隔"),
            openapi.Parameter("page", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=1),
            openapi.Parameter("page_size", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=20),
        ]
    )
    def get(self, request):
        keyword = request.query_params.get("keyword", "").strip()
        director = request.query_params.get("director", "").strip()
        actor = request.query_params.get("actor", "").strip()
        plot = request.query_params.get("plot", "").strip()
        genres_str = request.query_params.get("genres", "").strip()
        page = int(request.query_params.get("page", 1))
        page_size = min(int(request.query_params.get("page_size", 20)), 20)  # 每页最多20个
        
        print(f"MovieSearchView - 收到搜索请求:")
        print(f"  关键词: '{keyword}', 导演: '{director}', 演员: '{actor}', 简介: '{plot}', 类型: '{genres_str}'")
        print(f"  页码: {page}, 每页: {page_size}")
        
        # 解析类型（多个类型用逗号分隔）
        selected_genres = []
        if genres_str:
            selected_genres = [g.strip() for g in genres_str.split(',') if g.strip()]
        
        # 如果所有搜索条件都为空，返回空结果
        if not any([keyword, director, actor, plot, selected_genres]):
            print(f"MovieSearchView - 所有搜索条件为空，返回空结果")
            return Response({"count": 0, "page": page, "page_size": page_size, "results": []})
        
        # 先尝试从本地文件搜索（因为数据库可能为空）- 搜索所有电影
        all_movies = MovieListView()._get_movies_from_local_posters()
        print(f"MovieSearchView - 从本地文件读取到 {len(all_movies)} 部电影（全部电影）")
        
        # 联合搜索：所有条件必须同时满足（AND逻辑）
        filtered = []
        
        # 转换为小写用于匹配
        keyword_lower = keyword.lower() if keyword else None
        director_lower = director.lower() if director else None
        actor_lower = actor.lower() if actor else None
        plot_lower = plot.lower() if plot else None
        selected_genres_lower = [g.lower() for g in selected_genres] if selected_genres else []
        
        print(f"MovieSearchView - 开始联合搜索，总电影数: {len(all_movies)}")
        
        # 遍历所有电影进行联合匹配
        for idx, m in enumerate(all_movies):
            match_all = True  # 所有条件都必须满足
            
            # 1. 检查标题（电影名称）
            if keyword_lower:
                title = str(m.get("title", "")).strip()
                if not title or keyword_lower not in title.lower():
                    match_all = False
                    continue
            
            # 2. 检查导演
            if director_lower and match_all:
                directors = m.get("directors", [])
                if not directors:
                    match_all = False
                    continue
                director_match = any(director_lower in str(d).lower() for d in directors if d)
                if not director_match:
                    match_all = False
                    continue
            
            # 3. 检查演员
            if actor_lower and match_all:
                actors = m.get("actors", [])
                if not actors:
                    match_all = False
                    continue
                actor_match = any(actor_lower in str(a).lower() for a in actors if a)
                if not actor_match:
                    match_all = False
                    continue
            
            # 4. 检查简介/剧情
            if plot_lower and match_all:
                plot_text = str(m.get("plot", "")).strip()
                if not plot_text or plot_lower not in plot_text.lower():
                    match_all = False
                    continue
            
            # 5. 检查类型（严格匹配：必须包含所有选中的类型）
            if selected_genres_lower and match_all:
                movie_genres = m.get("genres", [])
                if not movie_genres:
                    match_all = False
                    continue
                movie_genres_lower = [str(g).lower() for g in movie_genres if g]
                # 电影必须包含所有选中的类型
                if not all(selected_genre in movie_genres_lower for selected_genre in selected_genres_lower):
                    match_all = False
                    continue
            
            # 如果所有条件都满足，添加到结果中
            if match_all:
                filtered.append(m)
                if len(filtered) <= 5:
                    print(f"MovieSearchView - 匹配: '{m.get('title')}' (ID: {m.get('movieId')})")
        
        print(f"MovieSearchView - 联合搜索找到 {len(filtered)} 部电影")
        if len(filtered) > 0:
            print(f"MovieSearchView - 前5个结果: {[m.get('title') for m in filtered[:5]]}")
        else:
            print(f"MovieSearchView - 未找到匹配的电影")
        
        total = len(filtered)
        # 分页处理
        start = (page - 1) * page_size
        end = min(start + page_size, total)
        items = filtered[start:end]
        print(f"MovieSearchView - 返回第 {page} 页，共 {len(items)} 部电影 (总数: {total}, start={start}, end={end})")
        
        return Response({"count": total, "page": page, "page_size": page_size, "results": items})


class GenreListView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    def get(self, request):
        import os
        current_file = Path(__file__).resolve()
        
        # 尝试多种方法找到项目根目录
        BASE_DIR = None
        
        # 方法1: 从views.py向上5级
        test_dir = current_file.parent.parent.parent.parent.parent
        if (test_dir / "data" / "reco_artifacts_2026-01-16" / "info" / "genre.txt").exists():
            BASE_DIR = test_dir
        
        # 方法2: 从当前工作目录的父目录
        if not BASE_DIR:
            test_dir = Path(os.getcwd()).parent
            if (test_dir / "data" / "reco_artifacts_2026-01-16" / "info" / "genre.txt").exists():
                BASE_DIR = test_dir
        
        # 方法3: 从当前文件向上查找
        if not BASE_DIR:
            test_dir = current_file.parent
            for _ in range(10):
                if (test_dir / "data" / "reco_artifacts_2026-01-16" / "info" / "genre.txt").exists():
                    BASE_DIR = test_dir
                    break
                parent = test_dir.parent
                if parent == test_dir:
                    break
                test_dir = parent
        
        genres = []
        
        # 优先从genre.txt读取（读取所有类型）
        genre_txt_path = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "info" / "genre.txt" if BASE_DIR else None
        if genre_txt_path and genre_txt_path.exists():
            try:
                print(f"从 {genre_txt_path} 读取类型...")
                with open(genre_txt_path, 'r', encoding='utf-8') as f:
                    genres = [line.strip() for line in f if line.strip()]
                print(f"从genre.txt读取到 {len(genres)} 个类型: {genres[:10]}...")
            except Exception as e:
                print(f"读取genre.txt失败: {e}")
        
        # 如果genre.txt读取失败，使用硬编码的所有类型（从genre.txt手动提取）
        if not genres:
            print("使用硬编码的类型列表（从genre.txt提取）")
            genres = [
                "Musical", "War", "Crime", "Romance", "Fantasy",
                "Drama", "Music", "Sci-Fi", "Action", "Comedy",
                "Biography", "Family", "Horror", "Short", "Documentary",
                "Film-Noir", "Animation", "Adventure", "News", "Mystery",
                "Sport", "History", "Thriller", "Western"
            ]
        
        print(f"最终返回 {len(genres)} 个类型")
        return Response({"results": genres})
