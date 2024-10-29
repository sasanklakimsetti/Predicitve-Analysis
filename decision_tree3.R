# decision tree on Boston 
library(MASS)
data<-as.data.frame(Boston)
str(data)
colnames(data)
data$medv<-as.numeric(data$medv)
library(rpart)
library(rpart.plot)
set.seed(42)
indexes=sample(1:nrow(data),0.7*nrow(data))
data_train<-data[indexes,]
data_test<-data[-indexes,]
target<-medv ~ crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat
tree<-rpart(target, data=data_train, method="anova")  # use method="anova" because medv is continuous so we need to use regression instead of classification
rpart.plot(tree,box.palette="Greens")
predictions<-predict(tree,data_test,type="vector")
confusion_matrix<-table(data_test$medv,predictions)
print(confusion_matrix)
accuracy=sum(diag(confusion_matrix))/sum(confusion_matrix)
print(paste("Accuracy: ",round(accuracy*100,4)))
