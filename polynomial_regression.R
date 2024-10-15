# polynomial regression
data<-read.csv("C://lpu//5th sem//INT234//Datasets//Position_Salaries.csv")
data<-data[2:3]
data
# fitting linear regression model to dataset
lin_reg<-lm(formula = Salary ~ . ,
            data=data)
summary(lin_reg)

# fitting polynomial regreesion to the data
data$Level2=data$Level^2
data$Level3=data$Level^3
data$Level4=data$Level^4
data$Level5=data$Level^5

poly_reg<-lm(formula = Salary ~ .,
             data=data)

library(ggplot2)
ggplot() +
  geom_point(aes(x=data$Level, y=data$Salary),color='red')+
  geom_line()