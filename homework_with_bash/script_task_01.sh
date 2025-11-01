for entry in *; do
  if [ -d "$entry" ]; then
    type="каталог"
  elif [ -f "$entry" ]; then
    type="файл"
  elif [ -L "$entry" ]; then
    type="ссылка"
  else
    type="другой тип"
fi
echo "$entry - $type"
done

if [ "$#" -ne 1 ]; then
  echo "Укажите имя файла как аргумент скрипта."
  exit 1
fi

file_to_check="$1"

if [ -e "$file_to_check" ]; then
  echo "Файл '$file_to_check' существует."
else
  echo "Файл '$file_to_check' не найден."
fi

echo ""

echo "Информация о файлах:"
for entry in *; do
  permissions=$(stat -c "%A" "$entry")
  echo "Имя: $entry, права доступа: $permissions"
done