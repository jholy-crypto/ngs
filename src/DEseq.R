#DE Analysis:

# Libraries:
library(tximport)
library(readr)
library(apeglm)
library(DESeq2,quietly = T)
#on télécharge les librairies/programmes dont on a besoin

# Location of the data:
dir <- "/home/rstudio/disk" ### Ici mettre le dossier dans lequel vous travaillez => Ici on définit le chemin et on le met dans la variable dir.

setwd("/home/rstudio/disk")
#on se met dans Disk

# Import the data:
condition <- read.table("condition.csv",header = T) ### Donner la table des métadata => la premiere ligne ce sont des titres.
#dans la variable condition, on met le tableau avec les métabonnées (échantillon, sexe, type et patient) et on lui dit que la premiere ligne ce sont des titres

files <- file.path(dir,"salmon", paste0(condition$sample,"_salmon_quant"), "quant.sf")
#dans la variable file, on met le chemin vers des fichier quant.sf générés par salmon.
names(files) <- condition$sample
#on nomme le chemin file par le nom de l'échnatillon qu'on récupére dans la colone sample du tableau condition

patient <- c("SRR3308956",
"SRR3308957",
"SRR3308963",
"SRR3308964",
"SRR3308972",
"SRR3308973",
"SRR3308974",
"SRR3308975",
"SRR3308976",
"SRR3308978",
"SRR3308979",
"SRR3308982",
"SRR3308983")

#on définit "patient" comme l'ensemble des patients cités.

files <- files[patient]
# on modifit files pour qu'il ne garde que le subset patient => on ne veut que les chemins des patients. les autres n'existent pas.

# Data frame to known association gene transcript:
tx2 <- as.character(read.table(files[1],header = T,sep = "\t")$Name)
Perou.genes <- unlist(lapply(lapply(strsplit(x = tx2,split = "|",fixed=T),FUN = `[`,1),paste,collapse="_"))
Perou.trans <- unlist(lapply(lapply(strsplit(x = tx2,split = "|",fixed=T),FUN = `[`,1:3),paste,collapse="|"))
tx2 <- data.frame(txname=Perou.trans,geneid=Perou.genes)

txi <- tximport(files,type="salmon",tx2gene=tx2)

## On peut afficher la table de compte avec :
head(txi$counts)


ddsTxi <- DESeqDataSetFromTximport(txi,
colData = ... ,
design = ... )
