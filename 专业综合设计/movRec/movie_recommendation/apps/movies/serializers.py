from rest_framework import serializers


class MovieSerializer(serializers.Serializer):
    movieId = serializers.IntegerField()
    title = serializers.CharField()
    genres = serializers.ListField(child=serializers.CharField())
