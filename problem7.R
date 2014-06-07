zum1=function(x){
if(any(x==c(2,3,5))==1) return(TRUE)
xqrt=round(sqrt(x))
xseq=seq(from=3,to=xqrt,by=2)
if(all(x%%xseq !=0)) return(TRUE)
else return(FALSE)
}
x=c(2,3,5)
i=7
while(length(x)<=10001){
if(zum1(i)) x=c(x,i)
if(length(x)==10001) break
i=i+2
}
x[length(x)]