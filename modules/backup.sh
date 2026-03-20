#!/bin/bash
# Module Backup - Sauvegarde un dossier

SOURCE=$1
DEST_DIR="backup"
DATE=$(date +%Y-%m-%d)
FILENAME="backup_$(basename "$SOURCE")_$DATE.tar"

mkdir -p "$DEST_DIR"
tar -cf "$DEST_DIR/$FILENAME" "$SOURCE"

echo "Sauvegarde créée : $DEST_DIR/$FILENAME"














