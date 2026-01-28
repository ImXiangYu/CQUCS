// 首页逻辑
let currentPage = 1;
let currentGenre = '';
let currentSearch = '';
let topRatedMovies = [];
let carouselCurrentIndex = 0;

// 检查是否需要刷新（评分更新后）
function checkRatingUpdate() {
    const ratingUpdated = localStorage.getItem('ratingUpdated');
    if (ratingUpdated) {
        const updateTime = parseInt(ratingUpdated);
        const now = Date.now();
        // 如果标记是30秒内设置的，刷新页面
        if (now - updateTime < 30000) {
            localStorage.removeItem('ratingUpdated');
            window.location.reload();
            return true;
        } else {
            // 超过30秒的标记清除
            localStorage.removeItem('ratingUpdated');
        }
    }
    return false;
}

// 处理浏览器后退/前进按钮（pageshow事件）
window.addEventListener('pageshow', (event) => {
    // event.persisted 为 true 表示页面是从缓存中恢复的（如浏览器后退）
    if (event.persisted) {
        // 检查是否需要刷新
        checkRatingUpdate();
    }
});

// 初始化
document.addEventListener('DOMContentLoaded', async () => {
    console.log('页面DOM加载完成');
    
    // 检查是否需要刷新（评分更新后）
    if (checkRatingUpdate()) {
        return; // 如果刷新了，不继续执行
    }
    
    // 先初始化轮播控件
    initCarousel();
    
    // 然后加载数据
    try {
        await loadGenres();
    } catch (err) {
        console.error('加载类型失败:', err);
    }
    
    try {
        await loadTopRatedMovies();
    } catch (err) {
        console.error('加载高分电影失败:', err);
    }
    
    // 搜索事件
    const searchBtn = document.getElementById('mainSearchBtn');
    const searchInput = document.getElementById('mainSearchInput');
    
    if (searchBtn) {
        searchBtn.addEventListener('click', handleSearch);
    }
    
    if (searchInput) {
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                handleSearch();
            }
        });
    }
    
    // 类型筛选
    const genreFilter = document.getElementById('genreFilter');
    if (genreFilter) {
        genreFilter.addEventListener('change', (e) => {
            currentGenre = e.target.value;
            currentPage = 1;
            if (currentSearch) {
                loadMovies();
            }
        });
    }
    
    // 监听页面可见性变化（从详情页返回时检查）
    document.addEventListener('visibilitychange', () => {
        if (!document.hidden) {
            // 页面变为可见时检查是否需要刷新
            checkRatingUpdate();
        }
    });
    
    // 处理浏览器后退/前进按钮（pageshow事件）
    window.addEventListener('pageshow', (event) => {
        // event.persisted 为 true 表示页面是从缓存中恢复的（如浏览器后退）
        if (event.persisted) {
            // 检查是否需要刷新
            checkRatingUpdate();
        }
    });
});

