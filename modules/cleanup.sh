#!/bin/bash

# Module cleanup : supprime les fichiers .tmp et les .log de plus de 7 jours
target="$1"

# Vérifie que le dossier cible existe

if [ ! -d "$target" ]; then
	    echo "Erreur : le dossier $target n'existe pas."
	        exit 1
fi

echo "Nettoyage de $target ..."

# Compteur de fichiers supprimés
count=0

# Boucle pour supprimer les fichiers .tmp

for file in "$target"/*.tmp; do
	    if [ -f "$file" ]; then
		            rm "$file"
			            echo "Supprimé : $file"
				            count=$((count + 1))
					        fi
					done

# Boucle pour supprimer les fichiers .log de plus de 7 jours
for file in "$target"/*.log; do
	    if [ -f "$file" ]; then

# Récupère la date de modification en secondes depuis epoch

mod_time=$(stat -c %Y "$file" 2>/dev/null)
        current_time=$(date +%s)
	        age=$(( (current_time - mod_time) / 86400 ))  # age en jours
		        if [ $age -gt 7 ]; then
				            rm "$file"
					                echo "Supprimé (vieux log) : $file"
							            count=$((count + 1))
								            fi
									        fi
									done

									echo "Nettoyage terminé. $count fichier(s) supprimé(s)."













