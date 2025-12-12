echo "Текущий path: $PATH"

if [ -z "$dir" ]; then
  echo "Укажите директорию для добавления в PATH"
  exit 1
fi

  export PATH="$PATH:$dir"

  echo "$PATH"

  #Вторая часть задания в файле README