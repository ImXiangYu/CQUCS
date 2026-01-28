from rest_framework import serializers
from utils import validators


class CommentCreateSerializer(serializers.Serializer):
    movieId = serializers.IntegerField(required=True)
    content = serializers.CharField(required=False, min_length=5, max_length=1000, allow_blank=True)
    rating = serializers.FloatField(required=False, min_value=1.0, max_value=5.0)
    
    def validate(self, data):
        # 至少要有评论内容或评分
        if not data.get('content') and not data.get('rating'):
            raise serializers.ValidationError("至少需要提供评论内容或评分")
        return data

    def validate_rating(self, value):
        if value is not None:
            return validators.validate_rating(value)
        return value


class CommentUpdateSerializer(serializers.Serializer):
    content = serializers.CharField(required=False, min_length=5, max_length=1000)
    rating = serializers.FloatField(required=False, min_value=1.0, max_value=5.0)

    def validate_rating(self, value):
        if value is not None:
            return validators.validate_rating(value)
        return value

