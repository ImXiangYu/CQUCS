from dataclasses import dataclass, field
from datetime import datetime
from typing import Any, Dict, List


@dataclass
class User:
    userId: int
    username: str
    email: str
    password_hash: str
    preferences: Dict[str, List[str]] = field(default_factory=dict)
    created_at: datetime | None = None
    last_login: datetime | None = None
    _id: Any | None = None

    @classmethod
    def from_doc(cls, doc: dict[str, Any]) -> "User":
        return cls(
            userId=doc.get("userId"),
            username=doc.get("username"),
            email=doc.get("email"),
            password_hash=doc.get("password_hash", ""),
            preferences=doc.get("preferences", {}),
            created_at=doc.get("created_at"),
            last_login=doc.get("last_login"),
            _id=doc.get("_id"),
        )

    def to_public(self) -> dict[str, Any]:
        return {
            "userId": self.userId,
            "username": self.username,
            "email": self.email,
            "preferences": self.preferences,
            "created_at": self.created_at,
            "last_login": self.last_login,
        }
