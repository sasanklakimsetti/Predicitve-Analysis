# knn on diamond dataset
library(class)
library(caret)
library(gmodels)
data<-diamonds
View(data)
colnames(data)
str(data)
# by analyzing dataset, we can make cut as a factor and it is a factor
data$cut<-as.factor(data$cut)
ncol(data)
nrow(data)
table(data$cut)
round(prop.table(table(data$cut))*100,digits=1)
summary(data[c("depth","table","price","x","y","z")])
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
data_n<-as.data.frame(lapply(data[5:10],normalize))
summary(data_n)
View(data_n)
data_train<-data_n[1:45000,]
data_test<-data_n[45001:nrow(data_n),]
data_train_labels<-data[1:45000,]$cut
data_test_labels<-data[45001:nrow(data),]$cut
length(data_train)
length(data_train_labels)
data_test_prepd<-knn(train=data_train,test=data_test,cl=data_train_labels,k=50)
CrossTable(x = data_test_labels, y = data_test_prepd, prop.chisq = FALSE)
a<-table(data_test_labels,data_test_prepd)
confusionMatrix(a)
