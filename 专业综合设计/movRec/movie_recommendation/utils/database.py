import threading
from typing import Any

from django.conf import settings
from pymongo import MongoClient

_client_lock = threading.Lock()
_client: MongoClient | None = None


def get_mongo_client() -> MongoClient:
    global _client
    if _client:
        return _client
    with _client_lock:
        if _client is None:
            _client = MongoClient(settings.MONGO_URI, appname="movie-recommendation")
    return _client


def get_db():
    return get_mongo_client()[settings.MONGO_DB_NAME]


def get_collection(name: str):
    return get_db()[name]


def ensure_indexes() -> dict[str, Any]:
    db = get_db()
    created = {}
    created["ratings_user_movie"] = db.ratings.create_index(
        [("userId", 1), ("movieId", 1)], unique=True
    )
    created["ratings_movie"] = db.ratings.create_index([("movieId", 1)])
    created["users_userId"] = db.users.create_index([("userId", 1)], unique=True)
    created["users_username"] = db.users.create_index([("username", 1)], unique=True)
    created["users_email"] = db.users.create_index([("email", 1)], unique=True)
    created["movies_id"] = db.movies.create_index([("_id", 1)])
    created["movies_imdb_id"] = db.movies.create_index([("imdb_id", 1)])
    created["movies_title"] = db.movies.create_index([("title", 1)])
    created["comments_movie"] = db.comments.create_index([("movieId", 1)])
    created["comments_user"] = db.comments.create_index([("userId", 1)])
    created["item_sim_topk_id"] = db.item_sim_topk.create_index([("_id", 1)])
    return created
