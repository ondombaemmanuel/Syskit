#!/bin/bash
echo "=== INVENTAIRE SYSTÈME ==="
echo "Date       : $(date)"
echo "Machine    : $(hostname)"
echo "Utilisateur: $(whoami)"
echo "Système    : $(uname -a)"
echo "Mémoire RAM:"
free -h | grep Mem
echo "Espace disque (/) :"
df -h / | tail -1

