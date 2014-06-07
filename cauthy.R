
ts<-function(miu){
mean=rep(0,1000)
for (i in 1:1000){
  mean[i]<-sit(x=miu)
}
var(mean)
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
var=rep(0,61)
for (i in 1:61){
  var[i]<-ts(miu[i])
}
plot(miu,var)
