read.csv("getdata_data_ss06hid.csv")->data
names(data)->aaa
strsplit(aaa,"wgtp")


read.csv("getdata_data_GDP.csv",skip=3)->out
out$US.dollars.->gdp
gdp<-as.character(gdp)
gsub(",","",gdp)->raw
for (i in 1:length(raw)){
  if (raw[[i]]==".."){
    raw[[i]]<-NA
  }  
}
vel<-as.numeric(raw)
vel
mean(vel,na.rm=T)

read.csv("getdata_data_GDP.csv",skip=3)->out
read.csv("getdata_data_EDSTATS_Country.csv")->out1
out<-out[2:191,]
merge(out,out1,by="CountryCode")->fiout
