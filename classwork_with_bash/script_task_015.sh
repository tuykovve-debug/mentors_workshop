file="$1"
prev_size=$(stat -c%s "$file")
while true; do
  current_size=$(stat -c%s "$file")
  if [ "$current_size" != "$prev_size" ]; then
    prev_size=$current_size
  fi
done