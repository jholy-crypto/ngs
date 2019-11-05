#! /bin/bash

# Hsapiens
data="/home/rstudio/disc"
mkdir -p $data
cd $data
mkdir -p sra_data
cd sra_data

SRR="SRR3308950,
SRR3308951,
SRR3308952,
SRR3308953
"

for srr in $SRR
do
# Produces one fastq file, single end data. 
fastq-dump $srr -O /home/rstudio/disc/sra_data -X 4

# rename sequence names

done
