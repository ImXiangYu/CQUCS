// API配置
const API_BASE_URL = "/api";

// 获取认证token
function getAuthToken() {
    return localStorage.getItem('token');
}

// 设置认证token
function setAuthToken(token) {
    if (token) {
        localStorage.setItem('token', token);
    } else {
        localStorage.removeItem('token');
    }
}

// 通用请求函数
async function apiRequest(endpoint, options = {}) {
    const url = `${API_BASE_URL}${endpoint}`;
    const token = getAuthToken();
    
    const headers = {
        'Content-Type': 'application/json',
        ...options.headers
    };
    
    if (token) {
        headers['Authorization'] = `Bearer ${token}`;
    }
    
    const config = {
        ...options,
        headers
    };
    
    try {
        const response = await fetch(url, config);
        
        // 检查响应内容类型
        const contentType = response.headers.get('content-type');
        let data;
        
        if (contentType && contentType.includes('application/json')) {
            data = await response.json();
        } else {
            const text = await response.text();
            throw new Error(text || '请求失败');
        }
        
        if (!response.ok) {
            // 如果是401未授权，可能是token过期
            if (response.status === 401) {
                const errorMsg = data.detail || data.message || 'Token已过期，请重新登录';
                // 清除过期的token
                setAuthToken(null);
                // 清除用户信息（直接操作localStorage，避免循环依赖）
                localStorage.removeItem('user');
                // 如果是认证相关的错误，提示用户登录
                if (errorMsg.includes('Token') || errorMsg.includes('认证') || errorMsg.includes('登录')) {
                    if (confirm('登录已过期，是否前往登录页面？')) {
                        window.location.href = 'login.html?redirect=' + encodeURIComponent(window.location.href);
                    }
                }
                throw new Error(errorMsg);
            }
            
            let errorMsg = data.detail || data.message || `请求失败 (${response.status})`;
            // 清理错误信息，移除可能的乱码和特殊字符
            if (typeof errorMsg === 'string') {
                // 只保留中文、英文、数字、常见标点和邮箱相关字符
                errorMsg = errorMsg.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\s@._-，。！？：；]/g, '').trim();
                if (!errorMsg) {
                    errorMsg = '请求失败，请稍后重试';
                }
            }
            throw new Error(errorMsg);
        }
        
        return data;
    } catch (error) {
        console.error('API请求错误:', error);
        // 如果是网络错误
        if (error.name === 'TypeError' && error.message.includes('fetch')) {
            throw new Error('无法连接到服务器，请检查后端是否已启动');
        }
        throw error;
    }
}

// 用户API
const userAPI = {
    register: (username, email, password) => {
        return apiRequest('/auth/register', {
            method: 'POST',
            body: JSON.stringify({ username, email, password })
        });
    },
    
    login: (username, password) => {
        return apiRequest('/auth/login', {
            method: 'POST',
            body: JSON.stringify({ username, password })
        });
    },
    
    getProfile: () => {
        return apiRequest('/auth/profile');
    }
};

// 电影API
const movieAPI = {
    getList: (page = 1, pageSize = 20, genre = '') => {
        const params = new URLSearchParams({ page, page_size: pageSize });
        if (genre) params.append('genre', genre);
        return apiRequest(`/movies/?${params}`);
    },
    
    getDetail: (movieId) => {
        return apiRequest(`/movies/${movieId}`);
    },
    
    search: (searchParams, page = 1, pageSize = 20) => {
        // searchParams 是一个对象，包含 keyword, director, actor, plot, genres
        const params = new URLSearchParams();
        
        if (searchParams.keyword && searchParams.keyword.trim()) {
            params.append('keyword', searchParams.keyword.trim());
        }
        if (searchParams.director && searchParams.director.trim()) {
            params.append('director', searchParams.director.trim());
        }
        if (searchParams.actor && searchParams.actor.trim()) {
            params.append('actor', searchParams.actor.trim());
        }
        if (searchParams.plot && searchParams.plot.trim()) {
            params.append('plot', searchParams.plot.trim());
        }
        if (searchParams.genres && Array.isArray(searchParams.genres) && searchParams.genres.length > 0) {
            params.append('genres', searchParams.genres.join(','));
        }
        
        params.append('page', page);
        params.append('page_size', pageSize);
        
        return apiRequest(`/movies/search?${params.toString()}`);
    },
    
    getGenres: () => {
        return apiRequest('/movies/genres');
    }
};

// 评分API
const ratingAPI = {
    create: (movieId, rating) => {
        return apiRequest('/ratings/', {
            method: 'POST',
            body: JSON.stringify({ movieId, rating })
        });
    },
    
    getUserRatings: (page = 1, pageSize = 20) => {
        const params = new URLSearchParams({ page, page_size: pageSize });
        return apiRequest(`/ratings/user?${params}`);
    },
    
    getMovieStats: (movieId) => {
        return apiRequest(`/ratings/movie/${movieId}`);
    }
};

// 推荐API
const recommendationAPI = {
    getItemBased: (top = 10) => {
        return apiRequest(`/recommendations/item-based?top=${top}`);
    },
    
    getUserBased: (top = 10) => {
        return apiRequest(`/recommendations/user-based?top=${top}`);
    },
    
    getHybrid: (top = 10) => {
        return apiRequest(`/recommendations/hybrid?top=${top}`);
    },
    
    getTrending: (top = 10) => {
        return apiRequest(`/recommendations/trending?top=${top}`);
    },
    
    getNew: (top = 10) => {
        return apiRequest(`/recommendations/new?top=${top}`);
    },
    
    getTopRated: (top = 50) => {
        return apiRequest(`/recommendations/top-rated?top=${top}`);
    },
    
    getSimilarMovies: (movieId) => {
        return apiRequest(`/recommendations/similar?movie_id=${movieId}`);
    }
};

// 评论API
const commentAPI = {
    create: (movieId, content, rating = null) => {
        return apiRequest('/comments/', {
            method: 'POST',
            body: JSON.stringify({ movieId, content, rating })
        });
    },
    
    getMovieComments: (movieId, page = 1, pageSize = 20) => {
        const params = new URLSearchParams({ page, page_size: pageSize });
        return apiRequest(`/comments/movie/${movieId}?${params}`);
    },
    
    getUserComments: (page = 1, pageSize = 20) => {
        const params = new URLSearchParams({ page, page_size: pageSize });
        return apiRequest(`/comments/user?${params}`);
    },
    
    update: (commentId, content, rating = null) => {
        const data = {};
        if (content) data.content = content;
        if (rating !== null) data.rating = rating;
        return apiRequest(`/comments/${commentId}`, {
            method: 'PUT',
            body: JSON.stringify(data)
        });
    },
    
    delete: (commentId) => {
        return apiRequest(`/comments/${commentId}`, {
            method: 'DELETE'
        });
    }
};

