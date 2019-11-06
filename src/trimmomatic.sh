#! /bin/bash
## Run trimmomatic
fasta="/home/rstudio/disk/fasta"
mkdir -p $fasta

paired="/home/rstudio/disk/paired"
mkdir -p $paired
unpaired="/home/rstudio/disk/unpaired"
mkdir -p $unpaired
cd $fasta
#definir les dossiers paired unpaired pour deposer les infos issues de la trimomomatic
SRR="SRR3308950
SRR3308951
SRR3308952
SRR3308953
"

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

