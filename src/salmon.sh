#! /bin/bash

cd /home/rstudio/disk
mkdir -p salmon
#création du dossier salmon sur disk

#Liste des SRR d'intérêt
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
## Run salmon

# Permet de créer un index à partir du transcriptome téléchargé avec des k-mères, qui réprésentent de reads, ont une taille de 25
salmon index -t Hsap_cDNA.fa -i salmon/humain_index -k 25

for srr in $SRR :
do
salmon quant -i salmon/humain_index -l A -1 paired/$srr'_fasta_paired_1.fastq' \
  -2 paired/$srr'_fasta_paired_2.fastq' \
  --validateMappings \
  -o salmon/$srr'_quant' \
  --threads 7 --gcBias
#Permet de quantifier en utilisant l'index généré où: -i: index, -l: type de librairie détecté automatiquement, -1 et -2: input
#-o: output, --validateMappings:
#--threads: nombre de coeurs dédiés à l'execution du programme
#--gcBias: option qui permet de corriger les changements dans le taux de GC
echo $srr
done

