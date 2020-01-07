## calculate spearman correlation between MRI features and gene expression
##
setwd("/public/mingwl/JS-BC-ImagingGenomics/10.26-global")
##
## load data
## 363 low-class MRI features
image_174_low <- read.table(file = "QI_Features/imageFeature_174BC_low.txt", sep = "\t", header = T,row.names = 1)
## combat batch effect correction counts
RNA_174_TPM <- read.table(file = "ComBat/hzx_quantify/mwl_174_counts_after_combat_hzx.txt", sep = "\t", header = T,row.names = 1)
## clinical data
pData <- read.table(file = "pData_for_IG_V5.txt",sep = "\t",header = T)
## Gene-MRI matrix
RNA_gene_image <- t(rbind(RNA_174_TPM,image_174_low))
##
RNA_gene_image_sub <- list()
RNA_gene_image_sub[[1]] <- RNA_gene_image[which(pData$ER_status=="positive"),]
RNA_gene_image_sub[[2]] <- RNA_gene_image[which(pData$ER_status=="negative"),]
RNA_gene_image_sub[[3]] <- RNA_gene_image[which(pData$PR_status=="positive"),]
RNA_gene_image_sub[[4]] <- RNA_gene_image[which(pData$PR_status=="negative"),]
RNA_gene_image_sub[[5]] <- RNA_gene_image[which(pData$Her2_status=="positive"),]
RNA_gene_image_sub[[6]] <- RNA_gene_image[which(pData$Her2_status=="negative"),]
RNA_gene_image_sub[[7]] <- RNA_gene_image[which(pData$Ki67_20_status=="high"),]
RNA_gene_image_sub[[8]] <- RNA_gene_image[which(pData$Ki67_20_status=="low"),]
RNA_gene_image_sub[[9]] <- RNA_gene_image[which(pData$new1_ki67_20=="LumA"),]
RNA_gene_image_sub[[10]] <- RNA_gene_image[which(pData$new1_ki67_20=="LumB_Her2_negative"),]
RNA_gene_image_sub[[11]] <- RNA_gene_image[which(pData$new1_ki67_20=="LumB_Her2_positive"),]
RNA_gene_image_sub[[12]] <- RNA_gene_image[which(pData$new1_ki67_20=="Her2-positive"),]
RNA_gene_image_sub[[13]] <- RNA_gene_image[which(pData$new1_ki67_20=="Triple-negative"),]
RNA_gene_image_sub[[14]] <- RNA_gene_image[which(pData$PAM50=="LumA"),]
RNA_gene_image_sub[[15]] <- RNA_gene_image[which(pData$PAM50=="LumB"),]
RNA_gene_image_sub[[16]] <- RNA_gene_image[which(pData$PAM50=="Her2"),]
RNA_gene_image_sub[[17]] <- RNA_gene_image[which(pData$PAM50=="Basal"),]
RNA_gene_image_sub[[18]] <- RNA_gene_image[which(pData$PAM50=="Normal"),]
RNA_gene_image_sub[[19]] <- RNA_gene_image

BC_conditions <- c("ER+ 127BC","ER- 47BC","PR+ 113BC","PR- 61BC","HER2+ 36BC","HER2- 138BC",
"Ki67-high-20 136BC","Ki67-low-20 38BC","IHC-LumA 29BC","IHC-LumB_Her2- 79BC","IHC-LumB_Her2+ 21BC",
"IHC-Her2_positive 15BC","IHC-TN 30BC","PAM50-LumA 46BC","PAM50-LumB 45BC","PAM50-Her2Enriched 30BC",
"PAM50-Basal 39BC","PAM50-Normal 14BC", "All 174BC")







