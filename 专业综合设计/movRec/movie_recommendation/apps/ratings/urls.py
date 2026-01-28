from django.urls import path

from apps.ratings.views import MovieRatingStatsView, RatingCreateView, RatingDetailView, UserRatingsView

urlpatterns = [
    path("", RatingCreateView.as_view()),
    path("user", UserRatingsView.as_view()),
    path("movie/<int:movie_id>", MovieRatingStatsView.as_view()),
    path("<str:rating_id>", RatingDetailView.as_view()),
]
