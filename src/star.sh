#! /bin/bash

cd /home/rstudio/disk/
mkdir -p star/index

#Liste des SRR d'intérêt
SRR="
"

#Génération de l'index du génome humain annoté, avec 7 coeurs
STAR --runThreadN 1 --runMode genomeGenerate \
  --genomeDir star/index \
  --genomeFastaFiles Hsap_genome.fa \
  --sjdbGTFfile Hsap_annotation.gtf \
  --sjdbOverhang 100 \
  --genomeChrBinNbits 18


paired=/home/rstudio/disk/data_trimmed/paired

for srr in $SRR :
do
#Création d'un nouveau répertoire
cd /home/rstudio/disk/
mkdir -p star/$srr'_star'
cd star/$srr'_star'
#Quantification des reads
STAR --runThreadN 7 --genomeDir /home/rstudio/disk/star/index \
  --readFilesIn $paired/$srr'_trimmed_paired_1.fastq' \
  $paired/$srr'_trimmed_paired_2.fastq'
  
#Le fichier Aligned.out.sam est renvoyé par STAR, mais il est trop gros -> conversion en .bam, plus léger
samtools view -bS -h Aligned.out.sam > $srr'.bam'
#L'ancien fichier .sam est supprimé
rm Aligned.out.sam

done