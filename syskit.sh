#!/bin/bash

commande= $1
argument= $2

if [ "$commande" = "inventory" ]
then 
	bash modules/inventory.sh


elif [ "$commande" = "backup" ]
then
	bash modules/backup.sh "$argument"

elif [ "$commande" = "cleanup" ]
then
	bash modules/cleanup.sh "$argument"

 elif [ "$commande" = "report" ]
then
	bash modules/report.sh 

else 
	echo "commande invalide"
	echo "ultilisation :"
	echo " ./syskit.sh inventory"
	echo " ./syskit.sh backup dossier"
	echo "./syskit.sh cleanup dossier"
	echo " ./syskit.sh report"
fi 

