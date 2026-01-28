from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from apps.recommendations.algorithms.collaborative_filtering import (
    hybrid_recommendation,
    user_based_recommendation,
)
from apps.recommendations.algorithms.item_based import item_based_recommendation
from utils.database import get_collection


class SimilarMoviesView(APIView):
    """根据item_sim_topk.jsonl获取相似电影"""
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("movie_id", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, required=True)]
    )
    def get(self, request):
        movie_id = int(request.query_params.get("movie_id", 0))
        if not movie_id:
            return Response({"detail": "请提供movie_id"}, status=status.HTTP_400_BAD_REQUEST)
        
        from pathlib import Path
        BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent.parent
        item_sim_path = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "item_sim_topk.jsonl"
        
        similar_movie_ids = []
        if item_sim_path.exists():
            import json
            try:
                with open(item_sim_path, 'r', encoding='utf-8') as f:
                    for line in f:
                        line = line.strip()
                        if not line:
                            continue
                        try:
                            data = json.loads(line)
                            if data.get('_id') == movie_id:
                                sims = data.get('sims', [])
                                # 按相似度排序，取前20个
                                sims.sort(key=lambda x: x.get('sim', 0), reverse=True)
                                similar_movie_ids = [s.get('mid') for s in sims[:20] if s.get('mid')]
                                break
                        except (json.JSONDecodeError, ValueError, TypeError):
                            continue
            except Exception as e:
                print(f"读取item_sim_topk.jsonl失败: {e}")
        
        # 获取相似电影的详细信息
        from apps.movies.views import MovieListView
        all_movies = MovieListView()._get_movies_from_local_posters()
        similar_movies = [m for m in all_movies if m.get("movieId") in similar_movie_ids]
        # 按相似度顺序排序
        similar_movies.sort(key=lambda x: similar_movie_ids.index(x.get("movieId")) if x.get("movieId") in similar_movie_ids else 999)
        
        # 添加评分信息
        movie_list_view = MovieListView()
        similar_movies = movie_list_view._add_ratings_to_movies(similar_movies)
        
        return Response({"results": similar_movies})


class ItemBasedRecommendationView(APIView):
    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("top", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=10)]
    )
    def get(self, request):
        top_n = int(request.query_params.get("top", 10))
        recs = item_based_recommendation(request.user.userId, top_n=top_n)
        
        # 获取推荐电影的详细信息（包括评分）
        from apps.movies.views import MovieListView
        all_movies = MovieListView()._get_movies_from_local_posters()
        all_movies_dict = {m.get("movieId"): m for m in all_movies}
        
        results = []
        for rec in recs:
            movie_id = rec.get("movieId")
            movie_info = all_movies_dict.get(movie_id)
            
            if movie_info:
                # 保留推荐原因和相似度分数（但不作为rating显示）
                movie_info["reason"] = rec.get("reason", "")
                movie_info["similarity_score"] = rec.get("score", 0)
                results.append(movie_info)
            else:
                # 如果本地没有，尝试从数据库获取
                movies = get_collection("movies")
                doc = movies.find_one({"_id": movie_id})
                if doc:
                    results.append({
                        "movieId": doc.get("_id"),
                        "title": doc.get("title"),
                        "genres": doc.get("genres", []),
                        "plot": doc.get("plot", ""),
                        "year": doc.get("year"),
                        "rating": None,
                        "poster_url": doc.get("poster_url"),
                        "poster_local": doc.get("poster_local"),
                        "reason": rec.get("reason", ""),
                        "similarity_score": rec.get("score", 0)
                    })
        
        # 使用统一的方法添加评分信息
        movie_list_view = MovieListView()
        results = movie_list_view._add_ratings_to_movies(results)
        
        return Response({"userId": request.user.userId, "results": results})


class UserBasedRecommendationView(APIView):
    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("top", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=10)]
    )
    def get(self, request):
        top_n = int(request.query_params.get("top", 10))
        recs = user_based_recommendation(request.user.userId, top_n=top_n)
        return Response({"userId": request.user.userId, "results": recs})


class HybridRecommendationView(APIView):
    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("top", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=10)]
    )
    def get(self, request):
        top_n = int(request.query_params.get("top", 10))
        recs = hybrid_recommendation(request.user.userId, top_n=top_n)
        return Response({"userId": request.user.userId, "results": recs})


