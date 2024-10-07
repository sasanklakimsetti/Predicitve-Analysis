# decision trees

# step-1: load the necessary packages
library(rpart)
library(rpart.plot)

# step-2: load the iris dataset
data(iris)
str(iris)

# step-3: split the data into training and testing sets
set.seed(42)  # setting seed for reproducibility
indexes=sample(1:nrow(iris),0.7*nrow(iris))  # randomly selecting the indexes from iris dataset for training and testing
# as we are randomising the data for training and testing, the data will be randomised everytime we run the code, so we need to use set.seed so that the same data will be used which was previously randomised
iris_train<-iris[indexes,]  # training data(70%)
View(iris_train)
iris_test<-iris[-indexes,] # testing data(30%)

# step-4: define the target formula and train the decision tree
target<-Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width  # we are saying that the target/ feature to be classified is Species by comupting the columns given after '~' sign
# tree=rpart(target, data=iris_train, method="class, control=rpart.control(minsplit=4))
tree<-rpart(target, data=iris_train, method="class") #class defines that the tree should be made for classification, not for regression

# step-5: visualize the decision tree
rpart.plot(tree)

# step-6: make predictions on the test set
predictions<-predict(tree,iris_test,type="class")

# step-7: evaluate the model performance by creating a confusion matrix
confusion_matrix<-table(iris_test$Species,predictions)
print(confusion_matrix)

# step-8: calculate the accuracy of the model
accuracy=sum(diag(confusion_matrix))/sum(confusion_matrix)  # the formula used is present in 'caret' library. this calculates the sum of diagonal values present in the confusion matrix divided by sum of all values present in confusion matrix
print(paste("Accuracy: ",round(accuracy*100,4)))
