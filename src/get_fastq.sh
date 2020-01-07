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
SRR3308954
SRR3308955
SRR3308958
SRR3308959
SRR3308960
SRR3308961
SRR3308965
SRR3308966
SRR3308967
SRR3308968
SRR3308969
SRR3308970
SRR3308971
SRR3308977
SRR3308980
SRR3308981
SRR3308984
SRR3308985"

for srr in $SRR
do
# Produces one fastq file, single end data. 
fastq-dump $srr -O /home/rstudio/disk/sra_data --split-files -I


# permet de renommer les sequences
# example awk -F"\." '{ if (NR%2 == 1) { $3="" ; print $1 "_" $2 "/1"} else {print $0} }'
# les lignes sont separées en differents morceaux  -F (definit un champs) NR%2 (si numero de la ligne est impaire @ et +) afficher $1
# titre/sequence/titre/qualité 
awk -F"\." '{ if (NR%2 == 1) { $3="" ; print $1 "_" $2 "/1"} else {print $0} }' $srr'_1.fastq'> temp1.fastq 
awk -F"\." '{ if (NR%2 == 1) { $3="" ; print $1 "_" $2 "/2"} else {print $0} }' $srr'_2.fastq'> temp2.fastq 
mv temp1.fastq $srr'_1.fastq'
mv temp2.fastq $srr'_2.fastq'
done
