zum1=function(x){
if(any(x==c(2,3,5))==1) return(TRUE)
xqrt=round(sqrt(x))
xseq=seq(from=3,to=xqrt,by=2)
if(all(x%%xseq !=0)) return(TRUE)
else return(FALSE)
}
n=600851475143
k=round(sqrt(n))
for(i in seq(from=3,to=k,by=2)){
if(zum1(i)==1&n%%i==0) prime=i
}
prime