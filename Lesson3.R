#this R file refers back to the lesson 3 page found here
#https://docs.google.com/document/d/e/2PACX-1vS1zJUVzmwrsr0tDNS-A_p5bjIOlD5_oRimyHovDi2jUCJeAzZtlnO-M0OycjTPsgj4cIUZ5xAMkLx0/pub

dat<-read.csv("/Users/timothymatis/Downloads/InventoryExcerpt.csv")
str(dat)

dat$Category<-as.factor(dat$Category) #Set category as a factor
dat$InventoryABC<-as.factor(dat$InventoryABC) #set InventoryABC as a factor
str(dat)

##### Outlier Detection and Handling #######
#Examine Qty numeric variable
boxplot(dat$Qty) #boxplot doesn't look right 
boxplot.stats(dat$Qty)$out #the outliers
dat[dat$Qty %in% boxplot.stats(dat$Qty)$out, ] #filter outliers and examine
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

###### Basic Plotting ########

#### Histogram if x=numeric ####
hist(dat$FillTime) 
?hist
hist(dat$Qty)
hist(dat$Qty,breaks=8)

######Smoothed histogram using plot(density(x)) for x=numeric #####
plot(density(dat$Qty))

#####barchart if x=factor #####
plot(dat$Category)

#####Scatterplot if x=numeric and y=numeric #####
plot(dat$FillTime,dat$Qty) 
#Scatterplot with points
plot(dat$FillTime,dat$Qty,type="p") 
#Scatterplot with lines
plot(dat$FillTime,dat$Qty,type="l") #note the data is in the order it was entered in dataframe
dat<-dat[order(dat$FillTime),] #sort by order on x-axis
plot(dat$FillTime,dat$Qty,type="l") #note difference in plot
#Scatterplot with both points and line
plot(dat$FillTime,dat$Qty,type="b") 
#Scatterplot with histogram type bars
plot(dat$FillTime,dat$Qty,type="h") 
#Scatterplot with stepping lines
plot(dat$FillTime,dat$Qty,type="s") 
#Create scatterplot with least squares line abline(lm(y~x))
plot(dat$FillTime,dat$Qty)
abline(lm(dat$Qty~dat$FillTime))
#Add lines for multiple numeric variables 
dat2<-dat
dat2$Qty2<-c(2,6,4,2,7,8,4,3,2,7)
head(dat2)
plot(dat2$FillTime,dat2$Qty,type="b")
lines(dat2$FillTime,dat2$Qty2,type="b")


######Dotchart with x=numeric and y=labels: dotchart(x,y) #######
dotchart(dat$FillTime,dat$Sku)

######Boxplots if x=factor and y=numeric ########
#plot(x,y) or boxplot(y~x)
plot(dat$Category,dat$FillTime) 
boxplot(dat$FillTime~dat$Category)

#######StripChart if x=factor and y=numeric ########
#stripchart(y~x)
stripchart(dat$FillTime~dat$Category)
?barplot

###### muliple scatterplots if dataframe ###### 
head(dat)
plot(dat[,c(3,4,5)])





