"""
IMDB电影数据爬虫
参考: D:\Desktop\课设\IMDBPoster\main.py
"""
import re
import time
import os
import unicodedata
import requests
from typing import Dict, List, Optional
from bs4 import BeautifulSoup
from pathlib import Path


class IMDBSpider:
    """IMDB电影爬虫 - 参考IMDBPoster的实现"""
    
    BASE_URL = "https://www.imdb.com"
    HEADERS = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36'
    }
    
    def __init__(self, poster_save_path: str = None, info_save_path: str = None):
        self.session = requests.Session()
        self.session.headers.update(self.HEADERS)
        
        # 海报保存路径
        if poster_save_path:
            self.poster_save_path = Path(poster_save_path)
        else:
            # 默认保存到项目根目录的poster文件夹
            base_dir = Path(__file__).resolve().parent.parent.parent.parent
            self.poster_save_path = base_dir / "poster"
        
        self.poster_save_path.mkdir(parents=True, exist_ok=True)
        
        # 信息保存路径（可选，用于调试）
        self.info_save_path = info_save_path
    
    def get_url_response(self, url: str, max_retries: int = 5) -> Optional[requests.Response]:
        """访问网页请求，返回response，支持重试"""
        i = 0
        while i < max_retries:
            try:
                response = self.session.get(url, timeout=10)
                if response.status_code == 200:
                    return response
                return None
            except requests.RequestException:
                i += 1
                if i < max_retries:
                    time.sleep(1)
        return None
    
    def get_movie_detail(self, imdb_id: str) -> Optional[Dict]:
        """获取电影详情 - 参考IMDBPoster的解析逻辑"""
        try:
            # 确保imdb_id格式正确
            if not imdb_id.startswith('tt'):
                imdb_id = f'tt{imdb_id}'
            
            url = f"{self.BASE_URL}/title/{imdb_id}/"
            response = self.get_url_response(url)
            
            if not response:
                return None
            
            soup = BeautifulSoup(response.content, 'lxml')
            
            # 提取标题和年份 - 参考原代码
            name = ""
            year = None
            try:
                title_wrapper = soup.find(class_='title_wrapper')
                if title_wrapper:
                    name_elem = title_wrapper.find('h1')
                    if name_elem:
                        name = name_elem.get_text()
                        # 去掉html的一些空白符
                        name = unicodedata.normalize('NFKC', name)
                        # 提取年份 (1995)
                        year_match = re.search(r'\((\d{4})\)', name)
                        if year_match:
                            year = int(year_match.group(1))
                            name = name.replace(f'({year})', '').strip()
            except Exception as e:
                print(f"提取标题失败: {e}")
            
            # 提取海报 - 参考原代码
            poster_url = None
            poster_local_path = None
            try:
                poster_elem = soup.find(class_='poster')
                if poster_elem:
                    img = poster_elem.find('a')
                    if img:
                        img_tag = img.find('img')
                        if img_tag:
                            poster_url = img_tag.get('src', '')
                            
                            # 下载并保存海报
                            if poster_url:
                                poster_response = self.get_url_response(poster_url)
                                if poster_response:
                                    poster_filename = f"{imdb_id}.jpg"
                                    poster_local_path = self.poster_save_path / poster_filename
                                    with open(poster_local_path, 'wb') as f:
                                        f.write(poster_response.content)
                                    # 保存相对路径用于前端访问
                                    poster_local_path = f"poster/{poster_filename}"
            except Exception as e:
                print(f"提取海报失败: {e}")
            
            # 提取基本信息 - 参考原代码
            info = []
            try:
                subtext = soup.find(class_='subtext')
                if subtext:
                    # 时长
                    time_elem = subtext.find('time')
                    if time_elem:
                        info.append(time_elem.get_text().strip())
                    else:
                        info.append('')
                    
                    # 类型和发行时间
                    for tag in subtext.find_all('a'):
                        info.append(tag.get_text().strip())
            except Exception as e:
                print(f"提取基本信息失败: {e}")
            
            # 提取简介 - 参考原代码
            intro = ""
            try:
                summary_elem = soup.find(class_='summary_text')
                if summary_elem:
                    intro = summary_elem.get_text().strip()
                    intro = unicodedata.normalize('NFKC', intro)
            except Exception as e:
                print(f"提取简介失败: {e}")
            
            # 提取类型
            genres = []
            if len(info) > 1:
                # 类型通常在info[1:-1]之间
                for item in info[1:-1]:
                    if item and not re.match(r'\d{1,2}\s+\w+\s+\d{4}', item):
                        genres.append(item)
            
            # 提取发行时间
            release_time = info[-1] if info else None
            
            # 提取卡司 - 参考原代码
            case_dict = {'D': [], 'W': [], 'S': [], 'C': []}
            try:
                for tags in soup.find_all(class_='credit_summary_item'):
                    for h4 in tags.find_all('h4'):
                        title = h4.get_text()
                        ch = title[0] if title else ''
                        if ch in case_dict:
                            for a in h4.next_siblings:
                                if hasattr(a, 'name') and a.name == 'a':
                                    case_dict[ch].append(a.get_text())
                
                # 去掉多余的信息
                for k, v in case_dict.items():
                    if v and (v[-1].find('credit') != -1 or v[-1].find('full cast') != -1):
                        case_dict[k] = case_dict[k][:-1]
                
                # 有时候导演名会用Creator代替
                if 'C' in case_dict:
                    case_dict['D'].extend(case_dict['C'])
            except Exception as e:
                print(f"提取卡司失败: {e}")
            
            # 提取评分
            rating = None
            try:
                rating_elem = soup.find('span', {'itemprop': 'ratingValue'})
                if not rating_elem:
                    rating_elem = soup.find('div', class_=re.compile('ratingValue'))
                if rating_elem:
                    rating_text = rating_elem.get_text(strip=True)
                    rating_match = re.search(r'(\d+\.?\d*)', rating_text)
                    if rating_match:
                        rating = float(rating_match.group(1))
            except Exception as e:
                print(f"提取评分失败: {e}")
            
            return {
                'imdb_id': imdb_id,
                'title': name,
                'year': year,
                'plot': intro,
                'genres': genres,
                'rating': rating,
                'poster_url': poster_url,  # 原始URL
                'poster_local': poster_local_path,  # 本地保存路径
                'directors': case_dict.get('D', []),
                'writers': case_dict.get('W', []),
                'actors': case_dict.get('S', []),
                'duration': info[0] if info else None,
                'release_time': release_time,
                'url': url
            }
        except Exception as e:
            print(f"获取电影详情失败 {imdb_id}: {e}")
            return None
    
    def search_movies(self, keyword: str, max_results: int = 10) -> List[Dict]:
        """搜索电影"""
        try:
            from urllib.parse import quote
            url = f"{self.BASE_URL}/find?q={quote(keyword)}&s=tt&ttype=ft"
            response = self.get_url_response(url)
            
            if not response:
                return []
            
            soup = BeautifulSoup(response.text, 'lxml')
            results = []
            
            result_items = soup.find_all('td', class_='result_text', limit=max_results)
            
            for item in result_items:
                try:
                    link = item.find('a')
                    if not link:
                        continue
                    
                    title = link.get_text(strip=True)
                    href = link.get('href', '')
                    movie_id = re.search(r'/title/(tt\d+)/', href)
                    
                    if movie_id:
                        results.append({
                            'imdb_id': movie_id.group(1),
                            'title': title,
                            'url': f"{self.BASE_URL}{href}"
                        })
                except Exception as e:
                    print(f"解析搜索结果项失败: {e}")
                    continue
            
            return results
        except Exception as e:
            print(f"搜索电影失败: {e}")
            return []
    
    def get_top_rated_movies(self, limit: int = 50) -> List[Dict]:
        """获取高分电影列表"""
        try:
            url = f"{self.BASE_URL}/chart/top"
            response = self.get_url_response(url)
            
            if not response:
                return []
            
            soup = BeautifulSoup(response.text, 'lxml')
            movies = []
            
            # 查找高分电影列表
            movie_items = soup.find_all('td', class_='titleColumn', limit=limit)
            
            for item in movie_items:
                try:
                    link = item.find('a')
                    if not link:
                        continue
                    
                    href = link.get('href', '')
                    movie_id = re.search(r'/title/(tt\d+)/', href)
                    
                    if movie_id:
                        imdb_id = movie_id.group(1)
                        # 获取详情
                        detail = self.get_movie_detail(imdb_id)
                        if detail:
                            movies.append(detail)
                        time.sleep(1)  # 避免请求过快
                except Exception as e:
                    print(f"处理电影项失败: {e}")
                    continue
            
            return movies
        except Exception as e:
            print(f"获取高分电影失败: {e}")
            return []


