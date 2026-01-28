// Cookie工具函数
const cookieUtils = {
    // 设置cookie
    set: (name, value, days = 0) => {
        let expires = '';
        if (days) {
            const date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = '; expires=' + date.toUTCString();
        }
        document.cookie = name + '=' + (value || '') + expires + '; path=/';
    },
    
    // 获取cookie
    get: (name) => {
        const nameEQ = name + '=';
        const ca = document.cookie.split(';');
        for (let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    },
    
    // 删除cookie
    remove: (name) => {
        document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }
};

// 游客模式数据管理
const guestMode = {
    // 获取游客观看历史
    getViewHistory: () => {
        const history = cookieUtils.get('guest_view_history');
        return history ? JSON.parse(history) : [];
    },
    
    // 添加观看记录
    addView: (movieId) => {
        const history = guestMode.getViewHistory();
        if (!history.includes(movieId)) {
            history.push(movieId);
            // 只保留最近50条记录
            if (history.length > 50) {
                history.shift();
            }
            cookieUtils.set('guest_view_history', JSON.stringify(history), 0); // 会话cookie
        }
    },
    
    // 获取游客评分
    getRatings: () => {
        const ratings = cookieUtils.get('guest_ratings');
        return ratings ? JSON.parse(ratings) : {};
    },
    
    // 添加评分
    addRating: (movieId, rating) => {
        const ratings = guestMode.getRatings();
        ratings[movieId] = rating;
        cookieUtils.set('guest_ratings', JSON.stringify(ratings), 0); // 会话cookie
    },
    
    // 清除所有游客数据
    clear: () => {
        cookieUtils.remove('guest_view_history');
        cookieUtils.remove('guest_ratings');
    },
    
    // 检查是否为游客模式
    isGuest: () => {
        return !localStorage.getItem('token');
    }
};

