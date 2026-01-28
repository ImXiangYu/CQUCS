from datetime import datetime, timedelta, timezone
from typing import Any, Optional

import jwt
from django.conf import settings
from rest_framework import exceptions
from rest_framework.authentication import BaseAuthentication, get_authorization_header

from utils.database import get_collection


class MongoUser:
    def __init__(self, doc: dict[str, Any]):
        self.userId = doc.get("userId")
        self.username = doc.get("username")
        self.email = doc.get("email")
        self.preferences = doc.get("preferences", {})

    # DRF/Django expect primary key-like attributes on user objects
    @property
    def pk(self) -> int | None:
        return self.userId

    @property
    def id(self) -> int | None:
        return self.userId

    @property
    def is_authenticated(self) -> bool:  # django expects this attr
        return True

    def to_public_dict(self) -> dict[str, Any]:
        return {
            "userId": self.userId,
            "username": self.username,
            "email": self.email,
            "preferences": self.preferences,
        }


def create_access_token(payload: dict[str, Any]) -> str:
    exp = datetime.now(timezone.utc) + timedelta(minutes=settings.JWT_EXPIRE_MINUTES)
    data = {**payload, "exp": exp}
    return jwt.encode(data, settings.JWT_SECRET, algorithm=settings.JWT_ALGORITHM)


def decode_token(token: str) -> dict[str, Any]:
    try:
        return jwt.decode(token, settings.JWT_SECRET, algorithms=[settings.JWT_ALGORITHM])
    except jwt.ExpiredSignatureError as exc:
        raise exceptions.AuthenticationFailed("Token已过期") from exc
    except jwt.InvalidTokenError as exc:  # noqa: B904
        raise exceptions.AuthenticationFailed("Token无效") from exc


class MongoJWTAuthentication(BaseAuthentication):
    keyword = "Bearer"

    def authenticate(self, request):
        auth = get_authorization_header(request).decode("utf-8")
        if not auth:
            return None
        if not auth.startswith(f"{self.keyword} "):
            raise exceptions.AuthenticationFailed("认证头格式错误")
        token = auth.split(" ", 1)[1]
        payload = decode_token(token)
        user_id = payload.get("userId")
        if user_id is None:
            raise exceptions.AuthenticationFailed("Token缺少用户标识")
        user_doc = get_collection("users").find_one({"userId": user_id})
        if not user_doc:
            raise exceptions.AuthenticationFailed("用户不存在或已删除")
        return MongoUser(user_doc), None

    def authenticate_header(self, request) -> Optional[str]:
        return self.keyword
