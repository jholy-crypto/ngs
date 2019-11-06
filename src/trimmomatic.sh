#! /bin/bash
## Run trimmomatic
paired="/home/rstudio/disk/paired"
mkdir -p $paired
unpaired="/home/rstudio/disk/unpaired"
mkdir -p $unpaired
#definir les dossiers paired & unpaired pour deposer les infos issues de la trimomomatic
SRR="SRR3308950
SRR3308951
SRR3308952
SRR3308953
"
# definir les valeurs SRRs sur lesquels tourner
for fn in $SRR;

do
	java -jar /softwares/Trimmomatic-0.39/trimmomatic-0.39.jar \
	  PE \
	  -threads 8 \
	  /home/rstudio/disk/sra_data/$fn'_1.fastq' \
	  /home/rstudio/disk/sra_data/$fn'_2.fastq' \
	  /home/rstudio/disk/paired/$fn'_fasta_paired_1.fastq' \
	  /home/rstudio/disk/unpaired/$fn'_fasta_unpaired_1.fastq' \
	  /home/rstudio/disk/paired/$fn'_fasta_paired_2.fastq' \
	  /home/rstudio/disk/unpaired/$fn'_fasta_unpaired_2.fastq' \
	  ILLUMINACLIP:../aenlever:2:30:10 \
	  LEADING:22 SLIDINGWINDOW:4:22 MINLEN:25

done
# threads: c'est le nombre de noyaux qui tournent pour executer la fonction
# rediriger la fonction sur le bon directoire puis l'executer sur les bons fichiers et 
# les envoyer sur les bons dossiers creés au préalable 
#ILLUMINACLIP: palindromeClipThreshold: specifies how accurate the 
#match between the two 'adapter ligated' reads must be for PE palindrome 
#read alignment
#LEADING:Specifies the minimum quality required to keep a base
#SLIDINGWINDOW: specifies the average quality required 