def crawl_imdb_movies(keywords: List[str] = None, limit: int = 50, poster_path: str = None) -> List[Dict]:
    """
    爬取IMDB电影数据
    
    Args:
        keywords: 搜索关键词列表，如果为None则爬取高分电影
        limit: 每个关键词最多爬取的电影数量
        poster_path: 海报保存路径
    
    Returns:
        电影数据列表
    """
    spider = IMDBSpider(poster_save_path=poster_path)
    all_movies = []
    
    if keywords:
        # 根据关键词搜索
        for keyword in keywords:
            print(f"正在搜索: {keyword}")
            results = spider.search_movies(keyword, max_results=limit)
            for result in results:
                print(f"正在获取详情: {result['title']}")
                detail = spider.get_movie_detail(result['imdb_id'])
                if detail:
                    all_movies.append(detail)
                time.sleep(1)  # 避免请求过快
    else:
        # 爬取高分电影
        if top_rated:
            print("正在爬取高分电影...")
            all_movies = spider.get_top_rated_movies(limit=limit)
        else:
            print("未指定关键词，请使用 --keywords 参数或设置 top_rated=True")
    
    return all_movies


if __name__ == "__main__":
    # 示例：爬取一些高分电影
    movies = crawl_imdb_movies(limit=20)
    print(f"共爬取 {len(movies)} 部电影")
    for movie in movies[:5]:
        print(f"\n{movie['title']} ({movie.get('year', 'N/A')})")
        print(f"类型: {', '.join(movie.get('genres', []))}")
        print(f"评分: {movie.get('rating', 'N/A')}")
