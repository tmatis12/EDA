#this R file refers to the following lesson page
#https://docs.google.com/document/d/e/2PACX-1vSZodNe5WNjMoBeFKptb82J3GnTk5BRcpc2kEd3cD93fARXZfVAQSmGr7gLB_OY_BI6_MXiibIxCr31/pub

setwd("/Users/timothymatis/Downloads/SampleDataJoin") #Set path to location of datafiles
products<-read.csv("products.csv")
products
products<-read.csv("https://raw.githubusercontent.com/tmatis12/datafiles/main/products.csv") # can download directly from web if available as raw csv
products

sales<-read.csv("sales.csv")
sales #the csv is reading in incorrectly
?read.csv
sales<-read.csv("sales.csv",sep=";") #separator is a semicolon
sales
str(sales) #Invoice number is a character due to missing obs denoted as "." in datafile
sales<-read.csv("sales.csv",sep=";",na.strings=".")
sales
str(sales)

names(products) #header names
names(sales)
colnames(sales)<-c("ProductID","SalesInvoiceNumber") #change header names

dat<-merge(products,sales,by="ProductID") #innerjoin of product and sales
dat
dat$Category<-ifelse(dat$ProductName=="Tablet"|dat$ProductName=="PC","Computer","Peripheral")
dat
str(dat)
dat$ProductID<-as.factor(dat$ProductID)
dat$ProductName<-as.factor(dat$ProductName)
dat$Category<-as.factor(dat$Category)
str(dat)
dat
dat<-dat[order(dat$Price), ] #sort products by price in ascending order
dat
dat<-dat[order(-dat$Price), ] #sort by price in descending order
dat
dat<-dat[order(-dat$Price,dat$SalesInvoiceNumber), ] #sort by price in descending order
dat
dat<-dat[,-1] #Drop ProductID Column
dat
dat<-dat[ ,c(3,2,1,4)] #reorder columns placing InvoiceNumber before Price
dat

mean(dat$Price) #calculate descriptive statistics 
sd(dat$Price)
summary(dat$Price)

mean(dat[dat$Category=="Peripheral",]$Price) #filter dataframe before calculating descriptive statistic
sd(dat[dat$Category=="Peripheral",]$Price)
summary(dat[dat$Category=="Peripheral",]$Price)

ProductCategory<-c("Computer","Peripheral") #calculate vectors for new dataframe
MeanRevenue<-c(mean(dat[dat$Category=="Computer",]$Price),
               mean(dat[dat$Category=="Peripheral",]$Price))
StDevRevenue<-c(sd(dat[dat$Category=="Computer",]$Price),
                sd(dat[dat$Category=="Peripheral",]$Price))
dat2<-data.frame(ProductCategory,MeanRevenue,StDevRevenue) #pull vectors into dataframe
dat2
dat2$MeanRevenue<-round(dat2$MeanRevenue,2) #round data to 2 sig digits
dat2$StDevRevenue<-round(dat2$StDevRevenue,2)
str(dat2)
dat2$ProductCategory<-as.factor(dat2$ProductCategory)
str(dat2)

?write.csv
write.csv(dat2,"SummaryTable.csv")
dat3<-read.csv("SummaryTable.csv")
str(dat3) #the variable type of ProductCategory (factor) is not preserved
?saveRDS
saveRDS(dat2,"SummaryTable.rds")
dat4<-readRDS("SummaryTable.rds")
str(dat4) #the variable type of ProductCategory (factor) is preserved. 
