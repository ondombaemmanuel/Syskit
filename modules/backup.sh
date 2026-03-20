#!/bin/bash
# Module backup : sauvegarde un dossier

source="$1"
dest_dir="backup"
date=$(date +%Y-%m-%d)
filename="backup_$(basename "$source")_$date.tar"

# Vérifie que le dossier source existe

if [ ! -d "$source" ]; then
	    echo "Erreur : le dossier $source n'existe pas."
	        exit 1
fi

# Crée le dossier de destination s'il n'existe pas
mkdir -p "$dest_dir"mkdir -p "$dest_dir"

# Crée l'archive

tar -cf "$dest_dir/$filename" "$source" 2>/dev/null

if [ $? -eq 0 ]; then
	    echo "Sauvegarde réussie : $dest_dir/$filename"
    else
	        echo "Erreur lors de la sauvegarde."
		fi
# Aide / usage
usage() {
    echo "Utilisation : $0 <dossier_source> [--compress] [--exclude motif]"
    echo "  --compress : utilise la compression gzip (.tar.gz)"
    echo "  --exclude  : exclut les fichiers correspondant au motif (tar --exclude)"
    exit 1
}














