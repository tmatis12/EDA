#This R script refers to the lesson on Dataframes in R 
#https://docs.google.com/document/d/e/2PACX-1vQvL3CfCKAT717JrlRGwpNPYV9f-Zxy3uMPXEcDE3R_J4lskjAMWsmCW4bRcRQViA/pub

#Question 1
gender<-c("M","M","M","M","M","M","M","M","M","F","F","F","F","F","F","F","F","F") #vectors are entered as c()
gender
gender<-c(rep("M",9),rep("F",9)) #rep is repeat 
gender
str(gender) #str gives you the datatype
is.character(gender) #check datatypes by is.XXX
is.factor(gender)
gender<-as.factor(gender) #convert between datatypes with as.XXX 
is.factor(gender)
length(gender)

own.home<-c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE) #Boolean are entered as all caps
str(own.home)
length(own.home)

dat<-data.frame(gender,own.home) #combine vectors into a dataframe
dat
str(dat)

dat$col3<-c(1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3) #a $ sign refers to a column in dat, can create columns with $ sign
dat
seq(1:3)
dat$col3<-c(seq(1:3)) #seq is sequence.  R will recycle vectors to fill up rows of a dataframe 
dat
str(dat)
dat$col3<-as.factor(dat$col3)
str(dat)

obs1<-c(9.49,9.24,11.48,9.80,9.54,11.01,11.43,8.94,9.80,8.56,10.73,10.49,10.02,9.67,9.81,11.89,10.84,11.61)
str(obs1)
obs2<-c(4,6,7,3,5,2,7,9,4,2,NA,6,8,4,4,7,8,2) #enter NA for a missing observation
str(obs2)
obs2<-as.integer(obs2)
str(obs2)
comments<-c("good","yuck","not for me","help","what","great",NA,"nope","bad","big yes",
            "yellow","nuts","loved it","maybe","somewhat","great","the best","yessss") #can break lines
str(comments)

dat<-data.frame(dat,obs1,obs2,comments) #can create a dataframe with a dataframe and additional columns
is.data.frame(dat)
nrow(dat) #nrow() returns number of rows in dataframe
ncol(dat) #ncol() returns number of columns in dataframe


#Question 2
#convention: dat[rows,columns]
dat2<-dat[,4:5] #the convention is [rows,columns], a blank refers to all of the corresponding rows/columns
dat2
head(dat2) #head gives back only the first six rows of a dataframe
dat2<-dat[,c(4,5)]
head(dat2)
dat
dat2<-dat[,-c(1,2,3,6)] #a negative sign means to drop
head(dat2)

#Question 3
dat
dat3<-dat[,c(1,2,4,5)]
head(dat3)
dat3$obs1.square<-(dat$obs1)^2
head(dat3)
dat3$obs.diff<-dat$obs1-dat$obs2
head(dat3)
dat3$obs.sum<-dat$obs1+dat$obs2 #NA present
dat3
dat3$obs.sum<-rowSums(dat[,4:5]) #can use rowSums for sum on rows, NA present
dat3$obs.sum<-rowSums(dat[,4:5],na.rm=TRUE) #NAs are treated as a zero, NA omitted
dat3

#Question 4
dat
dat4<-na.omit(dat) #na.omit() removes all rows with an NA 
dat4
nrow(dat4)
ncol(dat4)

#Question 5
dat5<-dat[dat$gender=="M",] # the == sign is a boolean test for equality
dat5
nrow(dat5)
dat5<-dat[dat$gender!="F",] # the != sign is a boolean test for not equal 
dat5

#Question 6
dat6<-dat[dat$gender=="M"&dat$obs1<=10,] # the & sign is the AND operator
dat6

#Question 7
dat7<-dat[dat$gender=="M"|dat$obs1<=10,] # the | sign is the OR operator
dat7

#Question 8
dat8<-dat[dat$gender=="M"&dat$own.home==FALSE,c(1,6)]
dat8
