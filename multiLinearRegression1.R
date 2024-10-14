# Multi Linear Regression: Multiple number of independent variables will be present in the data

insurance<-read.csv("C://lpu//5th sem//INT234//Datasets//insurance.csv",stringsAsFactors = FALSE)
str(insurance)
summary(insurance$charges)
hist(insurance$charges)  # generates a histogram for the given data values
table(insurance$region)  #builds a contingency table of the counts at each combination of factor level
cor(insurance[c("age","bmi","children","charges")])  # cor is used to find the correlation between the columns of x and y
pairs(insurance[c("age","bmi","children","charges")])  # a matrix of scatterplots is produced. it is used to detest patterns among three or more variables. the relationship between age and charges displays several relatively straight lines
install.packages("psych")  # pair.panels can be used with this
library(psych)
pairs.panels(insurance[c("age","bmi","children","charges")])  # an enhanced scatterplot matrix can be created with pairs.panels() functions
ins_model<-lm(charges~ age+children+bmi+sex+smoker+region,data=insurance)
# fits a linear regression model relating six independent variables to the total medical charges
# tilde ~ is used to describe the dependent variable which is present before the symbol and the variables present right to the symbol are independent
ins_predict<-predict(ins_model,data=insurance)
ins_model  # to see the estimated beta coefficients
summary(ins_model)
