from django.urls import path

from apps.core.views import HealthView, MetricsView

urlpatterns = [
    path("health", HealthView.as_view()),
    path("metrics", MetricsView.as_view()),
]
