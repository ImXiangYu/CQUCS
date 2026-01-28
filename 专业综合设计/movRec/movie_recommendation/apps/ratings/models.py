from dataclasses import dataclass
from datetime import datetime
from typing import Any


@dataclass
class Rating:
    userId: int
    movieId: int
    rating: float
    timestamp: datetime
    is_active: bool = True
    _id: Any | None = None

    @classmethod
    def from_doc(cls, doc: dict) -> "Rating":
        return cls(
            userId=doc.get("userId"),
            movieId=doc.get("movieId"),
            rating=doc.get("rating", 0.0),
            timestamp=doc.get("timestamp"),
            is_active=doc.get("is_active", True),
            _id=doc.get("_id"),
        )

    def to_dict(self) -> dict:
        # expose string id for client operations (update/delete)
        oid = str(self._id) if self._id is not None else None
        return {
            "id": oid,
            "userId": self.userId,
            "movieId": self.movieId,
            "rating": self.rating,
            "timestamp": self.timestamp,
            "is_active": self.is_active,
        }
