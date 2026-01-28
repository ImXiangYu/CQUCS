from math import sqrt
from typing import Iterable, List, Tuple


def cosine_similarity(vec_a: List[float], vec_b: List[float]) -> float:
    if not vec_a or not vec_b or len(vec_a) != len(vec_b):
        return 0.0
    dot = sum(a * b for a, b in zip(vec_a, vec_b))
    norm_a = sqrt(sum(a * a for a in vec_a))
    norm_b = sqrt(sum(b * b for b in vec_b))
    if norm_a == 0 or norm_b == 0:
        return 0.0
    return dot / (norm_a * norm_b)


def topk_from_scores(scores: Iterable[Tuple[int, float]], k: int = 10) -> list[Tuple[int, float]]:
    return sorted(scores, key=lambda x: x[1], reverse=True)[:k]
