# ann on boston dataset
library(MASS)
data<-Boston
data  
colnames(data)
# after analysing the data, we got to know that medv is dependent variable
hist(data$medv)
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
data_norm<-as.data.frame(lapply(data,normalize))
summary(data_norm$medv)
nrow(data_norm)
data_train<-data_norm[1:380,]
data_test<-data_norm[381:506,]
library("neuralnet")
model1<-neuralnet(medv ~ crim +zn +indus+ chas +nox+rm+age+dis+rad+tax+ptratio+black+lstat, data = data_train)
plot(model1)
model1Results=compute(model1,data_test[1:13])
predictedResult1<-model1Results$net.result
cor(predictedResult1,data_test$medv)
# for many hidden layers
boston_model2<-neuralnet(medv ~ crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+
                           black+lstat,data=data_train,hidden=c(5,3,5))
plot(boston_model2)
