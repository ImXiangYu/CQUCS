from django.http import JsonResponse
from rest_framework.views import APIView

from utils.database import get_mongo_client


class HealthView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    def get(self, request):
        client = get_mongo_client()
        try:
            client.admin.command("ping")
            mongo_ok = True
        except Exception:
            mongo_ok = False
        return JsonResponse({"status": "ok" if mongo_ok else "degraded", "mongo": mongo_ok})


class MetricsView(APIView):
    authentication_classes: list = []
    permission_classes: list = []

    def get(self, request):
        return JsonResponse(
            {
                "service": "movie-recommendation",
                "version": "v1",
                "mongo_pool_size": getattr(get_mongo_client(), "max_pool_size", None),
            }
        )
