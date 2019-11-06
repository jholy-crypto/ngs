#! /bin/bash
resultfastqc=/home/rstudio/disk/resultfastqc
#variable contenant le chemin de fichiers  
FASTQ=`ls /home/rstudio/disk/sra_data` 
# ls: list guillaumés inversés 
# FASTQ envoie une liste de noms des infos sur Sra_data
mkdir -p $resultfastqc
#mk dir permet de creer le dossier "resultfastqc" pour le stockage des fichiers issus de FASTQ 
for fichier in $FASTQ 
do 
fastqc /home/rstudio/disk/sra_data/$fichier -o $resultfastqc
# envoie les fichiers issues de la fonction fastqc sur resultfastqc 
done 

