#!/bin/bash
# Script principal SysKit
COMMAND=$1
shift

case $COMMAND in
    inventory)
        ./modules/inventory.sh
        ;;
    backup)
        ./modules/backup.sh "$1"
        ;;
    cleanup)
        ./modules/cleanup.sh "$1"
        ;;
    report)
        ./modules/report.sh
        ;;
    *)
        echo "Commande inconnue"
        ;;
esac 

