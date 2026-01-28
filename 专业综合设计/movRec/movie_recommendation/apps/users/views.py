from django.contrib.auth.hashers import check_password, make_password
from drf_yasg.utils import swagger_auto_schema
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from apps.users.models import User
from apps.users.serializers import LoginSerializer, ProfileUpdateSerializer, RegisterSerializer
from utils.auth import MongoUser, create_access_token
from utils.database import get_collection
from utils.helpers import generate_int_id, now_utc


class RegisterView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(request_body=RegisterSerializer, responses={201: "Created", 400: "Bad Request"})
    def post(self, request):
        try:
            serializer = RegisterSerializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            data = serializer.validated_data
            users = get_collection("users")

            # 检查用户名是否已存在
            if users.find_one({"username": data["username"]}):
                return Response({"detail": "用户名已存在"}, status=status.HTTP_400_BAD_REQUEST)
            
            # 检查邮箱是否已注册
            if users.find_one({"email": data["email"]}):
                return Response({"detail": "邮箱已注册"}, status=status.HTTP_400_BAD_REQUEST)

            # 创建用户文档
            user_doc = {
                "userId": generate_int_id(users, "userId"),
                "username": data["username"],
                "email": data["email"],
                "password_hash": make_password(data["password"]),
                "preferences": {},
                "created_at": now_utc(),
                "last_login": now_utc(),
            }
            
            # 插入用户
            result = users.insert_one(user_doc)
            if not result.inserted_id:
                return Response({"detail": "注册失败，请稍后重试"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            
            # 生成token
            token = create_access_token({"userId": user_doc["userId"], "username": user_doc["username"]})
            return Response({"token": token, "user": User.from_doc(user_doc).to_public()}, status=status.HTTP_201_CREATED)
        
        except Exception as e:
            import traceback
            print(f"注册错误: {e}")
            print(traceback.format_exc())
            return Response({"detail": f"注册失败: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class LoginView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    @swagger_auto_schema(request_body=LoginSerializer, responses={200: "OK", 400: "Bad Request"})
    def post(self, request):
        try:
            serializer = LoginSerializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            data = serializer.validated_data
            users = get_collection("users")
            
            # 查找用户
            doc = users.find_one({"username": data["username"]})
            if not doc:
                return Response({"detail": "用户名或密码错误"}, status=status.HTTP_400_BAD_REQUEST)
            
            # 验证密码
            password_hash = doc.get("password_hash", "")
            if not password_hash or not check_password(data["password"], password_hash):
                return Response({"detail": "用户名或密码错误"}, status=status.HTTP_400_BAD_REQUEST)
            
            # 更新最后登录时间
            users.update_one({"_id": doc["_id"]}, {"$set": {"last_login": now_utc()}})
            
            # 生成token
            token = create_access_token({"userId": doc["userId"], "username": doc["username"]})
            return Response({"token": token, "user": User.from_doc(doc).to_public()})
        
        except Exception as e:
            import traceback
            print(f"登录错误: {e}")
            print(traceback.format_exc())
            return Response({"detail": f"登录失败: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class ProfileView(APIView):
    def get(self, request):
        user: MongoUser = request.user
        return Response(user.to_public_dict())

    @swagger_auto_schema(request_body=ProfileUpdateSerializer)
    def put(self, request):
        serializer = ProfileUpdateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data
        user: MongoUser = request.user
        users = get_collection("users")

        updates: dict[str, object] = {}
        if "email" in data:
            if users.find_one({"email": data["email"], "userId": {"$ne": user.userId}}):
                return Response({"detail": "邮箱已被使用"}, status=status.HTTP_400_BAD_REQUEST)
            updates["email"] = data["email"]
        if "password" in data:
            updates["password_hash"] = make_password(data["password"])
        prefs = data.get("preferences") or {}
        if prefs:
            updates["preferences"] = {
                "favorite_genres": prefs.get("favorite_genres", user.preferences.get("favorite_genres", [])),
                "excluded_genres": prefs.get("excluded_genres", user.preferences.get("excluded_genres", [])),
            }
        if not updates:
            return Response({"detail": "无可更新字段"}, status=status.HTTP_400_BAD_REQUEST)
        updates["last_login"] = now_utc()
        users.update_one({"userId": user.userId}, {"$set": updates})
        doc = users.find_one({"userId": user.userId})
        return Response(User.from_doc(doc).to_public())