// 加载好看电影 - 随机10个
async function loadTopRatedMovies() {
    const track = document.getElementById('carouselTrack');
    if (!track) return;
    
    // 显示加载中
    track.innerHTML = '<div class="loading">正在加载电影...</div>';
    
    try {
        // 先获取所有电影，然后随机选择10个
        let allMovies = [];
        
        // 尝试从电影列表获取所有电影
        try {
            // 获取足够多的电影以便随机选择
            const movieData = await movieAPI.getList(1, 10000, ''); // 获取大量电影
            allMovies = movieData.results || [];
            
            // 如果还有更多，继续获取
            if (movieData.count && movieData.count > 10000) {
                const totalPages = Math.ceil(movieData.count / 20);
                // 随机选择几页来获取更多电影
                const randomPages = [];
                for (let i = 0; i < Math.min(10, totalPages); i++) {
                    randomPages.push(Math.floor(Math.random() * totalPages) + 1);
                }
                for (const page of randomPages) {
                    const moreData = await movieAPI.getList(page, 20, '');
                    if (moreData.results) {
                        allMovies = allMovies.concat(moreData.results);
                    }
                }
            }
        } catch (e) {
            console.log('从电影列表获取失败，尝试从热门电影API获取...', e);
            try {
                const data = await recommendationAPI.getTopRated(1000);
                allMovies = data.results || [];
            } catch (e2) {
                console.error('获取电影失败:', e2);
            }
        }
        
        // 随机选择10个电影（确保有movieId）
        if (allMovies && allMovies.length > 0) {
            // 过滤出有有效ID的电影
            const validMovies = allMovies.filter(m => (m.movieId || m._id) && (m.movieId || m._id) > 0);
            
            // 随机选择10个
            if (validMovies.length > 10) {
                // 使用Fisher-Yates洗牌算法随机选择
                const shuffled = [...validMovies];
                for (let i = shuffled.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
                }
                topRatedMovies = shuffled.slice(0, 10);
            } else {
                topRatedMovies = validMovies;
            }
            
            console.log(`随机选择了 ${topRatedMovies.length} 部电影，ID列表: ${topRatedMovies.map(m => m.movieId || m._id).join(', ')}`);
        } else {
            topRatedMovies = [];
        }
        
        if (topRatedMovies && topRatedMovies.length > 0) {
            console.log(`准备显示 ${topRatedMovies.length} 部电影`);
            displayCarousel();
        } else {
            console.warn('没有加载到电影数据');
            track.innerHTML = '<div class="loading" style="padding: 40px; text-align: center;">暂无电影数据<br>请检查：<br>1. 后端是否已启动<br>2. data/reco_artifacts_2026-01-16/poster/ 目录是否存在<br>3. 查看浏览器控制台和后端日志</div>';
        }
    } catch (error) {
        console.error('加载好看电影失败:', error);
        track.innerHTML = `<div class="loading">加载失败: ${error.message || '请检查后端是否已启动'}</div>`;
    }
}

// 初始化轮播 - Card类型，每次显示1个（居中高亮）
function initCarousel() {
    const prevBtn = document.getElementById('carouselPrev');
    const nextBtn = document.getElementById('carouselNext');
    
    if (prevBtn) {
        prevBtn.addEventListener('click', () => {
            if (carouselCurrentIndex > 0) {
                carouselCurrentIndex = carouselCurrentIndex - 1; // 每次移动1个
                updateCarousel();
            }
        });
    }
    
    if (nextBtn) {
        nextBtn.addEventListener('click', () => {
            // 计算最大索引：确保不会滑到没有电影的位置
            const maxIndex = Math.max(0, topRatedMovies.length - 1);
            if (carouselCurrentIndex < maxIndex) {
                carouselCurrentIndex = carouselCurrentIndex + 1; // 每次移动1个
                updateCarousel();
            }
        });
    }
    
    // 支持键盘左右箭头键
    document.addEventListener('keydown', (e) => {
        if (e.key === 'ArrowLeft') {
            if (carouselCurrentIndex > 0) {
                carouselCurrentIndex = carouselCurrentIndex - 1;
                updateCarousel();
            }
        } else if (e.key === 'ArrowRight') {
            const maxIndex = Math.max(0, topRatedMovies.length - 1);
            if (carouselCurrentIndex < maxIndex) {
                carouselCurrentIndex = carouselCurrentIndex + 1;
                updateCarousel();
            }
        }
    });
}

// Card类型固定显示3个，不需要响应式调整

