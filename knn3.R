# knn on intrusion dataset
data<-read.csv(file.choose())
data
data$class<-factor(data$class)
nrow(data)
ncol(data)
table(data$class)
round(prop.table(table(data$class))*100,digits = 1)
normalise<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
data_n<-as.data.frame(lapply(data[5:41],normalise))
data_train<-data_n[1:16544,]
data_test<-data_n[16545:25192,]
data_train_labels<-data[1:16544,]$class
data_test_labels<-data[16545:25192,]$class
library(class)
data_test_prepd<-knn(data_train, data_test,data_train_labels,k=21)
library(gmodels)
CrossTable(x=data_test_labels,y=data_test_prepd,prop.chisq=FALSE)  # this gives the details about the number of values matched and not matched while testing
aa<-table(data_test_labels,data_test_prepd)
library(caret)
confusionMatrix(aa)  #this tells about the accuracy of the model