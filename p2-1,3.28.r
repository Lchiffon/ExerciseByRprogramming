rt<-read.table("data2-1.txt",head=TRUE);rt
# ע��TRUE�Ǵ�д�ģ�������.txt
ls1<-lm(Weight~Height,data=rt);
summary(ls1)
fix(rt)