#!/bin/bash
# Module Report - Version complète

REPORT_DIR="reports"
REPORT_FILE="$REPORT_DIR/report_$(date +%Y%m%d_%H%M%S).txt"

mkdir -p "$REPORT_DIR"

{
    echo "========================================="
    echo "         RAPPORT SYSTÈME - SysKit"
    echo "========================================="
    echo "Date de génération : $(date)"
    echo "Utilisateur        : $(whoami)"
    echo "Machine            : $(hostname)"
    echo ""
    echo "--- INVENTAIRE SYSTÈME ---"
    ./modules/inventory.sh
    echo ""
    echo "--- SAUVEGARDES RÉALISÉES ---"
    if [ -d "backup" ] && [ "$(ls -A backup 2>/dev/null)" ]; then
        ls -lh backup/
    else
        echo "Aucune sauvegarde trouvée."
    fi
    echo ""
    echo "--- NETTOYAGE ---"
    if [ -f "logs/cleanup.log" ]; then
        echo "Dernier nettoyage :"
        tail -n 5 logs/cleanup.log
    else
        echo "Aucun log de nettoyage disponible."
    fi
    echo ""
    echo "--- FIN DU RAPPORT ---"
} > "$REPORT_FILE"

echo "Rapport généré : $REPORT_FILE"
