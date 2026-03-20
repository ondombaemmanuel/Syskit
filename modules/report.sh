#!/bin/bash
# Module Report - Génère un rapport système

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
} > "$REPORT_FILE"

echo "Rapport créé : $REPORT_FILE"

