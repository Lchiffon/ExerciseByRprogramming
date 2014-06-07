 w=read.table('C:/Users/Administrator/Desktop/新建文本文档 (2).txt')
attach(w)
v1=rep(1,length(V1))
x=matrix(c(v1,V2),ncol=2)
y=V1
b=solve(t(x)%*%x)%*%t(x)%*%y
plot(V2,y)
kw=function(x,X,h){
t=0
for (i in 1:length(X)){
t[i]=kh(x,X[i],h)/mean(kh(x,X,h))/length(X)
}
output=t
}
kh=function(a,b,h){
output=(2*pi)^(-0.5)*exp(-((a-b)/h)^2)
}
w=0;h=214
for(i in 1:length(X)){
w[i]=kw(X[i],X,h)%*%V1
}
w