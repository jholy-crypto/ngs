# NGS_Practicals_Medical

Tout d'abord il faut récupérer les identifiants SRR de patients à qui on s'intéresse depuis la GEO database "https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA316676"
Nous, on s'intéresse aux patients non-répondeurs avant et après le traitement avec Bemacizumab

#get_fastqc

Permet de modifier les nom de séquences et générer les fichiers fastq pour la liste de patients d'intêret 

#fastqc.sh

Permet de générer les fichiers fastqc contenant principalement des informations sur la qualité de sequences ainsi que l'identification de sequences surrepresentées  

#multiqc.sh

Une fois les fichiers générés pour chaque patient, on peut les rassembler dans un fichier multiqc

#trimmomatic.sh

trimomatic permet de nettoyer les fichiers vis-à-vis de séquences sur-representées qui sont dans un fichier fasta .fa
ces sequences correspondent principalement aux adapteurs, primers, polyA voire des ARN ribosomiques
il est important de savoir que trimmomatic ne peut lire que les fichiers dont le nom a été modifiéau au préalable, dans notre cas par get_fastqc.sh

#fastqc_nettoyage.sh

permet de vérifier que les sequences définies dans le fichier fasta ont été enlevées en générant de nouveaux fichiers fastqc

#get_cDNA
permet d'importer le transcriptome humain et son annotation depuis Ensbl 

#salmon.sh

salmon permet tout d'abord de créer un index du transcriptome humain sur lequel il fera une analyse comparative des séquences de nos patients et puis une quantification de reads par transcrit.

Pour nos données, salmon affiche un overlap d'environ 15-30% alors qu'il faut environ 80% pour des interpretations fiables
cette qualité on suppose que c'est du à de regions intergéniques provenant des ARN immatures, ou de possibles contamination par de l'ADN génomique qui ne sont donc pas representées sur le transcriptome. Pour éviter cela ...

#star.sh

Star permet de générer un Index sur le génome entier (fournit par Corenthin/ sinon générer un index avec un code similaire au get_cDNA.sh) et donc prend en compte toutes les séquences qui n'ont pas été reconnues par Salmon.
Ensuite star fait une quantification de reads par transcrit.

#qualimap.sh

pour vérifier que star permet d'obtenir un meilleur overlapping sur nos séquences on execute qualimap.sh 

#tximportR
une fois la quantification mise en place, on fait l'analyse differentielle d'expression grâce au programme DEseq.
tout d'abord on crée une matrice contenant les patients et les caracteristiques d'intêret (time,réponse,sexe,etc)
puis on execute DEseq sur les données de la matrice
ensuite on fait le shrinkage pour enlever l'effet de petites valeurs de foldchange sur les gènes differentiellement et significativement exprimés
finalement on génére les MAplots associés qui nous permettront de determiner la quantité de gènes differentiellement surexprimés ou downregulés ainsi que d'identifier leur nature et trouver leur lien avec la question biologique.
