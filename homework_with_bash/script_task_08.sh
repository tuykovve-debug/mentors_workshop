TARGET_DIR="$1"
LOG_FILE="backup_log.txt"
CURRENT_DATE=$(date +"%Y%m%d_%H%M%S")
FILE_COUNT=0
if [ -z "$TARGET_DIR" ]; then
    echo "$0 /путь/к/директории" | tee -a "$LOG_FILE"
    exit 1
fi
if [ ! -d "$TARGET_DIR" ]; then
    echo "dir not found: $TARGET_DIR" | tee -a "$LOG_FILE"
    exit 1
fi
echo "Копирование файлов из $TARGET_DIR - $(date)" | tee -a "$LOG_FILE"
for FILE in "$TARGET_DIR"/*; do
    if [ -f "$FILE" ]; then
        BASENAME=$(basename "$FILE")
        cp "$FILE" "$TARGET_DIR/${BASENAME}_${CURRENT_DATE}"
        if [ $? -eq 0 ]; then
            echo "$BASENAME" | tee -a "$LOG_FILE"
            ((FILE_COUNT++))
        else
            echo "ошибка!: $BASENAME" | tee -a "$LOG_FILE"
        fi
    fi
done
echo "Резервное копирование завершено. Всего файлов: $FILE_COUNT" | tee -a "$LOG_FILE"
echo "Процесс завершен успешно." | mail -s "Резервное копирование завершено" youremail@mail.com