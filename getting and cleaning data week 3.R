### getting and cleaning data week 3
### 2014/4/18 13:30

### question 1
 url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
 download.file(url,"data.csv")
 data<-read.csv("data.csv")
 head(data)
 
 log<-(data$ACR==3 & data$AGS==6)
 for (i in 1:length(log)){
   if (is.na(log[i])==T){
     log[i]<-FALSE
   }
 }
 which(log)
 data1<-data[log,]
 
 ## question2
 library(jepg)
 readJPEG("getdata_jeff.jpg",native=TRUE)->dada
 > quantile(dada,c(0.3,0.8))
 
 ## question3
 url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
 url3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv "
 download.file(url2,"data2.csv")
 download.file(url3,"data3.csv")
 data2<-read.csv("data2.csv",head=F)
 data3<-read.csv("data3.csv")
 
 data2_fix<-data2[as.character(data2$V1)!="",]
 head(data2_fix)
 data2_fix$V1<-as.factor(data2_fix$V1)
data2_fix<-data2_fix[1:190,]
 data2_fix$V6<-1:190
 merge(data2_fix,data3,by.x="V1",by.y="CountryCode")->merging
  View(merging)
 mean(merging$V6[merge$Income.Group=="High income: OECD",])
 quantile(merging$V6,probs=c(0,0.2,0.4,0.6,0.8,1))->q
 grop<-cut(merging$V6,breaks=q)
 table(grop)
 
 head(merging[order(merging$V6,decreasing=T),1:6],14)