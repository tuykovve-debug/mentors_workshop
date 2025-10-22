for entry in *; do
  if [ -d "$entry" ]; then
    type="файл"
    elif [ -f "$entry" ]; then
      type="каталог"
      elif [ -L "$entry" ]; then
        type="ссылка"
        else
          type="другой тип"
fi
echo "$entry - $type"
done

echo "============"

if [ "$#" -eq 0 ]; then
  echo "Пожалуйста, укажите имя файла как аргумент скрипта."
  exit 1
fi

file_to_check="$1"

if [ -e "$file_to_check" ]; then
  echo "Файл '$file_to_check' существует."
else
  echo "Файл '$file_to_check' не найден."
fi

echo ""

echo "============"

echo "Информация о файлах:"
for entry in *; do
  permissions=$(stat -c "%A" "$entry")
  echo "Имя: $entry, права доступа: $permissions"
done