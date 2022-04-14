######## KMeans Clustering ######
## data must be numerical, not categorical 
set.seed(3233837) #randomly set some seed
x<-c(rnorm(25,10,1),rnorm(25,12,1)) #generate x variables
y<-c(rnorm(25,15,1),rnorm(25,10,1))  #generate y varaibles 
df<-data.frame(x,y) #put into data frame
plot(df) #notice there are two natural clusters in the way we generated x and y

?kmeans #inspect the kmeans function
km.out<-kmeans(df,2) 
km.out$cluster
plot(df,col=(km.out$cluster))

km.out<-kmeans(df,2,nstart=20) #can have multiple random starts, to avoid local minimums
plot(df,col=(km.out$cluster))

km.out<-kmeans(df,3) #in this case we want 3 clusters, let nstart=1 (default)
plot(df,col=(km.out$cluster)) #note the selected clusters
km.out<-kmeans(df,3,nstart=20) #now let nstart=20
plot(df,col=(km.out$cluster)) #note that the set of clusters that minimizes the within cluster variation changes