// 显示轮播
function displayCarousel() {
    const track = document.getElementById('carouselTrack');
    const indicators = document.getElementById('carouselIndicators');
    
    if (!track) return;
    
    if (!topRatedMovies || topRatedMovies.length === 0) {
        track.innerHTML = '<div class="loading" style="grid-column: 1 / -1;">暂无高分电影</div>';
        return;
    }
    
    // 显示所有电影（不限制数量）
    const moviesToShow = topRatedMovies;
    
    console.log(`准备渲染 ${moviesToShow.length} 部电影到轮播`);
    
    const html = moviesToShow.map((movie, index) => {
        const movieId = movie.movieId || movie._id;
        const title = movie.title || '未知电影';
        const genres = Array.isArray(movie.genres) ? movie.genres.join(' / ') : (movie.genres || '未知类型');
        const plot = movie.plot || '';
        const year = movie.year || '';
        
        // 优先使用CSV中的poster_url（图片网址），如果网络图片加载失败则使用本地poster
        let posterUrl = '';
        let fallbackUrl = '';
        
        if (movie.poster_url && movie.poster_url.trim()) {
            posterUrl = movie.poster_url.trim();  // 优先使用CSV中的url字段
        }
        
        // 设置本地图片作为备用
        if (movie.poster_local) {
            fallbackUrl = `/${movie.poster_local}`;
        } else if (movieId) {
            // 最后尝试使用movieId查找海报（data目录）
            fallbackUrl = `/data/reco_artifacts_2026-01-16/poster/${movieId}.jpg`;
        }
        
        if (index < 3) {
            console.log(`渲染电影 ${index+1}: id=${movieId}, title=${title}, posterUrl=${posterUrl ? posterUrl.substring(0, 60) + '...' : 'None'}, fallbackUrl=${fallbackUrl ? fallbackUrl.substring(0, 60) + '...' : 'None'}`);
        }
        
        // 如果网络图片存在，使用网络图片，失败时自动切换到本地图片
        const posterHtml = posterUrl 
            ? `<img src="${posterUrl}" alt="${title}" onerror="console.error('网络图片加载失败，切换到本地图片'); this.onerror=null; this.src='${fallbackUrl || ''}'; if (!this.src || this.src === window.location.href) { this.parentElement.innerHTML='<div class=\\'placeholder\\' style=\\'height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center; color: #fff;\\'><div class=\\'placeholder-icon\\' style=\\'font-size: 48px; margin-bottom: 10px;\\'>🎬</div><div>${title}</div></div>'; }">`
            : (fallbackUrl 
                ? `<img src="${fallbackUrl}" alt="${title}" onerror="this.parentElement.innerHTML='<div class=\\'placeholder\\' style=\\'height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center; color: #fff;\\'><div class=\\'placeholder-icon\\' style=\\'font-size: 48px; margin-bottom: 10px;\\'>🎬</div><div>${title}</div></div>'">`
                : `<div class="placeholder" style="height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center; color: #fff;"><div class="placeholder-icon" style="font-size: 48px; margin-bottom: 10px;">🎬</div><div>${title}</div></div>`);
        
        return `
            <div class="carousel-item ${index === 0 ? 'active' : ''}" data-index="${index}" data-movie-id="${movieId}" style="cursor: pointer;">
                <div class="movie-card" onclick="goToMovieDetail(${movieId})">
                    <div class="movie-poster">
                        ${posterHtml}
                    </div>
                    <div class="movie-info">
                        <div class="movie-title" title="${title}">${title}${year ? ` (${year})` : ''}</div>
                        <div class="movie-genres">${genres}</div>
                        ${plot ? `<div class="movie-plot-carousel">${plot}</div>` : '<div class="movie-plot-carousel">暂无简介</div>'}
                    </div>
                </div>
            </div>
        `;
    }).join('');
    
    track.innerHTML = html;
    console.log(`已渲染 ${moviesToShow.length} 部电影到轮播`);
    
    // 更新指示器 - 每个电影一个圆点
    if (indicators) {
        const totalPages = moviesToShow.length; // 每个电影一个圆点
        indicators.innerHTML = Array.from({ length: totalPages }, (_, i) => 
            `<div class="carousel-indicator ${i === 0 ? 'active' : ''}" data-index="${i}"></div>`
        ).join('');
        
        // 绑定指示器点击事件
        indicators.querySelectorAll('.carousel-indicator').forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                carouselCurrentIndex = index;
                updateCarousel();
            });
        });
    }
    
    // 重置轮播位置
    carouselCurrentIndex = 0;
    
    // 等待DOM渲染完成后再更新位置
    setTimeout(() => {
        updateCarousel();
    }, 300);
}

