# Unit 4
# Aritficial Neural Networks (ANN): part of supervised learning
# models the relationship between a set of input signals and output signals
# in neural networks, input and output are only accepted

concrete<-read.csv("C://lpu//5th sem//INT234//Datasets//Concrete_Data.csv")
concrete
# strength is dependent on all the other variables
# neural networks work best when the input data are scaled and to a narrow range around zero, and here, we see values ranging anywhere from zero up to over a thousand. so normalize the data
hist(concrete$strength)
normalize<-function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
concrete_norm<-as.data.frame(lapply(concrete, normalize))
summary(concrete_norm$strength)
# now all the values are in the range of zero to one
concrete_train<-concrete_norm[1:773,]
concrete_test<-concrete_norm[774:1030,]
library("neuralnet")
concrete_model<-neuralnet(strength ~ cement + slag + ash + water+
                            superplasticizer + coarseagg +	fineagg +
                            age , data=concrete_train)
# training the simplest multilayer feedforward network with only a single hidden node
plot(concrete_model)
# In this simple model, there is one input node for each of the eight features, and a single output node that predicts the concrete strength. Lower errors means 

model_results=compute(concrete_model,concrete_test[1:8])
# it returns a list with two components: neurons, which stores the neurons for each layer in the network, and net.result, which stores the predicted values
predicted_strength<-model_results$net.result
cor(predicted_strength,concrete_test$strength)
# correlations close to 1 indicate strong linear relationships between two variables 
concrete_model2<-neuralnet(strength ~ cement + slag + ash + water+
                             superplasticizer + coarseagg +	fineagg +
                             age , data=concrete_train, hidden = 5)
plot(concrete_model2)
model_results2=compute(concrete_model2,concrete_test[1:8])
predicted_strength2<-model_results2$net.result
cor(predicted_strength2,concrete_test$strength)
