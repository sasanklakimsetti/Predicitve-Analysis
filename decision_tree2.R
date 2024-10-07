# decision tree on intrusion detection

library(rpart)
library(rpart.plot)

data<-read.csv("C://lpu//5th sem//INT234//Datasets//intrusion_detection_data.csv")
str(data)

nrow(data)
ncol(data)


set.seed(1234)
indexes<-sample(1:nrow(data),0.70*nrow(data))
data_train<-data[indexes,]
data_test<-data[-indexes,]

target<- class ~ src_bytes +	dst_bytes +	land +	wrong_fragment +	urgent +	hot +	num_failed_logins +	logged_in +	num_compromised +	root_shell +	su_attempted +	num_root +	num_file_creations +	num_shells +	num_access_files +	num_outbound_cmds +	is_host_login +	is_guest_login +	count +	srv_count +	serror_rate +	srv_serror_rate +	rerror_rate +	srv_rerror_rate +	same_srv_rate +	diff_srv_rate +	srv_diff_host_rate +	dst_host_count +	dst_host_srv_count +	dst_host_same_srv_rate +	dst_host_diff_srv_rate +	dst_host_same_src_port_rate +	dst_host_srv_diff_host_rate +	dst_host_serror_rate +	dst_host_srv_serror_rate +	dst_host_rerror_rate +	dst_host_srv_rerror_rate

tree<-rpart(target, data=data_train, method = "class")
rpart.plot(tree)
predictions<-predict(tree,data_test,type="class")

confusion_matrix<-table(data_test$class,predictions)
print(confusion_matrix)
accuracy<-sum(diag(confusion_matrix))/sum(confusion_matrix)
print(paste("Accuracy: ",round(accuracy*100,4)))

