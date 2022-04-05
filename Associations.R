########## Measures of Association ###################

############ Numerical by Numerical: Linear Correlation - Pearson's Correlation Coefficient #####
data() #built in datasets in R 
mtcars #built in dataset of MotorTrend Cars

plot(mtcars$mpg,mtcars$wt) #plot of mpg by weight
?cor
cor(mtcars$mpg,mtcars$wt) #correlation of mpg and weight
?cor.test
cor.test(mtcars$mpg,mtcars$wt) #test correlation of mpg and weight

mtcars2<-mtcars[,c(1,3,4,5,6,7)] #Keep only continuous variables
mtcars2

cor(mtcars2) #correlation of all variables

## visualize all correlations ##
#install.packages("corrplot")
library(corrplot)
?corrplot
corrplot::corrplot(cor(mtcars2)) #visualize all correlations
corrplot::corrplot(cor(mtcars2),type="upper")
corrplot::corrplot(cor(mtcars2),type="upper",method="ellipse")
corrplot::corrplot(cor(mtcars2),type="upper",method="number")

## test all correlations (table of p-values) ##
#install.packages("Hmisc")
library(Hmisc)
?rcorr
Hmisc::rcorr(as.matrix(mtcars2)) #must convert data table to matrix 

######### Numerical by Numerical: Monotonic Relationship - Spearman's Rank Order Correlation Coefficient ########

mtcars #built in dataset of MotorTrend Cars
mtcars2<-mtcars[,c(1,3,4,5,6,7)]  #Keep only continuous variables
mtcars2

plot(mtcars$mpg,mtcars$wt) #plot of mpg by weight
cor(mtcars$mpg,mtcars$wt,method="spearman") #correlation of mpg and weight
cor.test(mtcars$mpg,mtcars$wt,method="spearman") #test correlation of mpg and weight
cor(mtcars2,method="spearman")
Hmisc::rcorr(as.matrix(mtcars2),type="spearman")

library(MASS)
data("Boston") #built in dataset for median house value
head(Boston)
plot(Boston$medv,Boston$lstat) # mdef=median house value, lstat= % lower status 
cor(Boston$medv,Boston$lstat)
cor(Boston$medv,Boston$lstat, method="spearman")

######### Categorical by Categorical: CramersV: Strength of Association #######
mtcars
library(greybox)
greybox::tableplot(mtcars$am,mtcars$gear)
greybox::cramer(mtcars$am,mtcars$gear)
greybox::tableplot(mtcars$am,mtcars$vs)
greybox::cramer(mtcars$am,mtcars$vs)

######### Categorical by Numerical: Regression #############
mtcars
greybox::mcor(mtcars$gear,mtcars$mpg)
summary(lm(mpg~factor(gear),data=mtcars))# compare to mcor output, note R=sqrt(R^2)

########### All Associations ##############
str(mtcars)
greybox::assoc(mtcars) #Pearson, CramerV, mcor
greybox::spread(mtcars)
