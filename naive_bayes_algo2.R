# applying naive bayes algorithm on iris dataset

iris_raw<-iris
View(iris_raw)
str(iris_raw)
# not converting the species into factos as it was already in factor
# no need of data mining and data cleaning
iris_train<-iris_raw[1:75,]
iris_test<-iris_raw[76:150,]
iris_train_labels<-iris_raw[1:75,]$Species
iris_test_labels<-iris_raw[76:150,]$Species
library(e1071)
iris_classifier<-naiveBayes(iris_train,iris_train_labels)
iris_test_pred<-predict(iris_classifier,iris_test)
a=table(iris_test_pred,iris_test_labels)
a
library(gmodels)
CrossTable(iris_test_pred,iris_test_labels,prop.chisq = FALSE,prop.t = FALSE,dnn = c('predicted','actual'))  # making a table which tells about how many values have been predicted correctly classified by predicted and actual
library(caret)
confusionMatrix(a)

# in this model, the accuracy will be comparitively less because the training and testing data will not be same if we train the model on half of the data and test it on another half. Here starting set of rows contains only setosa, middle set only contains versicolor and the other contains only virginica. We are testing the model on setosa and versicolor but when we are testing it, it is getting on the parameters of virginica so it eventually predict wrongly.

# for training the model on every factor present, we can randomise the data using set.seed()