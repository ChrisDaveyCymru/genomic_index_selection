# SI with desired gains vs economic values, using Ian Mackay's notation.
# 09-04-2018, G. Slavov 

load("out_varcovar_miscanthus_2TT_138_MTM_blues.RData")

# Means (colMeans(d[,6:22],na.rm=T), where d has 553 obs for the 138 genos)
#    DOYFS1.9          AvgeSen.9     BaseDiameter.9        DryMatter.9       LeafLength.7        LeafWidth.7  MaxCanopyHeight.9         Moisture.9 
#    221.2133891       7.3358696        398.7249545       1065.4722235         52.4290909          1.4184545        144.6709324         30.6474262 
# StatureCategory.7 StatureLeafAngle.7 StatureStemAngle.7     StemDiameter.9      TallestStem.9    TransectCount.9        Cellulose.8    Hemicellulose.8 
#         3.5968921          0.6627057          1.9670932          5.3678245        176.8171846         27.6302368         42.1360958         32.8069245 
#          Lignin.8 
#         8.9534070

# Set var-covar matrices
G<-Gmat
E<-Emat
P<-G+E
H2<-diag(G/P)

# Target traits and desired gains
idx<-c(4,15,17)
G_star<-G[,idx]
Q<-c(213,2.1,-0.45)

# Ian Mackay's calculation of b, correlated responses and relative economic values, as well as sigma_i
s7<-t(G_star)%*%solve(P)%*%G_star
s8<-solve(s7)
s9<-solve(P)%*%G_star
s10<-s9%*%s8
b=s10%*%Q
Q_star= G%*%b
a = solve(G)%*%P%*%b
sigma_i = sqrt(t(b)%*%P%*%b)
print(sigma_i)

# Print/save
print(Q_star)
save.image("out_S2.RData")