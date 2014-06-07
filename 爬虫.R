#*************网页爬虫-R语言实现，函数库文件*******# 
#****作者：oldlee11***************************************# 
#****版本：v0.1*******************************************# 
#****时间：2012-11-14*************************************# 
library(XML); 
#****函数：(crawler1) 
#****概要：网络抓取的主要函数1，可以抓取n个网页的m个变量。每个xpath只爬取一个数据，如果大于1个则提示有误。（精确抓取） 
#****输入： 
#        名称           |    数据格式 
#        url            |    欲抓取的网站的url                向量：n个 
#        xpath          |    给出的抓取变量的xpath            向量：m个 
#        content        |    变量是结点的内容还是结点的属性值 向量：m个   
#                            "text"是内容(默认)，或者是属性名称 
#****输出：只有print，无输出 
#        名称           |    含义   
crawler1<-function(url,xpath,content=rep("text",length(xpath))){     
#如果xpath以及content的数量不同，则输入数据有误     
num_url<-length(url)     
if(length(content)!=length(xpath)){         
print("Error:content和xpath向量的数量不一致!")         
return
     }        
#建立一个num_url行，num_vari列的数据框     
num_vari<-length(xpath)     
result<-data.frame(rep(0,num_url))     
for(i in 2:num_vari){         
cbind(result,rep(0,num_url)) 
    }           
#遍历url向量，依次对相应网页进行抓取     
i<-1     
j<-1     
for(i_url in url){         
i_url_parse<-htmlParse(i_url,encoding="UTF-8")
#读取url网页数据，并使用htmlParse转化。（xml文件使用xmlParse）         
for(j in 1:num_vari){#依次填充一个页面中的不同欲读取的数据值             
node<-getNodeSet(i_url_parse,xpath[j])#通过xpath[i]找到相应变量的xpath结点             
if(length(node)==0){#未爬取到数据，说明xpath有误                 
result[i,j]<-NA                 
print(paste("注意：第",j,"个变量未能在第",i,"个页面中找到,我们会把该数据写为空值"))             
}else if(length(node)==1){#爬取到一个数据，说明正常                 
if(content[j]=="text"){#欲爬取变量的内容                     
result[i,j]<-xmlValue(node[[1]])                 
}else{#欲爬取变量的属性                     
result[i,j]<-xmlGetAttr(node[[1]],content[j])                     
result[i,j]<-iconv(result[i,j],"UTF-8","gbk")#如果是乱码，可以打开此语句。如果是na可以删除此句                 
}             
}else{#爬取到多个数据，本函数不予处理                 
result[i,j]<-NA                 
print(paste("注意：第",j,"个变量能在第",i,"个页面中找到多个,不知您要哪一个，我们会把该数据写为空值"))                 
}         
}         
i<-i+1     
}     
result }   
#****函数：(crawler2) 
#****概要：网络抓取的主要函数2，可以抓取n个网页的1个变量。该xpath可以爬取多个数据，（批量抓取） 
#****输入： 
#        名称           |    数据格式 
#        url            |    欲抓取的网站的url                向量：n个 
#        xpath          |    给出的抓取变量的xpath            向量：1个 
#        content        |    变量是结点的内容还是结点的属性值 向量：1个   
#                            "text"是内容(默认)，或者是属性名称 
#****输出：只有print，无输出 
#        名称           |    含义 
#        url            |    1---n自然数，相同url拥有相同数值 
#        vari           |    读取的数据 
crawler2<-function(url,xpath,content="text"){     
num_url<-length(url)     result<-data.frame(url=0,vari=0)     
i<-1#记录第几个url     
tmp<-1#     
for(i_url in url){         
i_url_parse<-htmlParse(i_url,encoding="UTF-8")#读取url网页数据，并使用htmlParse转化。（xml文件使用xmlParse）         
node<-getNodeSet(i_url_parse,xpath)#通过xpath[i]找到相应变量的xpath结点         
if(length(node)==0){#未爬取到数据，说明xpath有误             
result[tmp,1]<-i             
result[tmp,2]<-NA             
print(paste("注意：变量未能在第",i,"个页面中找到,我们会把该数据写为空值"))             
tmp<-tmp+1         
}else{             
for(j in 1:length(node)){                 
result[tmp,1]<-i                 
if(content=="text"){#欲爬取变量的内容                     
result[tmp,2]<-xmlValue(node[[j]])                 
}else{#欲爬取变量的属性                     
result[tmp,2]<-xmlGetAttr(node[[j]],content)                     
#result[tmp,2]<-iconv(result[tmp,2],"UTF-8","gbk")#如果是乱码，可以打开此语句。如果是na可以删除此句                 
}                 
tmp<-tmp+1             
}         
}         
i<-i+1     
}     
result }   
#test   
#测试crawler1 
#测试内容 
url1<-"http://3c.taobao.com/detail.htm?spm=872.217037.254698.6.deIiSJ&spuid=205341228&cat=1101" 
url2<-"http://3c.taobao.com/detail.htm?spm=872.217037.254698.11.deIiSJ&spuid=203228104&cat=1101" 
url3<-"http://item.taobao.com/item.htm?spm=1020.3.9.122.SCNhDn&id=15695321398&from=" 
url<-c(url1,url2,url3) 
xpath<-c("//div[@id='idetail']//div[@class='info-area']//div[@class='tlt clearfix']//h1","//div[@id='idetail']//div[@class='info-area']//div[@class='key-info']//span[@class='price']") 
crawler1(url,xpath) 
#测试属性值 url<-"http://data.caixin.com/macro/macro_indicator_more.html?id=F0001&cpage=2&pageSize=30&url=macro_indicator_more.html#top"; 
xpath<-"//meta[@name='keywords']" 
content<-"content" crawler1(url,xpath,content)   
#测试crawler2 
url<-"http://list.taobao.com/itemlist/bao.htm?spm=567.116925.155171.105.9ZYYMX&cat=50072693&isprepay=1&viewIndex=1&yp4p_page=0&commend=all&atype=b&style=grid&olu=yes&isnew=2&smc=1&mSelect=false&user_type=0&fl=50072693#!cat=50072693&isprepay=1&user_type=0&as=0&viewIndex=1&yp4p_page=0&commend=all&atype=b&style=grid&olu=yes&isnew=2&mSelect=false&smc=1&json=on&tid=0" 
xpath<-"//li[@class='list-item list-item-grid']" 
content<-"data-commenturl" 
crawler2(url1,xpath,content) 
#疑难：如何破解data-commenturl="{{item.commendHref}}"  
#<li class="list-item list-item-grid" 
data-isrush="{{item.isLimitPromotion}}" 
data-ismall="{{item.isMall}}" 
data-item="{{item.itemId}}" 
data-#params="sellerId={{item.sellerId}}&ip={{extraInfo.userIp}}" 
data-comment="{{item.commend}}" data-commenturl="{{item.commendHref}}" 
data-#virtual="{{item.isVirtual}}">   
url2<-"D://r//lab//网页爬虫//data//bao.htm" 
crawler2(url2,xpath,content)