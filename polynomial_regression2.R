# Polynomial Regression on Boston Dataset

library(MASS)
library(ggplot2)
data <- as.data.frame(Boston)

data$age2 <- data$age^2
data$age3 <- data$age^3
data$age4 <- data$age^4
data$age5 <- data$age^5

poly_reg <- lm(medv ~ age + age2 + age3 + age4 + age5, data = data)
summary(poly_reg)
ggplot(data, aes(x = age, y = medv)) +
  geom_point(color = 'red') +
  geom_line(aes(y = predict(poly_reg, newdata = data)), color = 'blue') +
  ggtitle('Polynomial Regression on Boston Dataset') +
  xlab('Age') +
  ylab('Median Value (medv)')
new_age <- data.frame(age = 9.5, age2 = 9.5^2, age3 = 9.5^3, age4 = 9.5^4, age5 = 9.5^5)
predicted_medv <- predict(poly_reg, newdata = new_age)
print(predicted_medv)

