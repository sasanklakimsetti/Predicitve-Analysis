#Naive Bayes Algorithm
# useful for prediction of new data from the previous learnings
sms_raw<-read.csv("C://lpu//5th sem//INT234//Datasets//sms_spam.csv",stringsAsFactors = FALSE)
View(sms_raw)
#checking the datatype of every column of the data
class(sms_raw$type)
class(sms_raw$text)
# can directly use str(sms_raw)
sms_raw$type<-factor(sms_raw$type)  #changing the data into factor from chr
class(sms_raw$type) #checking whether the type has been changed or not
library(tm)
# using VCorpus to change the text column into a corpus (collection of text documents) for text mining
sms_corpus<-VCorpus(VectorSource(sms_raw$text))
View(sms_corpus)

#Cleaning the data
sms_corpus_clean<-tm_map(sms_corpus,content_transformer(tolower))  # cleaning the data in text column but by lowcasing all characters in every row of the text column for better computation to the rcompiler as the ascii values of the lowercase letters will be less compared to uppercase
sms_corpus_clean<-tm_map(sms_corpus_clean,removeNumbers)  # removing the numbers present in every row of the text column
stopwords() #checking the stopwords in the r library
sms_corpus_clean<-tm_map(sms_corpus_clean,removeWords,stopwords())  # removing the stopwords if any are present in the rows of text column
sms_corpus_clean<-tm_map(sms_corpus_clean,removePunctuation)  # removing the punctuations in the sentences so that if any punctuation was present in the text won't be considered as spam
# wordstem() is used to extract the rootwords
sms_corpus_clean<-tm_map(sms_corpus_clean,stemDocument)  # extracting the rootwords present in the sentences using stemDocument
sms_corpus_clean<-tm_map(sms_corpus_clean,stripWhitespace) # removing extra whitespaces present in the document
sms_dtm<-DocumentTermMatrix(sms_corpus_clean)  # to check the presence of particular word in the particular document
# here rows represent documents (SMS messages) and columns represent terms (words)
sms_dtm

#Training the model from the cleaned data
sms_dtm_train<-sms_dtm[1:4169,]  # for training the model from dataset
sms_dtm_test<-sms_dtm[4170:5559,]  # for testing the model after training
sms_train_labels<-sms_raw[1:4169,]$type  #labels for the training data
sms_test_labels<-sms_raw[4170:5559,]$type  #labels for the testing data
sms_freq_words<-findFreqTerms(sms_dtm_train,5)  # checking the frequency of the words which atleast got repeated 5 times to make it a spam message else not considered

# Keep only the columns (terms) that meet the frequency threshold in both the training and test sets.
sms_dtm_freq_train<-sms_dtm_train[,sms_freq_words]
sms_dtm_freq_test<-sms_dtm_test[,sms_freq_words]
# function that checks the value  of x i.e. count of a word in a document is greater than 0 or not. If greater than zero, marks it as Yes else No
convert_counts<-function(x){
  x<-ifelse(x>0,"Yes","No")
}
#applying the function on dtm matrix with train and test data
sms_train<-apply(sms_dtm_freq_train,MARGIN = 2, convert_counts)
sms_train
sms_test<-apply(sms_dtm_freq_test, MARGIN = 2, convert_counts)

library(e1071)
sms_classifier<-naiveBayes(sms_train,sms_train_labels)  # using naive bayes algorithm to train the model
sms_test_pred<-predict(sms_classifier,sms_test)  #predicting the sms whether it is spam or ham using the test dataset from the trained data
a=table(sms_test_pred,sms_test_labels)
a
library(gmodels)
CrossTable(sms_test_pred,sms_test_labels,prop.chisq = FALSE,prop.t = FALSE,dnn = c('predicted','actual'))  # making a table which tells about how many values have been predicted correctly classified by predicted and actual
library(caret)
confusionMatrix(a)