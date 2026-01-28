from django.urls import path

from apps.movies.views import GenreListView, MovieDetailView, MovieListView, MovieSearchView

urlpatterns = [
    path("", MovieListView.as_view()),
    path("search", MovieSearchView.as_view()),
    path("genres", GenreListView.as_view()),
    path("<int:movie_id>", MovieDetailView.as_view()),
]
