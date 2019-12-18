#! /bin/bash

cd /home/rstudio/disk/
mkdir -p star/index

#Liste des SRR d'intérêt
SRR="SRR3308950"
#SRR3308951
#SRR3308952
#SRR3308953
#SRR3308954
#SRR3308955
#SRR3308958
#SRR3308959
#SRR3308960
#SRR3308961
#SRR3308965
#SRR3308966
#SRR3308967
#SRR3308968
#SRR3308969
#SRR3308970
#SRR3308971
#SRR3308977
#SRR3308980
#SRR3308981
#SRR3308984
#SRR3308985"
#"

#Génération de l'index du génome humain annoté, avec 7 coeurs
#STAR --runThreadN 1 --runMode genomeGenerate \
#  --genomeDir star/index \
# --genomeFastaFiles Hsap_genome.fa \
#  --sjdbGTFfile Hsap_annotation.gtf \
#  --sjdbOverhang 100 \
#  --genomeChrBinNbits 18


paired=/home/rstudio/disk/paired

for srr in $SRR :
do
#Création d'un nouveau répertoire
cd /home/rstudio/disk/
mkdir -p star/$srr'_star'
cd star/$srr'_star'
#Quantification des reads
STAR --runThreadN 7 --genomeDir /home/rstudio/disk/star/index \
  --readFilesIn $paired/$srr'_fasta_paired_1.fastq' \
  $paired/$srr'_fasta_paired_2.fastq'
  
#Le fichier Aligned.out.sam est renvoyé par STAR, mais il est trop gros -> conversion en .bam, plus léger
samtools view -bS -h Aligned.out.sam > $srr'.bam'
#L'ancien fichier .sam est supprimé
rm Aligned.out.sam

done