// 更新轮播位置 - Card类型，居中高亮
function updateCarousel() {
    const track = document.getElementById('carouselTrack');
    if (!track) return;
    
    // 等待DOM更新后再计算
    setTimeout(() => {
        const items = track.querySelectorAll('.carousel-item');
        if (!items || items.length === 0) return;
        
        // 计算最大索引，确保不会滑到没有电影的位置
        const maxIndex = Math.max(0, topRatedMovies.length - 1);
        // 限制当前索引不超过最大值
        if (carouselCurrentIndex > maxIndex) {
            carouselCurrentIndex = maxIndex;
        }
        if (carouselCurrentIndex < 0) {
            carouselCurrentIndex = 0;
        }
        
        // 计算居中位置：让当前电影居中显示
        const itemWidth = 380; // Card width (与CSS一致，稍大一些)
        const gap = 20; // Gap between items
        const wrapperWidth = track.parentElement.offsetWidth || 1400;
        const visibleItems = 3; // 显示3个（中间1个高亮，两边各1个暗色）
        
        // 计算偏移量，使当前电影居中
        const centerOffset = (wrapperWidth - itemWidth) / 2;
        const translateX = centerOffset - (carouselCurrentIndex * (itemWidth + gap));
        track.style.transform = `translateX(${translateX}px)`;
        
        // 更新active状态：只高亮居中的电影，旁边两个暗色
        items.forEach((item, index) => {
            const itemIndex = parseInt(item.dataset.index || '0');
            // 只激活当前居中的电影
            const isActive = itemIndex === carouselCurrentIndex;
            item.classList.toggle('active', isActive);
            
            // 旁边两个电影设为半透明
            const distance = Math.abs(itemIndex - carouselCurrentIndex);
            if (distance === 1) {
                // 旁边的电影
                item.style.opacity = '0.5';
            } else if (distance === 0) {
                // 居中的电影
                item.style.opacity = '1';
            } else {
                // 更远的电影
                item.style.opacity = '0.3';
            }
        });
        
        // 更新指示器
        const indicators = document.getElementById('carouselIndicators');
        if (indicators) {
            indicators.querySelectorAll('.carousel-indicator').forEach((ind, i) => {
                // 只激活当前电影的指示器
                ind.classList.toggle('active', i === carouselCurrentIndex);
            });
        }
        
        // 更新按钮状态：到达边界时禁用按钮
        const prevBtn = document.getElementById('carouselPrev');
        const nextBtn = document.getElementById('carouselNext');
        if (prevBtn) {
            prevBtn.disabled = carouselCurrentIndex <= 0;
            prevBtn.style.opacity = carouselCurrentIndex > 0 ? '1' : '0.5';
            prevBtn.style.cursor = carouselCurrentIndex > 0 ? 'pointer' : 'not-allowed';
        }
        if (nextBtn) {
            nextBtn.disabled = carouselCurrentIndex >= maxIndex;
            nextBtn.style.opacity = carouselCurrentIndex < maxIndex ? '1' : '0.5';
            nextBtn.style.cursor = carouselCurrentIndex < maxIndex ? 'pointer' : 'not-allowed';
        }
    }, 100);
}

// 加载电影列表
async function loadMovies() {
    const container = document.getElementById('movieList');
    if (!container) return;
    
    container.innerHTML = '<div class="loading">加载中...</div>';
    
    try {
        let data;
        if (currentSearch) {
            data = await movieAPI.search(currentSearch, currentPage, 20);
        } else {
            data = await movieAPI.getList(currentPage, 20, currentGenre);
        }
        
        displayMovies(container, data.results);
        displayPagination(data.count, data.page_size);
    } catch (error) {
        container.innerHTML = '<div class="loading">加载失败，请稍后重试</div>';
    }
}

