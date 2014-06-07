library(quantmod)
amzn=getSymbols("AMZN",auto.assign=FALSE)
sampleTimes=index(amzn)
View(amzn)
amzn1<-data.frame(amzn)
row.names(amzn1)->a
aa<-strsplit(a,"\\-")
ve=rep(0,length(aa))
for (i in 1:length(aa)){
  ve[i]<-as.numeric(sum("2012"==aa[[i]]))
}
sum(ve)
class(a)
