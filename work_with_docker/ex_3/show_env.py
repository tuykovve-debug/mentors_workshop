import os

user_name = os.getenv('USER_NAME', 'Переменная USER_NAME не установлена')
print(f'Значение переменной окружения USER_NAME: {user_name}')