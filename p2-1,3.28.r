rt<-read.table("data2-1.txt",head=TRUE);rt
# 注意TRUE是大写的，别忘记.txt
ls1<-lm(Weight~Height,data=rt);
summary(ls1)
fix(rt)