from typing import Dict, List

from utils.database import get_collection
from utils.helpers import dedupe


def item_based_recommendation(user_id: int, top_n: int = 10) -> List[Dict]:
    """
    基于物品的推荐算法 - 只基于用户好评（评分>=4）的电影进行推荐
    """
    ratings_coll = get_collection("ratings")
    comments_coll = get_collection("comments")
    sim_coll = get_collection("item_sim_topk")

    # 获取用户的所有评分（从ratings集合）
    user_ratings = list(
        ratings_coll.find({"userId": user_id, "is_active": True}, {"movieId": 1, "rating": 1})
    )
    
    # 获取用户的所有评论中的评分（从comments集合）
    user_comments = list(
        comments_coll.find({"userId": user_id, "is_active": True, "rating": {"$ne": None}}, 
                          {"movieId": 1, "rating": 1})
    )
    
    # 合并评分，优先使用ratings集合中的评分
    all_user_ratings = {}
    for entry in user_ratings:
        movie_id = entry["movieId"]
        all_user_ratings[movie_id] = float(entry["rating"])
    
    # 如果comments中有评分但ratings中没有，也加入
    for entry in user_comments:
        movie_id = entry["movieId"]
        if movie_id not in all_user_ratings:
            all_user_ratings[movie_id] = float(entry.get("rating", 0))
    
    # 只保留好评电影（评分>=4）
    good_ratings = {mid: rating for mid, rating in all_user_ratings.items() if rating >= 4.0}
    
    if not good_ratings:
        return []

    rated_movie_ids = set(all_user_ratings.keys())  # 所有已评分的电影（包括低分）
    candidate_scores: Dict[int, float] = {}
    candidate_weights: Dict[int, float] = {}
    candidate_reasons: Dict[int, str] = {}
    
    # 获取好评电影的名称（用于推荐原因显示）
    movies_coll = get_collection("movies")
    good_movie_titles = {}
    for mid in good_ratings.keys():
        movie_doc = movies_coll.find_one({"_id": mid})
        if movie_doc:
            good_movie_titles[mid] = movie_doc.get("title", f"电影{mid}")
        else:
            # 如果数据库没有，尝试从本地文件读取
            from apps.movies.views import MovieListView
            movie_list_view = MovieListView()
            all_movies = movie_list_view._get_movies_from_local_posters()
            for m in all_movies:
                if m.get("movieId") == mid:
                    good_movie_titles[mid] = m.get("title", f"电影{mid}")
                    break
            if mid not in good_movie_titles:
                good_movie_titles[mid] = f"电影{mid}"

    # 只基于好评电影进行推荐
    for movie_id, user_rating in good_ratings.items():
        # 尝试从数据库获取相似度数据
        sim_doc = sim_coll.find_one({"_id": movie_id})
        if not sim_doc:
            # 如果数据库中没有，尝试从JSONL文件读取
            from pathlib import Path
            BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent.parent
            item_sim_path = BASE_DIR / "data" / "reco_artifacts_2026-01-16" / "item_sim_topk.jsonl"
            
            if item_sim_path.exists():
                import json
                try:
                    with open(item_sim_path, 'r', encoding='utf-8') as f:
                        for line in f:
                            line = line.strip()
                            if not line:
                                continue
                            try:
                                data = json.loads(line)
                                if data.get('_id') == movie_id:
                                    sim_doc = data
                                    break
                            except (json.JSONDecodeError, ValueError, TypeError):
                                continue
                except Exception as e:
                    print(f"读取item_sim_topk.jsonl失败: {e}")
        
        if not sim_doc:
            continue
            
        for sim_item in sim_doc.get("sims", []):
            target_id = sim_item.get("mid")
            if target_id in rated_movie_ids:
                continue  # 跳过已评分的电影
            sim_score = float(sim_item.get("sim", 0.0))
            common_users = int(sim_item.get("cu", 0))
            # 权重：相似度越高、共同用户越多，权重越大
            weight = abs(sim_score) * (1 + common_users / 10)
            # 评分越高，权重越大
            rating_weight = user_rating / 5.0  # 归一化到0-1
            candidate_scores[target_id] = candidate_scores.get(target_id, 0.0) + sim_score * rating_weight * weight
            candidate_weights[target_id] = candidate_weights.get(target_id, 0.0) + weight
            if target_id not in candidate_reasons:
                movie_title = good_movie_titles.get(movie_id, f"电影{movie_id}")
                candidate_reasons[target_id] = f"与《{movie_title}》相似"

    results: List[Dict] = []
    for mid in candidate_scores:
        if candidate_weights[mid] == 0:
            continue
        score = candidate_scores[mid] / candidate_weights[mid]
        results.append({"movieId": mid, "score": round(score, 4), "reason": candidate_reasons.get(mid, "基于好评相似推荐")})

    results.sort(key=lambda x: x["score"], reverse=True)
    return results[:top_n]
