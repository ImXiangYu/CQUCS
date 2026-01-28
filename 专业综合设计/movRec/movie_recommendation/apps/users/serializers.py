from typing import Any

from rest_framework import serializers

from utils import validators


class RegisterSerializer(serializers.Serializer):
    username = serializers.CharField(required=True)
    email = serializers.EmailField(required=True)
    password = serializers.CharField(write_only=True, min_length=6)

    def validate_username(self, value: str) -> str:
        try:
            validators.validate_username(value)
        except ValueError as e:
            from rest_framework import serializers as drf_serializers
            raise drf_serializers.ValidationError(str(e))
        return value

    def validate_email(self, value: str) -> str:
        try:
            validators.validate_email(value)
        except ValueError as e:
            from rest_framework import serializers as drf_serializers
            raise drf_serializers.ValidationError(str(e))
        return value


class LoginSerializer(serializers.Serializer):
    username = serializers.CharField(required=True)
    password = serializers.CharField(write_only=True, required=True)


class ProfileUpdateSerializer(serializers.Serializer):
    email = serializers.EmailField(required=False)
    password = serializers.CharField(write_only=True, min_length=6, required=False)
    favorite_genres = serializers.ListField(
        child=serializers.CharField(), required=False, allow_empty=True
    )
    excluded_genres = serializers.ListField(
        child=serializers.CharField(), required=False, allow_empty=True
    )

    def validate_email(self, value: str) -> str:
        validators.validate_email(value)
        return value

    def validate(self, attrs: dict[str, Any]) -> dict[str, Any]:
        prefs = {}
        if "favorite_genres" in attrs:
            prefs.setdefault("favorite_genres", attrs.pop("favorite_genres"))
        if "excluded_genres" in attrs:
            prefs.setdefault("excluded_genres", attrs.pop("excluded_genres"))
        attrs["preferences"] = prefs
        return attrs
