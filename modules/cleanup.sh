#!/bin/bash

target="$1"
dry_run=false
shift

for arg in "$@"; do
	    if [ "$arg" = "--dry-run" ]; then
		            dry_run=true
			            echo "Mode simulation (dry-run) : aucun fichier ne sera vraiment supprimé."
				        fi
				done

				if [ ! -d "$target" ]; then
					    echo "Erreur : le dossier $target n'existe pas."
					        exit 1
				fi

				echo "Nettoyage de $target ..."

				count=0


# .tmp

for file in "$target"/*.tmp; do
	    if [ -f "$file" ]; then
		            if $dry_run; then
				                echo "[Simulation] Supprimer $file"
						        else
								            rm "$file"
									                echo "Supprimé : $file"
											            count=$((count + 1))
												            fi
													        fi
													done
# .log > 7 jours

for file in "$target"/*.log; do
	    if [ -f "$file" ]; then
		            mod_time=$(stat -c %Y "$file" 2>/dev/null)
			            current_time=$(date +%s)
				            age=$(( (current_time - mod_time) / 86400 ))
					            if [ $age -gt 7 ]; then
							                if $dry_run; then
										                echo "[Simulation] Supprimer (vieux log) $file"
												            else
														                    rm "$file"
																                    echo "Supprimé (vieux log) : $file"
																		                    count=$((count + 1))
																				                fi
																						        fi
																							    fi
																						    done

																						    if $dry_run; then
																							        echo "Simulation terminée. $count fichier(s) auraient été supprimés."
																							else
																								    echo "Nettoyage terminé. $count fichier(s) supprimé(s)."





# Écriture dans le log

    mkdir -p logs
        echo "$(date): $count fichiers supprimés dans $target" >> logs/cleanup.log
																						    fi


TARGET=$1
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/cleanup.log"

if [ ! -d "$TARGET" ]; then
    echo "Erreur : le dossier $TARGET n'existe pas."
    exit 1
fi

mkdir -p "$LOG_DIR"

echo "Nettoyage dans $TARGET ..." | tee -a "$LOG_FILE"

# Supprimer les fichiers .tmp
find "$TARGET" -type f -name "*.tmp" -delete -print | tee -a "$LOG_FILE"

# Supprimer les fichiers .log de plus de 7 jours
find "$TARGET" -type f -name "*.log" -mtime +7 -delete -print | tee -a "$LOG_FILE"

echo "Nettoyage terminé." | tee -a "$LOG_FILE"


