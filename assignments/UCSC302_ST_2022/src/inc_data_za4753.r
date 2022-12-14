# inc_data_za4753.r
library(memisc)
ZA4753<-spss.system.file("mydata/ZA4753_v1-1-0.sav")
mydata<-subset(ZA4753,select=c(v106,v159,v160,v161,v162,v163,&
                                 v164,v165))
attach(mydata)
z<-NULL
y<-100*table(as.matrix(v165))/length(v165)
z<-rbind(z,y)
y<-100*table(as.matrix(v164))/length(v164)
z<-rbind(z,y)
y<-100*table(as.matrix(v163))/length(v163)
z<-rbind(z,y)
y<-100*table(as.matrix(v162))/length(v162)
z<-rbind(z,y)
y<-100*table(as.matrix(v161))/length(v161)
z<-rbind(z,y)
y<-100*table(as.matrix(v160))/length(v160)
z<-rbind(z,y)
y<-c(0,100*table(as.matrix(v159))/length(v159))
z<-rbind(z,y)
myresponses<-c("n.a./don’t know","agree strongly","agree","&
disagree","disagree strongly")