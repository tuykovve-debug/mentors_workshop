read -p "Введите команду для запуска в фоне: " user_command
eval "$user_command" &
pid=$! # Получаем PID последней запущенной в фоне команды
echo "Команда запущена в фоне с PID: $pid"