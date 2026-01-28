from dataclasses import dataclass
from typing import Any, List, Optional


@dataclass
class Movie:
    movieId: int
    title: str
    genres: List[str]
    plot: str = ""
    year: Optional[int] = None
    rating: Optional[float] = None
    poster_url: Optional[str] = None
    poster_local: Optional[str] = None
    imdb_id: Optional[str] = None
    directors: List[str] = None
    actors: List[str] = None
    writers: List[str] = None  # 新增
    time: Optional[str] = None  # 新增
    release_time: Optional[str] = None  # 新增
    imdb_url: Optional[str] = None
    _id: Any | None = None

    def __post_init__(self):
        if self.directors is None:
            self.directors = []
        if self.actors is None:
            self.actors = []
        if self.writers is None:
            self.writers = []

    @classmethod
    def from_doc(cls, doc: dict) -> "Movie":
        return cls(
            movieId=doc.get("_id") or doc.get("movieId"),
            title=doc.get("title", ""),
            genres=doc.get("genres", []),
            plot=doc.get("plot", ""),
            year=doc.get("year"),
            rating=doc.get("rating"),
            poster_url=doc.get("poster_url"),
            poster_local=doc.get("poster_local"),
            imdb_id=doc.get("imdb_id"),
            directors=doc.get("directors", []),
            actors=doc.get("actors", []),
            writers=doc.get("writers", []),  # 新增
            time=doc.get("time"),  # 新增
            release_time=doc.get("release_time"),  # 新增
            imdb_url=doc.get("imdb_url"),
            _id=doc.get("_id"),
        )

    def to_dict(self) -> dict:
        return {
            "movieId": self.movieId,
            "title": self.title,
            "genres": self.genres,
            "plot": self.plot,
            "year": self.year,
            "rating": self.rating,
            "poster_url": self.poster_url,
            "poster_local": self.poster_local,
            "imdb_id": self.imdb_id,
            "directors": self.directors,
            "actors": self.actors,
            "writers": self.writers,  # 新增
            "time": self.time,  # 新增
            "release_time": self.release_time,  # 新增
            "imdb_url": self.imdb_url,
        }
