from bson import ObjectId
from drf_yasg.utils import swagger_auto_schema
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from apps.ratings.models import Rating
from apps.ratings.serializers import RatingCreateSerializer, RatingUpdateSerializer
from utils.database import get_collection
from utils.helpers import now_utc


class RatingCreateView(APIView):
    @swagger_auto_schema(request_body=RatingCreateSerializer)
    def post(self, request):
        serializer = RatingCreateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data
        user = request.user
        ratings = get_collection("ratings")
        comments = get_collection("comments")

        # 检查是否已经评分过（每个用户每个电影只能评分一次）
        existing = ratings.find_one({"userId": user.userId, "movieId": data["movieId"]})
        if existing:
            # 如果已存在评分，更新评分
            ratings.update_one(
                {"_id": existing["_id"]},
                {"$set": {"rating": data["rating"], "timestamp": now_utc(), "is_active": True}},
            )
            # 如果该用户有评论，也更新评论中的评分
            existing_comment = comments.find_one({
                "userId": user.userId,
                "movieId": data["movieId"],
                "is_active": True
            })
            if existing_comment:
                comments.update_one(
                    {"_id": existing_comment["_id"]},
                    {"$set": {"rating": data["rating"], "timestamp": now_utc()}}
                )
            doc = ratings.find_one({"_id": existing["_id"]})
            return Response(Rating.from_doc(doc).to_dict(), status=status.HTTP_200_OK)

        # 创建新评分
        doc = {
            "userId": user.userId,
            "movieId": data["movieId"],
            "rating": data["rating"],
            "timestamp": now_utc(),
            "is_active": True,
        }
        res = ratings.insert_one(doc)
        doc["_id"] = res.inserted_id
        return Response(Rating.from_doc(doc).to_dict(), status=status.HTTP_201_CREATED)


class RatingDetailView(APIView):
    @swagger_auto_schema(request_body=RatingUpdateSerializer)
    def put(self, request, rating_id: str):
        serializer = RatingUpdateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        rating_value = serializer.validated_data["rating"]
        ratings = get_collection("ratings")
        try:
            oid = ObjectId(rating_id)
        except Exception:
            return Response({"detail": "评分ID无效"}, status=status.HTTP_400_BAD_REQUEST)
        doc = ratings.find_one({"_id": oid, "userId": request.user.userId})
        if not doc:
            return Response({"detail": "评分不存在"}, status=status.HTTP_404_NOT_FOUND)
        ratings.update_one({"_id": oid}, {"$set": {"rating": rating_value, "timestamp": now_utc()}})
        new_doc = ratings.find_one({"_id": oid})
        return Response(Rating.from_doc(new_doc).to_dict())

    def delete(self, request, rating_id: str):
        ratings = get_collection("ratings")
        try:
            oid = ObjectId(rating_id)
        except Exception:
            return Response({"detail": "评分ID无效"}, status=status.HTTP_400_BAD_REQUEST)
        doc = ratings.find_one({"_id": oid, "userId": request.user.userId})
        if not doc:
            return Response({"detail": "评分不存在"}, status=status.HTTP_404_NOT_FOUND)
        ratings.update_one({"_id": oid}, {"$set": {"is_active": False}})
        return Response(status=status.HTTP_204_NO_CONTENT)


class UserRatingsView(APIView):
    def get(self, request):
        page = int(request.query_params.get("page", 1))
        page_size = min(int(request.query_params.get("page_size", 20)), 100)
        ratings = get_collection("ratings")
        query = {"userId": request.user.userId, "is_active": True}
        total = ratings.count_documents(query)
        cursor = (
            ratings.find(query)
            .sort("timestamp", -1)
            .skip((page - 1) * page_size)
            .limit(page_size)
        )
        items = [Rating.from_doc(doc).to_dict() for doc in cursor]
        return Response({"count": total, "page": page, "page_size": page_size, "results": items})


class MovieRatingStatsView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    def get(self, request, movie_id: int):
        ratings = get_collection("ratings")
        comments = get_collection("comments")
        
        # 从ratings集合获取评分
        rating_pipeline = [
            {"$match": {"movieId": movie_id, "is_active": True}},
            {"$group": {"_id": "$movieId", "count": {"$sum": 1}, "avg": {"$avg": "$rating"}}},
        ]
        rating_agg = list(ratings.aggregate(rating_pipeline))
        
        # 从comments集合获取带评分的评论（只统计有评分的评论，且该用户没有在ratings中评分）
        comment_pipeline = [
            {"$match": {"movieId": movie_id, "is_active": True, "rating": {"$ne": None}}},
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
                "avg": {"$avg": "$rating"}
            }},
        ]
        comment_agg = list(comments.aggregate(comment_pipeline))
        
        # 合并两个集合的评分数据
        total_count = 0
        total_sum = 0.0
        
        if rating_agg:
            rating_result = rating_agg[0]
            rating_count = rating_result.get("count", 0)
            rating_avg = rating_result.get("avg", 0.0)
            total_count += rating_count
            total_sum += rating_avg * rating_count
        
        if comment_agg:
            comment_result = comment_agg[0]
            comment_count = comment_result.get("count", 0)
            comment_avg = comment_result.get("avg", 0.0)
            total_count += comment_count
            total_sum += comment_avg * comment_count
        
        if total_count == 0:
            return Response({"movieId": movie_id, "count": 0, "avg": None})
        
        final_avg = total_sum / total_count if total_count > 0 else 0.0
        return Response({
            "movieId": movie_id,
            "count": total_count,
            "avg": round(final_avg, 3)
        })
