
library(RODBC)
  M=odbcConnectExcel("C:/Users/Administrator/Desktop/wage1")
  x=sqlFetch(M,"wage1")
  close(M)

library(quantreg)
 fit1=lm(wage~educ+exper+tenure+nonwhite+female+married+numdep+northcen+expersq,data=x)
 summary(fit1)
 
 t=c(seq(0.1,by=0.1,0.9))
 fit3=rq(wage~educ+exper+tenure+nonwhite+female+married+numdep+northcen+expersq,tau=t,data=x) 
 plot(summary(fit3))

 fit2=rq(lwage~educ+exper+tenure+female+expersq,tau=t,data=x) 
 summary(fit2)
 plot(summary(fit2))