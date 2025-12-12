#!/bin/bash

# Переменные
REMOTE_HOST="ваш_сервер_IP_или_имя"     # IP или hostname удалённого сервера
USER="ваш_логин"                        # Ваш логин на сервере
REMOTE_DIR="/путь/к/директории"        # Директория на удалённом сервере, которую нужно архивировать
ARCHIVE_NAME="backup_$(date +%Y%m%d%H%M%S).tar.gz"  # Имя архива с временной меткой
LOCAL_DIR="/путь/к/локальной/папке"     # Местоположение для скачивания и разархивирования

# Шаг 1: Архивирование удалённой директории
ssh "$USER@$REMOTE_HOST" "tar -czf /tmp/$ARCHIVE_NAME -C $(dirname "$REMOTE_DIR") $(basename "$REMOTE_DIR")"
if [ $? -ne 0 ]; then
  echo "Ошибка при архивировании удалённой директории"
  exit 1
fi
echo "Удалённая директория заархивирована: /tmp/$ARCHIVE_NAME"

# Шаг 2: Скачивание архива на локальную машину
scp "$USER@$REMOTE_HOST:/tmp/$ARCHIVE_NAME" "$LOCAL_DIR/"
if [ $? -ne 0 ]; then
  echo "Ошибка при скачивании архива"
  exit 1
fi
echo "Архив скачан в $LOCAL_DIR/$ARCHIVE_NAME"

# Шаг 3: Разархивирование скачанного архива
tar -xzf "$LOCAL_DIR/$ARCHIVE_NAME" -C "$LOCAL_DIR"
if [ $? -ne 0 ]; then
  echo "Ошибка при разархивировании"
  exit 1
fi
echo "Архив разархивирован в $LOCAL_DIR"

# Опционально: удалить архив на сервере
ssh "$USER@$REMOTE_HOST" "rm /tmp/$ARCHIVE_NAME"
echo "Архив на сервере удалён"

echo "Задача выполнена успешно."