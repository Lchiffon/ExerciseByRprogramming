znum=function(n){
x=2
for(i in seq(from=3,to=n,by=2)){
if(all(i%%x!=0))x=c(x,i)
}
return(x)
}
x=znum(20)
mi=function(a,b){
i=1
while(a^i<b){
i=i+1
}
return(i-1)
}
k=1
for(i in 1:length(x)){
k=k*x[i]^(mi(x[i],20))
}k