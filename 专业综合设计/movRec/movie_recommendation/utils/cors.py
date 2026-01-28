from django.conf import settings
from django.utils.deprecation import MiddlewareMixin


class CorsMiddleware(MiddlewareMixin):
    """简单的CORS中间件，允许跨域请求"""
    
    def process_response(self, request, response):
        # 允许的源
        origin = request.META.get('HTTP_ORIGIN', '')
        
        # 开发模式下允许所有源
        if settings.DEBUG:
            if origin:
                response['Access-Control-Allow-Origin'] = origin
            else:
                # 如果没有origin（比如直接访问），允许所有
                response['Access-Control-Allow-Origin'] = '*'
        else:
            # 生产模式下只允许配置的源
            allowed_origins = getattr(settings, 'CORS_ALLOWED_ORIGINS', [])
            if origin in allowed_origins:
                response['Access-Control-Allow-Origin'] = origin
        
        # 允许的请求头
        response['Access-Control-Allow-Headers'] = 'Content-Type, Authorization, X-Requested-With'
        
        # 允许的请求方法
        response['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS, PATCH'
        
        # 允许携带凭证（仅在设置了origin时）
        if origin and getattr(settings, 'CORS_ALLOW_CREDENTIALS', False):
            response['Access-Control-Allow-Credentials'] = 'true'
        
        # 处理预检请求
        if request.method == 'OPTIONS':
            response.status_code = 200
        
        return response

