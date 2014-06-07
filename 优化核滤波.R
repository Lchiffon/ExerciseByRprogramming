klb3<-function(x,h,q){
  y=dim(x)
  y[1]->length
  y[2]->width
  N=length*width
  z=0
  w0=0
  ##########################################
  for(i in 1:(2*q+1)^2){
    c<-q+1
    if(i%%c==0)
      w1=i/c
    else
      w1=round(i/c)+1
    l1=i-c*(w1-1) 
    w0[i]=dnorm((w1-q-1)/h)*dnorm((l1-q-1)/h)
  }
  #第一个循环 构造权重w0
  ##########################################
  for(i in 1:N){
    ###if循环计算位置
    if(i%%length==0)
      w1=i/length
    else
      w1=round(i/length)+1
    l1=i-length*(w1-1) 
    #计算第i个x所对应的行与列    
      w2=min(1,w1-q):max(width,w1+q)
      l2=min(1,l1-q):max(length,l1+q)
     
    j=length*(w2-1)+l2
      w[i]=w0[q,q]
    z[i]=sum(w*x/sum(w))    
  }
  #第二个循环，估计预测值
  ##########################################
  z=matrix(z,ncol=width)
  output=z
}