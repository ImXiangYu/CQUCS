// 认证管理
const auth = {
    // 检查是否已登录
    isAuthenticated: () => {
        return !!localStorage.getItem('token');
    },
    
    // 获取当前用户信息
    getCurrentUser: () => {
        const userStr = localStorage.getItem('user');
        return userStr ? JSON.parse(userStr) : null;
    },
    
    // 设置用户信息
    setUser: (user) => {
        if (user) {
            localStorage.setItem('user', JSON.stringify(user));
        } else {
            localStorage.removeItem('user');
        }
    },
    
    // 登录
    login: async (username, password) => {
        try {
            const data = await userAPI.login(username, password);
            setAuthToken(data.token);
            auth.setUser(data.user);
            return data;
        } catch (error) {
            throw error;
        }
    },
    
    // 注册
    register: async (username, email, password) => {
        try {
            const data = await userAPI.register(username, email, password);
            setAuthToken(data.token);
            auth.setUser(data.user);
            return data;
        } catch (error) {
            throw error;
        }
    },
    
    // 退出登录
    logout: () => {
        setAuthToken(null);
        auth.setUser(null);
        // 清除游客数据
        guestMode.clear();
        window.location.href = 'index.html';
    },
    
    // 更新导航栏显示
    updateNavbar: () => {
        const navUser = document.getElementById('navUser');
        const guestModeEl = document.getElementById('guestMode');
        const btnLogin = document.getElementById('btnLogin');
        const btnRegister = document.getElementById('btnRegister');
        const userMenu = document.getElementById('userMenu');
        const username = document.getElementById('username');
        
        if (auth.isAuthenticated()) {
            const user = auth.getCurrentUser();
            if (guestModeEl) guestModeEl.style.display = 'none';
            if (btnLogin) btnLogin.style.display = 'none';
            if (btnRegister) btnRegister.style.display = 'none';
            if (userMenu) userMenu.style.display = 'flex';
            if (username) username.textContent = user.username;
        } else {
            if (guestModeEl) guestModeEl.style.display = 'inline';
            if (btnLogin) btnLogin.style.display = 'inline-block';
            if (btnRegister) btnRegister.style.display = 'inline-block';
            if (userMenu) userMenu.style.display = 'none';
        }
    }
};

// 页面加载时更新导航栏
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', auth.updateNavbar);
} else {
    auth.updateNavbar();
}

// 退出按钮事件
document.addEventListener('DOMContentLoaded', () => {
    const btnLogout = document.getElementById('btnLogout');
    if (btnLogout) {
        btnLogout.addEventListener('click', (e) => {
            e.preventDefault();
            auth.logout();
        });
    }
});

