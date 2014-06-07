test=function(x){
verse=0
while(x>0){
verse=verse*10+x%%10
x=x%/%10
}
return(verse)
}
x=y=999:100
data=expand.grid(x=x,y=y)
data$z=data$x*data$y
data<-data[order(data$z,decreasing=T),]
m=0
for(i in 1:length(z)){
if(data$z[i]==test(data$z[i])) {
m=data$z[i]
break
}
}
print(m)
