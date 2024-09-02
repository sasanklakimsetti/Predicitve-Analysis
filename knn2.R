# apply knn algo on iris

irisd<-as.data.frame(iris)
str(irisd)
irisd
table(irisd$Species)
irisd$Species<-factor(irisd$Species,levels=c("setosa","versicolor","virginica"),labels = c("Setosa","Versicolor","Virginica"))
round(prop.table(table(irisd$Species))*100,digits = 1)
summary(irisd[c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")])
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
irisd_n<-as.data.frame(lapply(irisd[1:4],normalize))
summary(irisd_n)
str(irisd_n)
irisd_train<-irisd_n[1:100,]
irisd_test<-irisd_n[101:150,]
irisd_train_labels<-irisd_n[1:100,1]
irisd_test_labels<-irisd_n[101:150,1]
library(class)
irisd_test_prepd<-knn(train = irisd_train,test = irisd_test,cl=irisd_train_labels,k=25)
library(gmodels)
CrossTable(x=irisd_test_labels,y=irisd_test_prepd,prop.chisq=FALSE)
aa<-table(irisd_test_labels,irisd_test_prepd)
aa
library(caret)
confusionMatrix(aa)
