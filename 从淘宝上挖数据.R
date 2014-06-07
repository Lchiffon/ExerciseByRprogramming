library(XML)
url<-"http://s.taobao.com/search?q=ipad&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&spm=1.6659421.754896237.1&initiative_id=tbindexz_20140409"
doc<-htmlParse(url,encoding="UTF-8")
rootNode<-xmlRoot(doc)
price<-xpathSApply(rootNode,"//div[@class='col price']",xmlValue)
class(price)
price<-substr(price,3,100)
as.numeric(price)