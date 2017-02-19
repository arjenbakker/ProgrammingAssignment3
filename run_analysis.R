# read common data
feat<-read.table("./features.txt")
act<-read.table("./activity_labels.txt")

# start gathering and cleaning the test data:
# read test data, set correct column names, and select only 'mean' and 'std' columns
test<-read.table("./test/X_test.txt")
colnames(test)<-feat[,2]
test<-test[,grepl("mean\\(\\)|std\\(\\)", colnames(test))]

# read test subject data
test_subj<-read.table("./test/subject_test.txt", col.names="subject")

# read test activity data, set correct labels
test_act<-read.table("./test/y_test.txt", col.names="activity")
test_act$activity<-act[test_act$activity,2]

# bind subject, activity and test data together
test<-cbind(test_subj, test_act, test)

# do the same with the train data:
# read train data, set correct column names, and select only 'mean' and 'std' columns
train<-read.table("./train/X_train.txt")
colnames(train)<-feat[,2]
train<-train[,grepl("mean\\(\\)|std\\(\\)", colnames(train))]

# read train subject data
train_subj<-read.table("./train/subject_train.txt", col.names="subject")

# read train activity data, set correct labels
train_act<-read.table("./train/y_train.txt", col.names="activity")
train_act$activity<-act[train_act$activity,2]

# bind subject, activity and train data together
train<-cbind(train_subj, train_act, train)

# now merge train and test data together, and tidy column names
total<-rbind(train,test)
colnames(total)<-tolower(gsub("[^[:alpha:]]", "", colnames(total)))

# calculate means by subject and activity
aggr<-aggregate(total[,3:ncol(total)], by=list(subject=total$subject, activity=total$activity), mean)

# write result to file
write.table(aggr, file="tidy_dataset.txt", row.name=FALSE)
