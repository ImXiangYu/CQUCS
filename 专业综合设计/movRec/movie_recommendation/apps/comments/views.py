from bson import ObjectId
from drf_yasg.utils import swagger_auto_schema
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from apps.comments.models import Comment
from apps.comments.serializers import CommentCreateSerializer, CommentUpdateSerializer
from utils.database import get_collection
from utils.helpers import now_utc


class CommentCreateView(APIView):
    @swagger_auto_schema(request_body=CommentCreateSerializer)
    def post(self, request):
        serializer = CommentCreateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data
        user = request.user
        comments = get_collection("comments")
        ratings = get_collection("ratings")

        # 检查是否已经评论过（每个用户每个电影只能评论一次）
        existing_comment = comments.find_one({
            "userId": user.userId, 
            "movieId": data["movieId"],
            "is_active": True
        })
        
        if existing_comment:
            # 如果已存在评论，更新评论内容
            # 如果没有评论内容但有评分，使用默认评论
            content = data.get("content", "").strip() if data.get("content") else "（仅评分）"
            updates = {
                "content": content,
                "text": content,  # 兼容旧字段名
                "timestamp": now_utc(),
            }
            # 如果评论中包含评分，也更新评分
            if data.get("rating") is not None:
                updates["rating"] = data["rating"]
                # 同时更新或创建ratings集合中的评分
                existing_rating = ratings.find_one({
                    "userId": user.userId,
                    "movieId": data["movieId"]
                })
                if existing_rating:
                    ratings.update_one(
                        {"_id": existing_rating["_id"]},
                        {"$set": {"rating": data["rating"], "timestamp": now_utc(), "is_active": True}}
                    )
                else:
                    ratings.insert_one({
                        "userId": user.userId,
                        "movieId": data["movieId"],
                        "rating": data["rating"],
                        "timestamp": now_utc(),
                        "is_active": True,
                    })
            
            comments.update_one({"_id": existing_comment["_id"]}, {"$set": updates})
            new_doc = comments.find_one({"_id": existing_comment["_id"]})
            return Response(Comment.from_doc(new_doc).to_dict(), status=status.HTTP_200_OK)

        # 创建新评论
        # 如果没有评论内容但有评分，使用默认评论
        content = data.get("content", "").strip() if data.get("content") else "（仅评分）"
        doc = {
            "userId": user.userId,
            "movieId": data["movieId"],
            "content": content,
            "text": content,  # 兼容旧字段名
            "rating": data.get("rating"),
            "timestamp": now_utc(),
            "is_active": True,
        }
        
        # 如果评论中包含评分，同时创建或更新ratings集合中的评分
        if data.get("rating") is not None:
            existing_rating = ratings.find_one({
                "userId": user.userId,
                "movieId": data["movieId"]
            })
            if existing_rating:
                ratings.update_one(
                    {"_id": existing_rating["_id"]},
                    {"$set": {"rating": data["rating"], "timestamp": now_utc(), "is_active": True}}
                )
            else:
                ratings.insert_one({
                    "userId": user.userId,
                    "movieId": data["movieId"],
                    "rating": data["rating"],
                    "timestamp": now_utc(),
                    "is_active": True,
                })
        
        res = comments.insert_one(doc)
        doc["_id"] = res.inserted_id
        return Response(Comment.from_doc(doc).to_dict(), status=status.HTTP_201_CREATED)


class CommentDetailView(APIView):
    @swagger_auto_schema(request_body=CommentUpdateSerializer)
    def put(self, request, comment_id: str):
        serializer = CommentUpdateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data
        comments = get_collection("comments")
        
        try:
            oid = ObjectId(comment_id)
        except Exception:
            return Response({"detail": "评论ID无效"}, status=status.HTTP_400_BAD_REQUEST)
        
        doc = comments.find_one({"_id": oid, "userId": request.user.userId})
        if not doc:
            return Response({"detail": "评论不存在"}, status=status.HTTP_404_NOT_FOUND)
        
        updates = {}
        if "content" in data:
            updates["content"] = data["content"]
        if "rating" in data:
            updates["rating"] = data["rating"]
        
        if updates:
            updates["timestamp"] = now_utc()
            comments.update_one({"_id": oid}, {"$set": updates})
        
        new_doc = comments.find_one({"_id": oid})
        return Response(Comment.from_doc(new_doc).to_dict())

    def delete(self, request, comment_id: str):
        comments = get_collection("comments")
        try:
            oid = ObjectId(comment_id)
        except Exception:
            return Response({"detail": "评论ID无效"}, status=status.HTTP_400_BAD_REQUEST)
        
        doc = comments.find_one({"_id": oid, "userId": request.user.userId})
        if not doc:
            return Response({"detail": "评论不存在"}, status=status.HTTP_404_NOT_FOUND)
        
        comments.update_one({"_id": oid}, {"$set": {"is_active": False}})
        return Response(status=status.HTTP_204_NO_CONTENT)


class MovieCommentsView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    def get(self, request, movie_id: int):
        page = int(request.query_params.get("page", 1))
        page_size = min(int(request.query_params.get("page_size", 20)), 100)
        comments = get_collection("comments")
        users = get_collection("users")
        
        query = {"movieId": movie_id, "is_active": True}
        total = comments.count_documents(query)
        cursor = (
            comments.find(query)
            .sort("timestamp", -1)
            .skip((page - 1) * page_size)
            .limit(page_size)
        )
        
        items = []
        for doc in cursor:
            comment = Comment.from_doc(doc).to_dict()
            # 获取用户名
            user_doc = users.find_one({"userId": doc.get("userId")})
            if user_doc:
                comment["username"] = user_doc.get("username", "匿名用户")
            else:
                comment["username"] = "匿名用户"
            items.append(comment)
        
        return Response({"count": total, "page": page, "page_size": page_size, "results": items})


class UserCommentsView(APIView):
    def get(self, request):
        page = int(request.query_params.get("page", 1))
        page_size = min(int(request.query_params.get("page_size", 20)), 100)
        comments = get_collection("comments")
        
        query = {"userId": request.user.userId, "is_active": True}
        total = comments.count_documents(query)
        cursor = (
            comments.find(query)
            .sort("timestamp", -1)
            .skip((page - 1) * page_size)
            .limit(page_size)
        )
        
        items = [Comment.from_doc(doc).to_dict() for doc in cursor]
        return Response({"count": total, "page": page, "page_size": page_size, "results": items})

