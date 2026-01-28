# 电影推荐系统

一个基于Django REST Framework和MongoDB的电影推荐系统，提供用户注册登录、电影浏览、评分和个性化推荐功能。

## 功能特性

- 🎬 电影浏览和搜索
- 👤 用户注册和登录
- ⭐ 电影评分功能
- 🔍 多种推荐算法（基于物品、基于用户、混合推荐）
- 🍪 游客模式（使用Cookie存储临时数据）
- 📱 响应式设计，参考豆瓣电影风格

## 技术栈

### 后端
- Django 4.2.7
- Django REST Framework
- MongoDB (数据库名: movie)
- JWT认证

### 前端
- 原生HTML/CSS/JavaScript
- 响应式设计
- Cookie存储（游客模式）

## 环境要求

- Python 3.8+
- MongoDB (数据库名: movie，无密码)
- 现代浏览器（Chrome, Firefox, Edge等）

## 快速运行

### 完整运行步骤

1. **启动MongoDB**
   ```bash
   # Windows
   net start MongoDB
   
   # Linux/Mac
   sudo systemctl start mongodb
   ```

2. **安装爬虫依赖（首次运行）**
   ```bash
   cd movie_recommendation
   venv\Scripts\activate  # Windows
   # 或 source venv/bin/activate  # Linux/Mac
   pip install beautifulsoup4 requests lxml
   ```

3. **启动后端**
   ```bash
   # Windows
   start_backend.bat
   
   # Linux/Mac
   chmod +x start_backend.sh
   ./start_backend.sh
   ```
   后端将在 `http://localhost:8000` 启动

4. **启动前端**（新开一个命令行窗口）
   ```bash
   # Windows
   start_frontend.bat
   
   # Linux/Mac
   chmod +x start_frontend.sh
   ./start_frontend.sh
   ```
   前端将在 `http://localhost:3000` 启动

5. **爬取电影数据**（可选但推荐）
   ```bash
   cd movie_recommendation
   venv\Scripts\activate  # Windows
   # 或 source venv/bin/activate  # Linux/Mac
   python manage.py crawl_movies --limit 20
   ```

6. **访问网站**
   - 前端：http://localhost:3000
   - API文档：http://localhost:8000/api/docs/

7. **服务器部署重启脚本**

   - 若服务器端需要重启，直接运行`restart.sh` 脚本即可

**详细运行指南请查看 `运行指南.md`**

## 使用说明

### 游客模式

- 无需登录即可浏览电影
- 可以查看电影详情
- 可以评分（数据存储在Cookie中，关闭浏览器后清空）
- 可以查看热门推荐和最新上映

### 注册登录

- 点击导航栏的"注册"或"登录"按钮
- 注册需要用户名、邮箱和密码
- 登录后可以享受：
  - 个性化推荐（基于物品、基于用户、混合推荐）
  - 永久保存评分记录
  - 查看个人评分历史

### API文档

访问 `http://localhost:8000/api/docs/` 查看完整的API文档。

## 项目结构

```
movRec/
├── movie_recommendation/     # Django后端项目
│   ├── apps/
│   │   ├── users/           # 用户模块
│   │   ├── movies/          # 电影模块
│   │   ├── ratings/         # 评分模块
│   │   └── recommendations/  # 推荐模块
│   ├── config/              # Django配置
│   └── utils/               # 工具函数
├── html/                # 前端文件
│   ├── index.html          # 首页
│   ├── login.html          # 登录页
│   ├── register.html       # 注册页
│   ├── movie-detail.html   # 电影详情页
│   ├── recommendations.html # 推荐页
│   ├── movies.html         # 电影库
│   ├── css/
│   │   └── style.css      # 样式文件
│   └── js/
│       ├── api.js         # API调用
│       ├── auth.js        # 认证管理
│       ├── cookie.js      # Cookie工具
│       └── index.js       # 首页逻辑
└── data/      			   # 图片等静态资源

```

## API端点

### 用户认证
- `POST /api/auth/register` - 注册
- `POST /api/auth/login` - 登录
- `GET /api/auth/profile` - 获取用户信息

### 电影
- `GET /api/movies/` - 获取电影列表
- `GET /api/movies/{id}` - 获取电影详情
- `GET /api/movies/search` - 搜索电影
- `GET /api/movies/genres` - 获取电影类型列表

### 评分
- `POST /api/ratings/` - 创建评分
- `GET /api/ratings/user` - 获取用户评分列表
- `GET /api/ratings/movie/{id}` - 获取电影评分统计

### 推荐
- `GET /api/recommendations/trending` - 热门推荐
- `GET /api/recommendations/new` - 最新上映
- `GET /api/recommendations/item-based` - 基于物品的推荐（需登录）
- `GET /api/recommendations/user-based` - 基于用户的推荐（需登录）
- `GET /api/recommendations/hybrid` - 混合推荐（需登录）

## 注意事项

1. MongoDB数据库名必须为 `movie`，且无密码
2. 后端默认运行在 `http://localhost:8000`
3. 前端默认运行在 `http://localhost:3000`
4. 如果修改了后端端口，需要同步修改 `frontend/js/api.js` 中的 `API_BASE_URL`
5. 游客模式的数据存储在Cookie中，关闭浏览器后会清空

## 开发说明

### 添加新功能

1. 后端：在对应的app中添加views、urls和serializers
2. 前端：在 `js/api.js` 中添加API调用函数，然后在对应页面使用

### 数据库配置

MongoDB连接配置在 `movie_recommendation/config/settings.py` 中：
- `MONGO_URI`: MongoDB连接地址（默认: `mongodb://localhost:27017`）
- `MONGO_DB_NAME`: 数据库名称（默认: `movie`）

## 许可证

MIT License

