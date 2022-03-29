########## Measures of Association ###################

############ Numerical by Numerical: Linear Correlation - Pearson's Correlation Coefficient #####

mtcars #built in dataset of MotorTrend Cars

plot(mtcars$mpg,mtcars$wt) #plot of mpg by weight
?cor
cor(mtcars$mpg,mtcars$wt) #correlation of mpg and weight
?cor.test
cor.test(mtcars$mpg,mtcars$wt) #test correlation of mpg and weight

mtcars2<-mtcars[,-c(8,9)] #Keep only numerical variables
mtcars2

cor(mtcars2) #correlation of all variables

## visualize all correlations ##
install.packages("corrplot")
library(corrplot)
?corrplot
corrplot(cor(mtcars)) #visualize all correlations
corrplot(cor(mtcars),type="upper")
corrplot(cor(mtcars),type="upper",method="number")

## test all correlations (table of p-values) ##
install.packages("Hmisc")
library(Hmisc)
?rcorr
rcorr(as.matrix(mtcars2)) #must convert data table to matrix 

######### Numerical by Numerical: Monotonic Relationship - Spearman's Rank Order Correlation Coefficient ########

mtcars #built in dataset of MotorTrend Cars
mtcars2<-mtcars[,-c(8,9)] #Keep only numerical variables
mtcars2

plot(mtcars$mpg,mtcars$wt) #plot of mpg by weight
?cor
cor(mtcars$mpg,mtcars$wt,method="spearman") #correlation of mpg and weight
?cor.test
cor.test(mtcars$mpg,mtcars$wt,method="spearman") #test correlation of mpg and weight
rcorr(as.matrix(mtcars2),type="spearman")
?corrplot

library(MASS)
data("Boston") #built in dataset for median house value
head(Boston)
plot(Boston$medv,Boston$lstat) # mdef=median house value, lstat= % lower status 
cor(Boston$medv,Boston$lstat)
cor(Boston$medv,Boston$lstat, method="spearman")
