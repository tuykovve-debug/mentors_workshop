read -p "Введите длину пароля " length
password=$(head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c "$length")
echo "сгенерированный пароль - $password"