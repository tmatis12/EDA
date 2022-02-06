#this R file refers back to the lesson 4 page found here
#https://docs.google.com/document/d/e/2PACX-1vRgJKxCmW1wnlqIQ4CGFbHa2OpbdAulnVKcxPEHayXf1peHyRCKPOJCh1t0HjDk_tvnU9JCrYA-TxZX/pub

dat<-read.csv("/Users/timothymatis/Downloads/InventoryExcerpt.csv")
dat$Category<-as.factor(dat$Category) #Set category as a factor
dat$InventoryABC<-as.factor(dat$InventoryABC) #set InventoryABC as a factor
str(dat)
######### Outlier Filtering - Last Lesson #####
#Examine Qty numeric variable
boxplot(dat$Qty) #boxplot doesn't look right 
boxplot.stats(dat$Qty)$out #the outliers
dat[dat$Qty %in% boxplot.stats(dat$Qty)$out, ]#filter outliers and examine
dat[dat$Qty %in% c(1098,546), ]#same as above 
dat[!(dat$Qty %in% boxplot.stats(dat$Qty)$out), ] ##remove all flagged outliers
dat[dat$Qty<=median(dat$Qty)+1.5*IQR(dat$Qty)&dat$Qty>=median(dat$Qty)-1.5*IQR(dat$Qty), ] #same as above
dat<-dat[dat$Qty!=1098,] #remove outliers deemed mistakes one at a time
dat<-dat[dat$Qty!=546,] 
dat
boxplot(dat$Qty) #boxplot looks better
dat[dat$Qty<=0,] #logical outliers, can't have orders with zero quantity
dat<-dat[dat$Qty!=0,] #filter logical outliers
dat

boxplot(dat$FillTime) #lower whisker is below zero 
dat[dat$FillTime<=0, ]
dat<-dat[dat$FillTime!=-30.09,]
boxplot(dat$FillTime)





####################### Plotting Options ##############################

#### Basic Options ####
hist(dat$FillTime)

colors()
hist(dat$FillTime,
     col="yellow",
     main="FillTime",
     sub="Histogram on FillTime",
     xlab="Time(minutes)",
     ylab="Frequency",
     ylim=c(0,5),
     xlim=c(0,150)) 

### Increasing/Decreasing Sizes ######
hist(dat$Qty,
     col="red",
     main="Quantity",
     cex.main=1.5,
     sub="Histogram on Quantity",
     cex.sub=1.25,
     xlab="Quantity",
     ylab="Frequency",
     cex.axis=.5,
     cex.lab=1.0)

#### Changing fonts 1=Plain, 2=Bold, 3=Italics, 4=Bold+Italic####
plot(density(dat$Qty),
     main="Density Plot",
     font.main=4,
     xlab="Quantity",
     font.lab=3)

##### Adding border color #####
plot(dat$Category,
     col="blue",
     border="red")

##### Changing scatterplot points ####
plot(dat$FillTime,dat$Qty,
     pch=1) 
plot(dat$FillTime,dat$Qty,
     pch=3)
plot(dat$FillTime,dat$Qty,
     pch=2,col="green") # can set border color
plot(dat$FillTime,dat$Qty,
     pch=21, bg="red",col="blue")# can set fill color for pch 21-25
ccplot(dat$FillTime,dat$Qty,
     pch=21, bg="red",col="blue",cex=2) # can make pts bigger with cex 

#### Changing line options ####
dat<-dat[order(dat$FillTime),] #sort by order on x-axis
plot(dat$FillTime,dat$Qty,type="l") 
plot(dat$FillTime,dat$Qty,type="l",
     col="blue",
     lwd=5,
     lty=4) #lwd=line width, lty=line type

###### Multiple Lines and Legends #####
dat2<-dat
dat2$Qty2<-c(2,6,4,2,7,8,4,3,2,7)
plot(dat2$FillTime,dat2$Qty,type="b",pch=1,col="blue",lty=3)
lines(dat2$FillTime,dat2$Qty2,type="b",pch=2,col="red",lty=5)
legend("topleft",
       c("Qty","Qty2"),
       col=c("blue","red"),
       pch=c(1,2),
       lty=c(3,5))

############ Color by Factor Levels ######
boxplot(dat$FillTime~dat$Category,col="blue")

boxplot(dat$FillTime~dat$Category,col=c("red","blue","green","yellow"))
boxplot(dat$FillTime~dat$Category,col=rainbow(nlevels(dat$Category)))

boxplot(dat$FillTime~dat$Category)
stripchart(dat$FillTime~dat$Category,vertical=TRUE,add=TRUE,pch=2,jitter=TRUE)


######### Matrix of Plots #########
par(mfrow=c(1,2))
plot(dat$Category)
plot(dat$FillTime,dat$Qty,
     pch=1) 

par(mfrow=c(2,2))
plot(dat$Category)
plot(dat$FillTime,dat$Qty,
     pch=1) 
hist(dat$Qty)
boxplot(dat$FillTime~dat$Category)
par(mfrow=c(1,1))


