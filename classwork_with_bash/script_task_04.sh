read -p "Введите имя файла: " filename
lines=$(wc -l < "$filename")
echo "Число строк внутри файла: $lines"