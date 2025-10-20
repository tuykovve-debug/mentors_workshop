read -p "Введите директорию для добавления префикса к файлам: " dirname
prefix="backup_"
for file in "$dirname"/*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    mv "$file" "$dirname/$prefix$filename"
  fi
done