class TopRatedView(APIView):
    """热门电影推荐（基于所有人评分）"""
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("top", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=50)]
    )
    def get(self, request):
        top_n = int(request.query_params.get("top", 50))
        ratings = get_collection("ratings")
        comments = get_collection("comments")
        
        # 从ratings集合获取所有评分统计
        rating_pipeline = [
            {"$match": {"is_active": True}},
            {"$group": {
                "_id": "$movieId", 
                "count": {"$sum": 1}, 
                "avg": {"$avg": "$rating"},
                "total_score": {"$sum": "$rating"}
            }},
        ]
        rating_agg = list(ratings.aggregate(rating_pipeline))
        
        # 从comments集合获取带评分的评论（只统计有评分的评论，且该用户没有在ratings中评分）
        comment_pipeline = [
            {"$match": {"is_active": True, "rating": {"$ne": None}}},
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
            {"$match": {"user_rating": {"$size": 0}}},  # 只统计在ratings中没有评分的用户
            {"$group": {
                "_id": "$movieId",
                "count": {"$sum": 1},
                "avg": {"$avg": "$rating"},
                "total_score": {"$sum": "$rating"}
            }},
        ]
        comment_agg = list(comments.aggregate(comment_pipeline))
        
        # 合并两个集合的评分数据
        movie_stats = {}
        for doc in rating_agg:
            movie_id = doc.get("_id")
            movie_stats[movie_id] = {
                "count": doc.get("count", 0),
                "avg": doc.get("avg", 0.0),
                "total_score": doc.get("total_score", 0.0)
            }
        
        for doc in comment_agg:
            movie_id = doc.get("_id")
            if movie_id in movie_stats:
                # 合并数据
                old_count = movie_stats[movie_id]["count"]
                old_avg = movie_stats[movie_id]["avg"]
                old_total = movie_stats[movie_id]["total_score"]
                new_count = doc.get("count", 0)
                new_avg = doc.get("avg", 0.0)
                new_total = doc.get("total_score", 0.0)
                total_count = old_count + new_count
                total_score = old_total + new_total
                movie_stats[movie_id] = {
                    "count": total_count,
                    "avg": total_score / total_count if total_count > 0 else 0.0,
                    "total_score": total_score
                }
            else:
                movie_stats[movie_id] = {
                    "count": doc.get("count", 0),
                    "avg": doc.get("avg", 0.0),
                    "total_score": doc.get("total_score", 0.0)
                }
        
        # 按评分和数量排序（优先考虑评分，其次考虑评分数量）
        sorted_movies = sorted(
            movie_stats.items(),
            key=lambda x: (x[1]["avg"], x[1]["count"]),
            reverse=True
        )[:top_n]
        
        # 获取电影详细信息
        from apps.movies.views import MovieListView
        all_movies = MovieListView()._get_movies_from_local_posters()
        all_movies_dict = {m.get("movieId"): m for m in all_movies}
        
        results = []
        for movie_id, stats in sorted_movies:
            movie_info = all_movies_dict.get(movie_id)
            if movie_info:
                # 使用统计的评分数据
                movie_info["rating"] = round(stats["avg"], 2) if stats["avg"] > 0 else None
                movie_info["rating_count"] = stats["count"]
                movie_info["score"] = round(stats["avg"], 2)
                movie_info["popularity"] = stats["count"]
                movie_info["reason"] = "热门推荐"
                results.append(movie_info)
            else:
                # 如果本地没有，尝试从数据库获取
                movies = get_collection("movies")
                doc = movies.find_one({"_id": movie_id})
                if doc:
                    results.append({
                        "movieId": doc.get("_id"),
                        "title": doc.get("title"),
                        "genres": doc.get("genres", []),
                        "plot": doc.get("plot", ""),
                        "year": doc.get("year"),
                        "rating": round(stats["avg"], 2) if stats["avg"] > 0 else None,
                        "rating_count": stats["count"],
                        "poster_url": doc.get("poster_url"),
                        "poster_local": doc.get("poster_local"),
                        "score": round(stats["avg"], 2),
                        "popularity": stats["count"],
                        "reason": "热门推荐"
                    })
        
        print(f"返回 {len(results)} 部热门电影（基于评分）")
        return Response({"results": results})


class TrendingView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("top", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=10)]
    )
    def get(self, request):
        top_n = int(request.query_params.get("top", 10))
        ratings = get_collection("ratings")
        pipeline = [
            {"$match": {"is_active": True}},
            {"$group": {"_id": "$movieId", "count": {"$sum": 1}, "avg": {"$avg": "$rating"}}},
            {"$sort": {"count": -1, "avg": -1}},
            {"$limit": top_n},
        ]
        agg = list(ratings.aggregate(pipeline))
        results = [
            {"movieId": doc.get("_id"), "score": doc.get("avg", 0.0), "popularity": doc.get("count", 0)}
            for doc in agg
        ]
        return Response({"results": results})


class NewReleaseView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(
        manual_parameters=[openapi.Parameter("top", openapi.IN_QUERY, type=openapi.TYPE_INTEGER, default=10)]
    )
    def get(self, request):
        top_n = int(request.query_params.get("top", 10))
        movies = get_collection("movies")
        cursor = movies.find().sort("_id", -1).limit(top_n)
        results = [{"movieId": doc.get("_id"), "title": doc.get("title"), "genres": doc.get("genres", [])} for doc in cursor]
        return Response({"results": results})


class BatchRecommendView(APIView):
    def post(self, request):
        # Placeholder for batch offline task integration (e.g., Celery, Spark)
        return Response({"detail": "批量任务触发待实现"}, status=status.HTTP_202_ACCEPTED)
