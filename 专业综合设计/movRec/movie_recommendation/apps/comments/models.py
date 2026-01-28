from dataclasses import dataclass
from datetime import datetime
from typing import Any, Optional


@dataclass
class Comment:
    userId: int
    movieId: int
    content: str
    rating: Optional[float] = None
    timestamp: Optional[datetime] = None
    is_active: bool = True
    _id: Any | None = None

    @classmethod
    def from_doc(cls, doc: dict) -> "Comment":
        # 兼容content和text字段名
        content = doc.get("content") or doc.get("text", "")
        return cls(
            userId=doc.get("userId"),
            movieId=doc.get("movieId"),
            content=content,
            rating=doc.get("rating"),
            timestamp=doc.get("timestamp"),
            is_active=doc.get("is_active", True),
            _id=doc.get("_id"),
        )

    def to_dict(self) -> dict:
        oid = str(self._id) if self._id is not None else None
        return {
            "id": oid,
            "userId": self.userId,
            "movieId": self.movieId,
            "content": self.content,
            "rating": self.rating,
            "timestamp": self.timestamp.isoformat() if self.timestamp else None,
            "is_active": self.is_active,
        }

