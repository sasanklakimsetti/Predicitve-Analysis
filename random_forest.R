# loading the necessary packages
library(randomForest)

# load the dataset
data("iris")
set.seed(42)
sample_index<-sample(1:nrow(iris),0.7*nrow(iris))
train_data<-iris[sample_index,]
test_data<-iris[-sample_index,]

# train the model 
rf_model<-randomForest(Species ~ ., data = train_data, ntree=10, mtry=2)

# model summary
rf_model

# predict the test set
predictions<-predict(rf_model,test_data)

# confusion matrix to evaluate the model
confusion_matrix<-table(predictions, test_data$Species)
confusion_matrix
print(sum(diag(confusion_matrix))/sum(confusion_matrix)*100)