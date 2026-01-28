from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions
from pathlib import Path

from apps.recommendations.views import BatchRecommendView

schema_view = get_schema_view(
    openapi.Info(
        title="Movie Recommendation API",
        default_version="v1",
        description="RESTful APIs for movie recommendation platform",
    ),
    public=True,
    permission_classes=[permissions.AllowAny],
)

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include("apps.core.urls")),
    path("api/auth/", include("apps.users.urls")),
    path("api/movies/", include("apps.movies.urls")),
    path("api/ratings/", include("apps.ratings.urls")),
    path("api/comments/", include("apps.comments.urls")),
    path("api/recommendations/", include("apps.recommendations.urls")),
    path("api/batch/recommend", BatchRecommendView.as_view()),
    path("api/docs/", schema_view.with_ui("swagger", cache_timeout=0), name="schema-swagger-ui"),
    path("api/redoc/", schema_view.with_ui("redoc", cache_timeout=0), name="schema-redoc"),
]

# 开发模式下提供poster和background静态文件服务
if settings.DEBUG:
    BASE_DIR = Path(__file__).resolve().parent.parent.parent
    
    # poster目录（项目根目录）
    poster_dir = BASE_DIR / "poster"
    if poster_dir.exists():
        urlpatterns += static("/poster/", document_root=str(poster_dir))
    
    # data/reco_artifacts_2026-01-16/poster目录
    data_poster_dir = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "poster"
    if data_poster_dir.exists():
        urlpatterns += static("/data/reco_artifacts_2026-01-16/poster/", document_root=str(data_poster_dir))
    
    # data/reco_artifacts_2026-01-16/background目录
    data_background_dir = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "background"
    if data_background_dir.exists():
        urlpatterns += static("/data/reco_artifacts_2026-01-16/background/", document_root=str(data_background_dir))
