setwd("C:/Users/Administrator/Desktop/repdata_data_activity")
read.csv("activity.csv")->raw.data
library(ggplot2)
#########
as.character(raw.data$date)->ch_date
strptime(ch_date,"%Y-%m-%d")->re_date
re_date->raw.data$re_date
###change the date variance to the date format


#####question1######
#####What is mean total number of steps taken per day?
levels(raw.data$date)->level
steps=0
for (i in 1:length(level)){
  steps[i]=sum(raw.data$steps[raw.data$date==level[i]],na.rm=T)
}
ggplot(,aes(x=steps))->g1
g1+geom_histogram()
paste("The mean of the steps per day is:",mean(steps))
paste("The median of the steps per day is:",median(steps))
######end of question1######

#####question 2#######
#####What is the average daily activity pattern?
int_level<-levels(factor(raw.data$interval))->int_level
int_steps<-rep(0,length(int_level))
for ( i in 1:length(int_level)){
   int_steps[i]<-mean(raw.data$steps[raw.data$interval==int_level[i]],na.rm=T)
}
int<-data.frame(level=as.numeric(int_level),steps=int_steps)
g2<-ggplot(int,mapping=aes(level,steps))
g2<-g2+geom_path(col="blue")
int[int$steps==max(int$steps),1]->ti
paste(ti,"contains the maximum number of steps")
###end of question2######

#####question 3#######
sum(is.na(raw.data$steps))->na_num
paste("The number of missing value is",na_num)
###report the number of missing value

###use mean for that 5-minute interval 
new_steps=rep(0,length(raw.data$steps))
for (i in 1:length(raw.data$steps)){
  if (is.na(raw.data$steps[i])==T){
    int$steps[raw.data$interval[i]==int$level]->new_steps[i]   
  }else{
    raw.data$steps[i]->new_steps[i]
  }
}
new_hist=0

for (i in 1:length(level)){
  new_hist[i]=sum(new_steps[raw.data$date==level[i]])
}
ggplot(,aes(x=new_hist))->g3
g3<-g3+geom_histogram()
g3
###impact of imputing missing data on the estimates will increase 
### the num of zeros of the total steps
#####end of question 3#######

####question4####
###Are there differences in activity patterns 
####between weekdays and weekends?
weekdays(raw.data$re_date)->weekday
factor_week<-0
for ( i in 1:length(weekday)){
  if (weekday[i]=="Sunday" | weekday[i]=="Saturday"){
    factor_week[i]<-"weekend"
  }else{
    factor_week[i]<-"weekday"
  }
} 

int_steps1<-rep(0,length(int_level))
int_steps2<-rep(0,length(int_level))
for ( i in 1:length(int_level)){
  fac1<-(factor_week=="weekend" & raw.data$interval==int_level[i])
  int_steps1[i]<-mean(raw.data$steps[fac1],na.rm=T)
  fac2<-(factor_week=="weekday" & raw.data$interval==int_level[i])
  int_steps2[i]<-mean(raw.data$steps[fac2],na.rm=T)
}
int2<-data.frame(level=rep(as.numeric(int_level),2),
                 steps=c(int_steps1,int_steps2),
                 week=c(rep("weekend",length(int_level)),
                        rep("weekday",length(int_level))))
g4<-ggplot(int2,mapping=aes(level,steps))
g4<-g4+geom_path(col="blue")+
      facet_grid(.~week)
g4
####end of question 4###