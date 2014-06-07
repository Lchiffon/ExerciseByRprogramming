library(ggplot2)
mcmc_test<-function(x0=0,n1=1000,bw=1,label=NULL){
  p<-runif(n1)
  w<-rnorm(n1)
  x[1]<-x0
  for (i in 2:n1){
    y<-x[i-1]+w[i]*bw
    r<-min(dnorm(y,3,5)/dnorm(x[i-1],3,5),1)
    if (r>p[i]){
      x[i]<-y
    }else{
      x[i]<-x[i-1]
    }
  }
  data.frame(n=1:n1,x=x,label=rep(label,n1))->data
}
data1<-mcmc_test(100,bw=5,label="x0=100,n=1000,bw=5")
data2<-mcmc_test(100,bw=1,label="x0=100,n=1000,bw=1")
data3<-mcmc_test(10,bw=5,label="x0=10,n=1000,bw=5")
data4<-mcmc_test(100,n=10000,bw=1,label="x0=10,n=10000,bw=5")
rbind(data1,data2,data3,data4)->data
pic<-ggplot(data,aes(n,x),col=label)
pic+geom_path(aes(colour=label))+
  facet_wrap(~label,ncol=2,scales="free_x")
