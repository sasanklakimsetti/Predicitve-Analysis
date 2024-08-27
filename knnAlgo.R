# supervised learning
# classification

# lazy learning
# nearest neighbours: these classifiers are defined by their characteristic of classifying unlabeled examples by assigning them the class of similar labeled examples. these are used for Computer vision applications, including optical character recognition(OCR) and facial recognition in both still images and videos

# knn algorithm considering Breast Cancer data
getwd()
wbcd<-read.csv("wisc_bc_data.csv",stringsAsFactors = FALSE)
str(wbcd) #tells the structure of the data
wbcd<-wbcd[-1] #removing the first column from the data since the ID is not useful for the anlaysis
table(wbcd$diagnosis)  #gives the count of unique strings 
wbcd$diagnosis<-factor(wbcd$diagnosis,levels=c("B","M"),labels=c("Benign","Malignant"))
View(wbcd)
round(prop.table(table(wbcd$diagnosis))*100,digits = 1)  # prop means proportion
summary(wbcd[c("radius_mean","area_mean","smoothness_mean")])
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
wbcd_n<-as.data.frame(lapply(wbcd[2:31],normalize))
summary(wbcd_n$area_mean)
View(wbcd_n)
wbcd_train<-wbcd_n[1:469,]  #using 470 samples to train
wbcd_test<-wbcd_n[470:569,]  #using 100 samples to test
wbcd_train_labels<-wbcd[1:469,1]
wbcd_test_labels<-wbcd[470:569,1]
library(class)
wbcd_test_prepd<-knn(train = wbcd_train, test = wbcd_test,cl=wbcd_train_labels,k=21)
library(gmodels)
CrossTable(x=wbcd_test_labels,y=wbcd_test_prepd,prop.chisq=FALSE)  # this gives the details about the number of values matched and not matched while testing
aa<-table(wbcd_test_labels,wbcd_test_prepd)
library(caret)
confusionMatrix(aa)  #this tells about the accuracy of the model
