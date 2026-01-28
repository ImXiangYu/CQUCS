from django.urls import path

from apps.comments.views import (
    CommentCreateView,
    CommentDetailView,
    MovieCommentsView,
    UserCommentsView,
)

urlpatterns = [
    path("", CommentCreateView.as_view()),
    path("user", UserCommentsView.as_view()),
    path("movie/<int:movie_id>", MovieCommentsView.as_view()),
    path("<str:comment_id>", CommentDetailView.as_view()),
]

