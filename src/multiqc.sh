#! /bin/bash
multiqcresult=/home/rstudio/disk/multiqresult
# permet de créer le dossier où placer le fichier multiqc
resultfastqc=/home/rstudio/disk/resultfastqc
# Permet de préciser le dossier de travail pour le multiqc.sh
mkdir -p $multiqcresult
cd $multiqcresult
# cd permet de placer l'endroit où multiqc doit agir
multiqc $resultfastqc/*
#*: permet d'obtenir tous les fichiers du dossier


