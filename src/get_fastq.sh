#! /bin/bash

# Hsapiens
data="/home/rstudio/disk"
mkdir -p $data
cd $data
mkdir -p sra_data
cd sra_data

SRR="SRR3308950
SRR3308951
SRR3308952
SRR3308953
"

for srr in $SRR
do
# Produces one fastq file, single end data. 
fastq-dump $srr -O /home/rstudio/disk/sra_data --split-files -I


# rename sequence names
# example awk -F"\." '{ if (NR%2 == 1) { $3="" ; print $1 "_" $2 "/1"} else {print $0} }'
# separe les lignes en differents morceaux  -F (definition de champs) NR%2 (si numero de la ligne est impaire @ et +) afficher $1
# titre/sequence/titre/qualité 
awk -F"\." '{ if (NR%2 == 1) { $3="" ; print $1 "_" $2 "/1"} else {print $0} }' $srr'_1.fastq'> temp1.fastq 
awk -F"\." '{ if (NR%2 == 1) { $3="" ; print $1 "_" $2 "/2"} else {print $0} }' $srr'_2.fastq'> temp2.fastq 
mv temp1.fastq $srr'_1.fastq'
mv temp2.fastq $srr'_2.fastq'
done
