library(quantreg)
b1=rep(0,1000)
b2<-b1
b3<-b2
b4<-b3
for (i in 1:1000){
x<-runif(100,-100,100)
e1<-rnorm(100)
e2<-rt(100,3)
y=1+x*0.5+e1
y1=1+x*0.5+e2
fit1<-lm(y~x)
fit1$coefficients[2]->b1[i]
fit2<-rq(y~x,0.5)
fit2$coefficients[2]->b2[i]
fit3<-lm(y1~x)
fit3$coefficients[2]->b3[i]
fit4<-rq(y1~x,0.5)
fit4$coefficients[2]->b4[i]
}
summary(b1)
summary(b2)
summary(b3)
summary(b4)

