if ping -c 3 ya.ru &> /dev/null
then
  echo "Сервер доступен"
else
  echo "Сервер недоступен"
fi