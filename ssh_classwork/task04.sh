#!/bin/bash

REMOTE_HOST="ваш_сервер_IP_или_имя"
USER="tslav"
THRESHOLD=10
EMAIL="tuykov.ve@yandex.ru"
DISK="/"

FREE_PERCENT=$(ssh "$USER@$REMOTE_HOST" "df -h $DISK | awk 'NR==2 {print \$5}' | sed 's/%//'")

if [ "$FREE_PERCENT" -ge $((100 - THRESHOLD)) ]; then
  echo "Свободное место на диске меньше порога ($THRESHOLD%). Отправка уведомления..."
  echo "Внимание! Свободное место на диске $DISK на сервере $REMOTE_HOST составляет $FREE_PERCENT%." | \
  mail -s "Проблема с дисковым пространством на сервере $REMOTE_HOST" "$EMAIL"
else
  echo "Свободное место на диске достаточно: $FREE_PERCENT%"
fi