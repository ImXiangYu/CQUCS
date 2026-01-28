from django.core.management.base import BaseCommand
from utils.database import ensure_indexes, get_mongo_client


class Command(BaseCommand):
    help = "初始化MongoDB数据库和索引"

    def handle(self, *args, **options):
        self.stdout.write("正在连接MongoDB...")
        try:
            client = get_mongo_client()
            client.admin.command("ping")
            self.stdout.write(self.style.SUCCESS("✓ MongoDB连接成功"))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f"✗ MongoDB连接失败: {e}"))
            return

        self.stdout.write("正在创建索引...")
        try:
            created = ensure_indexes()
            self.stdout.write(self.style.SUCCESS(f"✓ 索引创建成功: {len(created)} 个"))
            for name, result in created.items():
                self.stdout.write(f"  - {name}")
        except Exception as e:
            self.stdout.write(self.style.ERROR(f"✗ 索引创建失败: {e}"))

        self.stdout.write(self.style.SUCCESS("\n数据库初始化完成！"))

