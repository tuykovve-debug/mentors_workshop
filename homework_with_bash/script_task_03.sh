read -p "Введите число: " num
if [ "$num" -gt 0 ]; then
    echo "Число положительное"
    elif [ "$num" -eq 0 ]; then
        echo "Число равно нулю"
        elif [ "$num" -lt 0 ]; then
            echo "Число отрицательное"
fi