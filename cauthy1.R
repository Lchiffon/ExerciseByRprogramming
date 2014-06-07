
ts<-function(miu){
mean=rep(0,1000)
for (i in 1:1000){
  mean[i]<-sit(x=miu)
}
mean
}
sit<-function(x=4){
rcauchy(10,location=0,scale=1)->rr
sum=0
div=0
for (i in 1:10){
  sum=rr[i]*exp(-(x-rr[i])^2/2)+sum
  div=exp(-(x-rr[i])^2/2)+div
}
sum/div
}
miu=seq(0,6,by=0.1)
mean<-ts(miu[1])
mu<-rep(0,1000)
for (i in 2:61){
  mean<-c(mean,ts(miu[i])-miu[i])
  mu<-c(mu,rep(miu[i],1000))
}

plot(mu,mean,pch=20)
