# Multi Linear regression on Boston Dataset
library(MASS)
data<-as.data.frame(Boston)
str(data)
hist(data$medv)
cor(data[c("age","crim","zn","rad","tax")])
pairs(data[c("age","crim","zn","rad","tax")]) 
install.packages("psych")
library(psych)
pairs.panels(data[c("age","crim","zn","rad","tax")])
boston_model<-lm(medv~age+crim+zn+rad+tax,data = data)
boston_predict<-predict(boston_model,data=data)
boston_predict
boston_model
summary(boston_model)