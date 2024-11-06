# kmeans clustering on sns data

library(dplyr)

data<-read.csv("C://lpu//5th sem//INT234//Datasets//snsdata.csv")
str(data)
ncol(data)
colSums(is.na(data))
summary(data)

data <- data %>%
  mutate(age = ifelse(is.na(age), mean(age, na.rm = TRUE), age))

data$gender <- ifelse(data$gender == "M", 0, ifelse(data$gender == "F", 1, NA))
mode_gender <- as.numeric(names(sort(table(data$gender), decreasing = TRUE)[1]))
data$gender[is.na(data$gender)] <- mode_gender
