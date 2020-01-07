## calculate spearman correlation between MRI features and gene expression
##
setwd("/public/mingwl/JS-BC-ImagingGenomics/10.26-global")
##
## load data
image_174_low <- read.table(file = "QI_Features/imageFeature_174BC_low.txt", sep = "\t", header = T,row.names = 1)
RNA_174_TPM <- read.table(file = "RNA-seq data/Our_RNA_IG/mwl_174_TPM_mRNA-lncRNA.txt", sep = "\t", header = T,row.names = 1)
pData <- read.table(file = "pData_for_IG_V5.txt",sep = "\t",header = T)

RNA_gene_image <- t(rbind(RNA_174_TPM,image_174_low))
##
RNA_gene_image_sub <- list()

