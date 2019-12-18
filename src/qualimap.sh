#! /bin/bash
echo "Need to add a dependency : "
sudo apt-get install libxtst6 -y

cd /home/rstudio/disk/
mkdir -p qualimapped 

#Liste des SRR d'intérêt
SRR="
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
SRR3308981"


#SRR3308951"
#SRR3308952

#SRR3308950"

#SRR3308953"
#SRR3308984"
#SRR3308985"

qualimapped=/home/rstudio/disk/qualimapped
cd /home/rstudio/disk/star
for srr in $SRR
do
# sort the bam
samtools sort -O bam -n -@ 7 -o $qualimapped/$srr'.sorted.bam' $srr'_star'/$srr'.bam'

#qualimap rnaseq -bam .bam -gtf .gtf -outdir 
echo $srr'_star'/$srr'.bam' 
done 
