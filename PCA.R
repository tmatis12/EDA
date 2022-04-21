USArrests #uze built in dataset
scale(USArrests,center=TRUE,scale=TRUE) #center of variables in USArrests

pr.out<-prcomp(USArrests,scale=TRUE) #varaibles are centered by default and standardized with scale=TRUE
pr.out$center
pr.out$sdev
pr.out$rotation
pr.out$x

?screeplot
screeplot(pr.out,type="lines")
#install.packages("factoextra")
library(factoextra)
fviz_eig(pr.out) #screeplot
fviz_pca_var(pr.out) #plot of how strongly the variables align with the first two principal components
fviz_pca_ind(pr.out) #plot of observations on the first two principal components
biplot(dat)#biplot in base R
fviz_pca_biplot(dat) #prettier biplot
