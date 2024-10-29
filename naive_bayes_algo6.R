# naive bayes on Boston dataset
library(MASS)
data<-as.data.frame(Boston)
str(data)
# all the fields are in decimal. so no need of stemming and dtm
unique(data$medv)
data$medv<-as.integer(data$medv)
data$medv<-factor(data$medv)
str(data)
set.seed(42)
indexes<-sample(1:nrow(data),0.7*nrow(data))
data_train<-data[indexes,]
data_test<-data[-indexes,]
data_train_labels<-data[indexes,]$medv
data_test_labels<-data[-indexes,]$medv
library(e1071)
boston_classifier<-naiveBayes(data_train,data_train_labels)
boston_predictor<-predict(boston_classifier,data_test)
a=table(boston_predictor,data_test_labels)
a
library(gmodels)
CrossTable(boston_predictor,data_test_labels,prop.chisq = FALSE,prop.t = FALSE,dnn = c('predicted','actual'))
library(caret)
confusionMatrix(a)
