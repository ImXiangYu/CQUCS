from django.urls import path

from apps.recommendations.views import (
    HybridRecommendationView,
    ItemBasedRecommendationView,
    NewReleaseView,
    SimilarMoviesView,
    TopRatedView,
    TrendingView,
    UserBasedRecommendationView,
)

urlpatterns = [
    path("item-based", ItemBasedRecommendationView.as_view()),
    path("user-based", UserBasedRecommendationView.as_view()),
    path("hybrid", HybridRecommendationView.as_view()),
    path("trending", TrendingView.as_view()),
    path("top-rated", TopRatedView.as_view()),
    path("similar", SimilarMoviesView.as_view()),
    path("new", NewReleaseView.as_view()),
]
