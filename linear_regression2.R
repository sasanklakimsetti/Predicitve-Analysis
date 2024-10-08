# height predictor vector
x<-c(5.1,5.5,5.8,6.1,6.4,6.7,6.4,6.1,5.10,5.7)
# weight response vector
y<-c(63,66,69,72,75,78,75,72,69,66)
# linear regression model
relation<-lm(y~x)
summary(relation)

# find weight of the person with given height
a<-data.frame(x=6.3)
a
result<-predict(relation,a)
result
