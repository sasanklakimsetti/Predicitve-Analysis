# pratice

# loading the data
data<-read.csv("C://lpu//5th sem//INT234//Datasets//Prostate_cancer.csv")
# retreiving the colnames of the data
colnames(data)
head(data)
tail(data)
View(data)
#renaming the colnames 
colnames(data)<-c("col1","col2","col3","col4","col5","col6","col7","col8","col9","col10","col11","col12","col13","col14","col15")
colnames(data)
#handling missing data
sum(is.na(data))  #checking for null values
data[is.na(data)]<-0
sum(is.na(data))
summary(data)
str(data)
dim(data)  #gives the info about no.of rows and no.of columns
names(data) #gives the colnames of the data
class(data$col10)
summary(data$col10)  #getting the statistics of a particular column
hist(data$col10)  #making a histogram of a column
boxplot(data$col10)
table(data$col2)  #creates a frequency table of categorical values.
barplot(table(data$col2))
data$col2<-factor(data$col)  # converting a variable into a factor in a column

#exploring relationships between variables
plot(data$col2,data$col3) #visualizing relationship between two variables
cor(data$col4,data$col3) #correlation between two numeric variables
table(data$col2,data$col3)
boxplot(data$col3 ~ data$col2)  # to explore how a numeric variable behaves across levels of a categorical variable.  # boxplot(data$numeric_var ~ data$categorical_var)

