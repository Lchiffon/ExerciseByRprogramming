klb<-function(x,h){
  y=dim(x)
  y[1]->length
  y[2]->width
  N=length*width
  z=0
  w=0
  for(i in 1:N){
    if(i%%length==0)
      w1=i/length
    else
      w1=round(i/length)+1
    l1=i-length*(w1-1) 
    #计算第i个x所对应的行与列
    for (j in 1:N){
      if(j%%length==0)
        w2=j/length
      else
        w2=round(j/length)+1
      l2=j-length*(w2-1) 
      #计算l2，w2
      w[j]=dnorm((w1-w2)/h)*dnorm((l1-l2)/h)
          }
   z[i]=sum(w*x/sum(w))    
  }
  z=matrix(z,ncol=width)
  output=z
}