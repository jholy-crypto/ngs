#! /bin/bash
multiqcresult=/home/rstudio/disk/multiqresult
resultfastqc=/home/rstudio/disk/resultfastqc
mkdir -p $multiqcresult
cd $multiqcresult
# cd est necessaire pour placer l'endroit auquel multiqc doit agir
multiqc $resultfastqc/*
#*: tous les fichiers du dossier


