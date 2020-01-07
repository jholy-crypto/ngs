#! /bin/bash
resultfastqc=/home/rstudio/disk/resultfastqc
#variable qui contient le chemin de fichiers à suivre
FASTQ=`ls /home/rstudio/disk/sra_data` 
# ls: list (guillaumés inversés) 
# FASTQ permet d'envoyer une liste avec les noms des infos sur Sra_data
mkdir -p $resultfastqc
#mk dir permet de creer le dossier "resultfastqc" pour le stockage des fichiers issus de FASTQ 
for fichier in $FASTQ 
do 
fastqc /home/rstudio/disk/sra_data/$fichier -o $resultfastqc
#permet d'envoyer les fichiers issues de la fonction fastqc sur le dossier resultfastqc
done 

