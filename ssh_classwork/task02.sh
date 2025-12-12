#!/bin/bash

REMOTE_HOST="192.168.1.100"
USER="tslav"
EMAIL_NOTIFICATION="tuykov.ve@yandex.ru"

UPDATE_CMD="sudo apt update && sudo apt upgrade -y"
REBOOT_REQUIRED_FILE="/var/run/reboot-required"

echo "Подключение к серверу $REMOTE_HOST..."
ssh "$USER@$REMOTE_HOST" "$UPDATE_CMD"

REBOOT_NEEDED=$(ssh "$USER@$REMOTE_HOST" "[ -f $REBOOT_REQUIRED_FILE ] && echo 'yes' || echo 'no'")

if [ "$REBOOT_NEEDED" = "yes" ]; then
    echo "Перезагрузка сервера..."
    ssh "$USER@$REMOTE_HOST" "sudo reboot"
    echo "Сервер $REMOTE_HOST был перезагружен после обновлений." | mail -s "Перезагрузка сервера" "$EMAIL_NOTIFICATION"
else
    echo "Перезагрузка не требуется."
fi