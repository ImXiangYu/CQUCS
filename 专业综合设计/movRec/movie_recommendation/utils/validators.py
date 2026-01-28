import re
from typing import Any


USERNAME_RE = re.compile(r"^[a-zA-Z0-9_]{3,32}$")
EMAIL_RE = re.compile(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")


def validate_username(value: str) -> None:
    if not value:
        raise ValueError("用户名不能为空")
    if len(value) < 3:
        raise ValueError("用户名至少需要3个字符")
    if len(value) > 32:
        raise ValueError("用户名不能超过32个字符")
    if not USERNAME_RE.match(value):
        raise ValueError("用户名只能包含字母、数字和下划线，且长度为3-32位")


def validate_email(value: str) -> None:
    if not value:
        raise ValueError("邮箱不能为空")
    if '@' not in value:
        raise ValueError("邮箱格式不正确，缺少@符号")
    parts = value.split('@')
    if len(parts) != 2:
        raise ValueError("邮箱格式不正确，只能有一个@符号")
    if not parts[0] or not parts[1]:
        raise ValueError("邮箱格式不正确，@前后不能为空")
    if '.' not in parts[1]:
        raise ValueError("邮箱格式不正确，请输入正确的邮箱后缀（如：@gmail.com、@qq.com）")
    if not EMAIL_RE.match(value):
        raise ValueError("邮箱格式不正确，请输入正确的邮箱格式（如：example@gmail.com）")


def validate_rating(value: Any) -> float:
    try:
        rating = float(value)
    except Exception as exc:  # noqa: BLE001
        raise ValueError("评分必须是数字") from exc
    if rating < 1.0 or rating > 5.0:
        raise ValueError("评分需在1.0到5.0之间")
    return rating
