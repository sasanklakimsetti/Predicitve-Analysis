# linear regression on boston
library(MASS)
data<-as.data.frame(Boston)
str(data)
model<-lm(medv~age, data = data)
summary(model)
plot(data$age,data$medv, main = "Linear Regression on Boston data",xlab="Age",ylab="Medv",pch=19,col="blue")
abline(model,col="red")