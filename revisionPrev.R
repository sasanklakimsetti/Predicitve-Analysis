# list
l1<-list(c(1,1,1),c(1.0,2.0),c('a','b'))
l1
l1[3]
#nested list
l2<-list(c(1,1,1),c(1.0,2.0),list('a','b'))
l2
l2[[3]][1]<-NULL  #only possible if it is a element in a list inside a list. if a element in a vector inside a list, it won't work and throw an error. but we can make an entire vector as NULL which is present in a list
l2
# operators
# assignment operator
a<-1
a=1
a<<-1
b<<-1
a+b
#logical operators
a<-c(1:10)
b<-c(21:30)
# sth other than 0 will be considered as true
a&b
a|b
#miscallaneous operator
1 %in% a  #checks whether the element is present in the vector

mat1<-matrix(a,nrow=2,ncol = 6,byrow=TRUE)
mat2<-matrix(b,nrow=2,ncol=6,byrow=TRUE)
mat1
mat2
mat1%*%t(mat2)  # since the multiplication will be done only if ncol=nrow

# factors
# create a factor for blood samples
lev<-c('A+','A-','B+','B-','O-','O+')
a<-c('O+','O-','O+','O-','A+','A+','A-','B+','B-','B-','A-','AB+','AB+','AB-','AB-')
f1<-factor(a,levels = lev)
f1

# accessing data from dataset
data<-read.csv(file.choose(),stringsAsFactors = TRUE, header = FALSE)
data
View(data)
class(data$V1) #gives the class as factor since we used stringsAsFactors = true. if not it will return the actual class such as int,char,etc
data<-read.csv(file.choose(),stringsAsFactors = TRUE, header = TRUE)
data
class(data$name)  # header = true makes the headers from the data and the accessing will be done through those names whereas in the above method, we used header=false and some random headers were given
summary(data) #gives the statistics of the dataframe
table(data)
