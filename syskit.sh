#!/bin/bash
# Script principal SysKit
usage() {
    echo "Utilisation : $0 {inventory|backup|cleanup|report} [options]"
    echo "Exemples :"
    echo "  $0 inventory"
    echo "  $0 backup /home/user/Documents"
    echo "  $0 cleanup /tmp"
    echo "  $0 report"
    exit 1
}

if [ $# -lt 1 ]; then usage; fi

COMMAND=$1
shift

case $COMMAND in
    inventory) ./modules/inventory.sh ;;
    backup)
        if [ $# -lt 1 ]; then echo "Erreur : dossier manquant"; usage; fi
        ./modules/backup.sh "$1"
        ;;
    cleanup)
        if [ $# -lt 1 ]; then echo "Erreur : dossier manquant"; usage; fi
        ./modules/cleanup.sh "$1"
        ;;
    report) ./modules/report.sh ;;
    *) echo "Commande inconnue : $COMMAND"; usage ;;
esac 

