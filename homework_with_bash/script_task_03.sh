read -p "Введите число: " num
if [ "$num" -gt 0 ]; then
  echo "Число положительное"
elif [ "$num" -eq 0 ]; then
  echo "Число равно нулю"
elif [ "$num" -lt 0 ]; then
  echo "Число отрицательное"
fi

if [ "$num" -gt 0 ]; then
    count=1
    echo "Подсчет от 1 до $num:"
    while [ "$count" -le "$num" ]; do
        echo "$count"
        ((count++))
    done
fi