// 加载类型列表
async function loadGenres() {
    const genreFilter = document.getElementById('genreFilter');
    if (!genreFilter) {
        console.warn('找不到genreFilter元素');
        return;
    }
    
    try {
        console.log('开始加载类型列表...');
        const data = await movieAPI.getGenres();
        console.log('类型API返回:', data);
        
        // 后端返回的是 {results: [...]} 格式
        let genres = data.results || data.genres || [];
        console.log(`从API加载到 ${genres.length} 个类型:`, genres.slice(0, 10));
        
        // 如果API返回为空，使用硬编码的类型列表（从genre.txt提取）
        if (!genres || genres.length === 0) {
            console.log('API返回空，使用硬编码的类型列表');
            genres = [
                "Musical", "War", "Crime", "Romance", "Fantasy",
                "Drama", "Music", "Sci-Fi", "Action", "Comedy",
                "Biography", "Family", "Horror", "Short", "Documentary",
                "Film-Noir", "Animation", "Adventure", "News", "Mystery",
                "Sport", "History", "Thriller", "Western"
            ];
        }
        
        // 清空现有选项（保留"全部类型"）
        genreFilter.innerHTML = '<option value="">全部类型</option>';
        
        // 添加类型选项
        genres.forEach(genre => {
            const option = document.createElement('option');
            option.value = genre;
            option.textContent = genre;
            genreFilter.appendChild(option);
        });
        
        console.log('类型列表加载完成，共', genres.length, '个类型');
    } catch (error) {
        console.error('加载类型失败:', error);
        // 如果失败，使用硬编码的类型列表
        const genreFilter = document.getElementById('genreFilter');
        if (genreFilter) {
            const fallbackGenres = [
                "Musical", "War", "Crime", "Romance", "Fantasy",
                "Drama", "Music", "Sci-Fi", "Action", "Comedy",
                "Biography", "Family", "Horror", "Short", "Documentary",
                "Film-Noir", "Animation", "Adventure", "News", "Mystery",
                "Sport", "History", "Thriller", "Western"
            ];
            genreFilter.innerHTML = '<option value="">全部类型</option>';
            fallbackGenres.forEach(genre => {
                const option = document.createElement('option');
                option.value = genre;
                option.textContent = genre;
                genreFilter.appendChild(option);
            });
            console.log('使用硬编码的类型列表，共', fallbackGenres.length, '个类型');
        }
    }
}

