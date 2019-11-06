#! /bin/bash
multiqcresult=/home/rstudio/disk/multiqresult
resultfastqc=/home/rstudio/disk/resultfastqc
# Permet de préciser le dossier cible pour le multiqc 
mkdir -p $multiqcresult
cd $multiqcresult
# cd est necessaire pour placer l'endroit où multiqc doit agir
multiqc $resultfastqc/*
#*: tous les fichiers du dossier


