library(BGSIMD)
library(ggplot2)
a=c(0.2,0.4,0.1,0.5)
b=c(0.05,0.1,0.1,0.15)
miu0=c(0.35,0.35,0.25,0.25)
c(a*miu0+b,1-sum(a*miu0+b))->be
c(rmultinom(1,30000,be))->y


muti_gibbs<-function(n=10000){
z<-data.frame(1:n,1:n,1:n,1:n)
miu<-rep(0,n)
eta<-rep(0,n)
z[1,]<-c(1,2,3,4)
for (i in 2:n){
  alpha=c(z[i-1,1]+z[i-1,2]+0.5,z[i-1,3]+z[i-1,4]+0.5,y[5]+0.5)
  r1<-rdirichlet(1, alpha)
  miu[i]<-r1[1]
  eta[i]<-r1[2]
  z[i,1]<-rbinom(1,y[1],a[1]*miu[i]/(a[1]*miu[i]+b[1]))
  z[i,2]<-rbinom(1,y[2],a[2]*miu[i]/(a[2]*miu[i]+b[2]))
  z[i,3]<-rbinom(1,y[3],a[3]*eta[i]/(a[3]*eta[i]+b[3]))
  z[i,4]<-rbinom(1,y[4],a[4]*eta[i]/(a[4]*eta[i]+b[4])) 
}
data.frame(miu,eta,z)
}

data<-muti_gibbs(10000)
miu1<-data$miu[2000:10000]
list(summary(miu1),var(miu1))
eta1<-data$eta[2000:10000]
list(summary(eta1),var(eta1))


