#This R file refers to the following lesson page 
#https://docs.google.com/document/d/e/2PACX-1vQb1GpCpyi9m8LGpiojOvJqr8uQnBoaYAAOjhXLrPF1vxk4bHbElIFBjcfwD-XxVH-rhGwZgjXNofmV/pub

#### Programing Basics in R #### 

#Problem: add together the elements of vectors x and y and put into a vector z
x<-c(1,2,3,4)
y<-c(5,6,7,8)

#How you might do using loops in a Structured Programming language
#using loops may be referred to as a "de-vectorized" approach 
z<-c()
for(i in 1:4){z<-c(z,x[i]+y[i])}
z

#How you might do using functions in a Functional Programming Language
#using functions with vectors for input/output is a "vectorized" approach 
z<-x+y
z
z<-sum(x,y)
z

#may define your own functions, passing in/out vectors
square<-function(a,b) a+b
z<-square(x,y)
z

#If the vectors are of different length, but one is a multiple of the other, R will "recycle" the smaller vector
x<-c(1,2)
y<-c(5,6,7,8)
z<-x+y
z

#If the vectors are of different length, but one is not a multiple of the other, R will "recycle" with a warning
x<-c(1,2,3)
y<-c(5,6,7,8)
z<-x+y
z

#### Read in Function from Packages ####
#install.packages("tidyr") install packages only once 

dat<-read.csv("/Users/timothymatis/Downloads/ProductLeadtimes.csv",header=FALSE)
dat
dat<-tidyr::pivot_longer(dat,cols=-V1) #Can call function from package with package::function()
dat

dat<-read.csv("/Users/timothymatis/Downloads/ProductLeadtimes.csv",header=FALSE)
dat
library(tidyr) #Load packages with library()
dat<-pivot_longer(dat,cols=-V1) #Can call functions without package specification
dat
dat<-dat[,-2] #drop names column
dat
colnames(dat)<-c("Product","Obs")

## Filter by Product 1
dat2<-dat[dat$Product=="Product1",]
mean(dat2$Obs,na.rm=TRUE) #Mean of Product 1 Leadtimes
sd(dat2$Obs,na.rm=TRUE) #Standard Deviation of Product 1 Leadtimes

##Obtain Summary Stats of All Products
Means<-aggregate(Obs~Product,data=dat,mean)
colnames(Means)<-c("Product","Mean")
Means

StDev<-aggregate(Obs~Product,data=dat,sd)
colnames(StDev)<-c("Product","StDev")
StDev

merge(Means,StDev)

