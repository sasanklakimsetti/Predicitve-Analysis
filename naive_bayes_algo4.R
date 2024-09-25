# naive bayes on intrusion detection
data<-read.csv(file.choose())
data
View(data)
str(data)
# got to know that class can be a factor
data$class<-factor(data$class)
nrow(data)
ncol(data)
data_train<-data[1:16544,]
data_test<-data[16545:25192,]
data_train_labels<-data[1:16544,]$class
data_test_labels<-data[16545:25192,]$class
library(e1071)
data_classifier<-naiveBayes(data_train,data_train_labels)
data_pred<-predict(data_classifier,data_test)
a=table(data_pred,data_test_labels)
a
library(gmodels)
CrossTable(data_pred,data_test_labels,prop.chisq = FALSE,prop.t = FALSE,dnn = c('predicted','actual'))
library(caret)
confusionMatrix(a)
