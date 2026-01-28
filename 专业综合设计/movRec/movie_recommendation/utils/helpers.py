from datetime import datetime, timezone
from typing import Any, Dict, Iterable, List

from pymongo.collection import Collection


def now_utc() -> datetime:
    return datetime.now(timezone.utc)


def generate_int_id(collection: Collection, field: str = "userId") -> int:
    last = collection.find_one(sort=[(field, -1)], projection={field: 1})
    return int(last[field]) + 1 if last and field in last else 1


def paginate_list(items: List[Dict[str, Any]], page: int, page_size: int) -> Dict[str, Any]:
    start = (page - 1) * page_size
    end = start + page_size
    return {
        "count": len(items),
        "results": items[start:end],
        "page": page,
        "page_size": page_size,
    }


def dedupe(items: Iterable[int]) -> list[int]:
    seen: set[int] = set()
    ordered: list[int] = []
    for item in items:
        if item not in seen:
            seen.add(item)
            ordered.append(item)
    return ordered
