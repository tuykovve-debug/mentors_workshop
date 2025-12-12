#!/bin/bash

REMOTE_HOST="your_server_ip_or_hostname"
USER="tslav"
LOAD_THRESHOLD=1.0
PROCESSES_TO_KILL=("my_app")

load=$(ssh "$USER@$REMOTE_HOST" "uptime" | awk -F'[a-z]:' '{ print $2 }' | awk '{ print $1 }')

echo "Текущая средняя нагрузка: $load"

awk -v load="$load" -v threshold="$LOAD_THRESHOLD" 'BEGIN {exit !(load > threshold)}'
if [ $? -eq 0 ]; then
    echo "Нагрузка превышает порог ($LOAD_THRESHOLD). Завершаем процессы..."
    for proc in "${PROCESSES_TO_KILL[@]}"; do
        pids=$(ssh "$USER@$REMOTE_HOST" "pgrep -f $proc")
        if [ -n "$pids" ]; then
            ssh "$USER@$REMOTE_HOST" "pkill -f $proc"
            echo "Завершены процессы: $proc"
        else
            echo "Процессы $proc не найдены"
        fi
    done
else
    echo "Нагрузка в пределах нормы."
fi