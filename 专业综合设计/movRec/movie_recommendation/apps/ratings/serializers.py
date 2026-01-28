from rest_framework import serializers

from utils.validators import validate_rating


class RatingCreateSerializer(serializers.Serializer):
    movieId = serializers.IntegerField()
    rating = serializers.FloatField()

    def validate_rating(self, value: float) -> float:
        return validate_rating(value)


class RatingUpdateSerializer(serializers.Serializer):
    rating = serializers.FloatField()

    def validate_rating(self, value: float) -> float:
        return validate_rating(value)
