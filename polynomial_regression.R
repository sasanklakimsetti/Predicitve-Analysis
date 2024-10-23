# polynomial regression
data<-read.csv("C://lpu//5th sem//INT234//Datasets//Position_Salaries.csv")
data<-data[2:3]
data
# fitting linear regression model to dataset
lin_reg<-lm(formula = Salary ~ . ,
            data=data)
summary(lin_reg)$r.squared

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
  geom_line(aes(x = data$Level, y = predict(poly_reg, newdata = data)),
            colour = 'blue') +
  ggtitle(' (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')
# Predicting a new result with Polynomial Regression
predict(poly_reg, data.frame(Level = 6.5,
                             Level2 = 6.5^2,
                             Level3 = 6.5^3,
                             Level4=6.5^4,
                             Level5=6.5^5))
