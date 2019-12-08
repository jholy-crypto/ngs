#! /bin/bash
resultfastqc_nettoyage=/home/rstudio/disk/resultfastqc_nettoyage
#variable contenant le chemin de fichiers  
FASTQ_nettoyage=`ls /home/rstudio/disk/sra_data` 
# ls: list guillaumés inversés 
# FASTQ envoie une liste de noms des infos sur Sra_data
mkdir -p $resultfastqc_nettoyage
#mk dir permet de creer le dossier "resultfastqc" pour le stockage des fichiers issus de FASTQ 
for fichier in $FASTQ_nettoyage 
do 
fastqc /home/rstudio/disk/sra_data/$fichier -o $resultfastqc_nettoyage
# envoie les fichiers issues de la fonction fastqc sur resultfastqc 
done 