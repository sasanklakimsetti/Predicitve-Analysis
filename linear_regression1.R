# linear regression: one independent and one dependent variables
# applying linear regression model on iris dataset
data(iris)
head(iris)
# training the linear regression model using lm() function
model<-lm(Sepal.Length~Petal.Length, data = iris)
summary(model)
# plotting the regression chart
plot(iris$Petal.Length,iris$Sepal.Length, main = "Linear Regression on iris data",xlab="Petal Length",ylab="Sepal Length",pch=19,col="blue")
# adding the regression line to the previous chart
abline(model,col="red")