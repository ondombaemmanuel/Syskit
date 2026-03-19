markdown
# Syskit- Outil d'automatisation Linux

SysKit est un ensemble de scripts Bash permettant d'automatiser des tâches courantes sur un système Linux.

## Fonctionnalités

- *inventory* : affiche les informations système (date, nom machine, mémoire, disque).
- *backup* : sauvegarde un dossier dans une archive .tar avec la date.  
  Exemple : ./syskit.sh backup /home/user/Documents
- *cleanup* : supprime les fichiers .tmp et les fichiers .log de plus de 7 jours.  
  Options :
  - --dry-run : simule le nettoyage sans rien supprimer.
  - Un compteur affiche le nombre de fichiers supprimés.
  - Un log est enregistré dans logs/cleanup.log.
  Exemple : ./syskit.sh cleanup /tmp --dry-run
- *report* : génère un rapport texte dans reports/ avec les informations système, les sauvegardes et le dernier nettoyage. (à compléter par Charlie)

## Utilisation

Rendre les scripts exécutables :
```bash
chmod +x syskit.sh modules/*.sh
Exemples :

bash
./syskit.sh inventory
./syskit.sh backup /home/user/Documents
./syskit.sh cleanup /tmp
./syskit.sh cleanup /tmp --dry-run
./syskit.sh report
Structure du projet