// 显示电影
function displayMovies(container, movies) {
    if (!movies || movies.length === 0) {
        container.innerHTML = '<div class="loading">暂无电影</div>';
        return;
    }
    
    container.innerHTML = movies.map(movie => {
        const movieId = movie.movieId || movie._id;
        const title = movie.title || '未知电影';
        const genres = Array.isArray(movie.genres) ? movie.genres.join(' / ') : '';
        // 获取评分，可能来自rating、avg或score字段
        let rating = null;
        let ratingCount = 0;
        if (movie.rating && movie.rating > 0) {
            rating = movie.rating;
        } else if (movie.avg && movie.avg > 0) {
            rating = movie.avg;
            ratingCount = movie.rating_count || 0;
        } else if (movie.score && movie.score > 0) {
            rating = movie.score;
        }
        const plot = movie.plot || '';
        const year = movie.year || '';
        
        // 优先使用CSV中的poster_url（图片网址），如果没有则使用本地poster
        // 优先使用CSV中的poster_url（图片网址），如果网络图片加载失败则使用本地poster
        let posterUrl = '';
        let fallbackUrl = '';
        
        if (movie.poster_url && movie.poster_url.trim()) {
            posterUrl = movie.poster_url.trim();
        }
        
        // 设置本地图片作为备用
        if (movie.poster_local) {
            fallbackUrl = `/${movie.poster_local}`;
        } else if (movie.movieId || movie._id) {
            const movieId = movie.movieId || movie._id;
            fallbackUrl = `/data/reco_artifacts_2026-01-16/poster/${movieId}.jpg`;
        }
        
        // 如果网络图片存在，使用网络图片，失败时自动切换到本地图片
        const posterHtml = posterUrl 
            ? `<img src="${posterUrl}" alt="${title}" onerror="console.error('网络图片加载失败，切换到本地图片'); this.onerror=null; this.src='${fallbackUrl || ''}'; if (!this.src || this.src === window.location.href) { this.parentElement.innerHTML='<div class=\\'placeholder\\'><div class=\\'placeholder-icon\\'>🎬</div><div>${title}</div></div>'; }">`
            : (fallbackUrl 
                ? `<img src="${fallbackUrl}" alt="${title}" onerror="this.parentElement.innerHTML='<div class=\\'placeholder\\'><div class=\\'placeholder-icon\\'>🎬</div><div>${title}</div></div>'">`
                : `<div class="placeholder"><div class="placeholder-icon">🎬</div><div>${title}</div></div>`);
        
        return `
            <div class="movie-card" onclick="goToMovieDetail(${movieId})" style="cursor: pointer;">
                <div class="movie-poster">
                    ${posterHtml}
                </div>
                <div class="movie-info">
                    <div class="movie-title" title="${title}">${title}${year ? ` (${year})` : ''}</div>
                    <div class="movie-genres">${genres}</div>
                    ${plot ? `<div class="movie-plot">${plot}</div>` : ''}
                    <div class="movie-rating">
                        ${rating !== null && rating > 0 ? `
                            <span class="star">★</span>
                            <span>${rating.toFixed(1)}</span>
                            ${ratingCount > 0 ? `<span style="font-size: 12px; color: #999; margin-left: 5px;">(${ratingCount}人评价)</span>` : ''}
                        ` : `
                            <span style="font-size: 13px; color: #999; font-style: italic;">还没有评分等你来</span>
                        `}
                    </div>
                </div>
            </div>
        `;
    }).join('');
}

// 显示分页
function displayPagination(total, pageSize) {
    const pagination = document.getElementById('pagination');
    if (!pagination) return;
    
    const totalPages = Math.ceil(total / pageSize);
    if (totalPages <= 1) {
        pagination.innerHTML = '';
        return;
    }
    
    let html = '';
    
    // 上一页
    html += `<button ${currentPage === 1 ? 'disabled' : ''} onclick="changePage(${currentPage - 1})">上一页</button>`;
    
    // 页码
    for (let i = 1; i <= totalPages; i++) {
        if (i === 1 || i === totalPages || (i >= currentPage - 2 && i <= currentPage + 2)) {
            html += `<button class="${i === currentPage ? 'active' : ''}" onclick="changePage(${i})">${i}</button>`;
        } else if (i === currentPage - 3 || i === currentPage + 3) {
            html += `<button disabled>...</button>`;
        }
    }
    
    // 下一页
    html += `<button ${currentPage === totalPages ? 'disabled' : ''} onclick="changePage(${currentPage + 1})">下一页</button>`;
    
    pagination.innerHTML = html;
}

// 切换页码
function changePage(page) {
    currentPage = page;
    loadMovies();
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// 搜索处理
function handleSearch() {
    const searchInput = document.getElementById('mainSearchInput');
    if (!searchInput) return;
    
    currentSearch = searchInput.value.trim();
    currentPage = 1;
    currentGenre = '';
    
    const genreFilter = document.getElementById('genreFilter');
    if (genreFilter) genreFilter.value = '';
    
    if (!currentSearch) {
        document.getElementById('movieList').innerHTML = '<div class="loading">请输入关键词搜索电影</div>';
        return;
    }
    
    loadMovies();
}

// 跳转到电影详情
function goToMovieDetail(movieId) {
    // 记录游客观看历史
    if (guestMode.isGuest()) {
        guestMode.addView(movieId);
    }
    window.location.href = `movie-detail.html?id=${movieId}`;
}
