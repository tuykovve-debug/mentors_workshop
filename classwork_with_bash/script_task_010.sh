read -p "Введите имя файла " name
read -p "Введите слово для поиска " word
count=$(grep -o "$word" "$name" | wc -l)
echo "Количество вхождений слова '$word': $count"