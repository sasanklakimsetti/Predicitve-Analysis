# naive bayes algorithm on diamonds dataset
data<-diamonds
View(data)
nrow(data)
ncol(data)
data_train<-data[1:45000,]
data_test<-data[45001:53940,]
data_train_labels<-data[1:45000,]$cut
data_test_labels<-data[45001:53940,]$cut
library(e1071)
data_classifier<-naiveBayes(data_train,data_train_labels)
data_pred<-predict(data_classifier,data_test)
a=table(data_pred,data_test_labels)
CrossTable(data_pred,data_test_labels,prop.chisq = FALSE,prop.t = FALSE,dnn = c('predicted','actual'))
confusionMatrix(a)
