# Run MTM and estimate G and E variance-covariance matrices for 17 traits 
# 09-04-2018, G. Slavov 
# http://quantgen.github.io/MTM/vignette.html
# Some minor changes for GitHub upload by Chris Davey 14/9/18


library(MTM)
library(rrBLUP)

#Load G matrix
load("G_v2.RData")

#Load random number seed.
load("current_seeds.RData")

traits<-1:17 
reps <-1
blank_cols = 7 # blank columns in pheno file

#Phenos 
pheno_data<-read.csv("pheno_data_v2.csv")
print(str(pheno_data))

# Genos
G<-t(G) # Transpose for A.mat!
print(dim(G))

# Kinship/GRM matrix 
K <- A.mat(G)
rownames(K)<-pheno_data$geno

P<-data.frame(pheno_data[,(blank_cols+1):(blank_cols+length(traits))])

										# Get estimates of genetic variances and covariances using MTM 
										fm_all <- MTM(
										  Y = P,
										  K = list(
											list(
											  K = K,
											  COV = list(
												type = 'UN',
												df0 = 17,
												S0 = diag(17)
											  )
											)
										  ),
										  resCov = list(
											type = 'UN',
											S0 = diag(17),
											df0 = 17
										  ),
										  nIter = 11000,
										  burnIn = 1000,
										  thin = 5,
										 )
Emat<-fm_all$resCov$R # residual covariance matrix
Gmat<-fm_all$K[[1]]$G # genetic covariance matrix
rownames(Gmat)=colnames(Gmat)=rownames(Emat)

# Print/save files
rm(G)
save.image("out_varcovar_miscanthus_2TT_138_MTM_blues.RData")