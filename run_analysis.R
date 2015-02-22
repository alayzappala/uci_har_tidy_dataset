#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



#For the TEST measures:

#get the measures
x_test<-data.frame(read.table("./GettingAndCleaning/UCI HAR Dataset/test/X_test.txt") )

#get the names of the columns
features_names<-data.frame(read.table("./GettingAndCleaning/UCI HAR Dataset/features.txt"))

#add the names of the columns
names(x_test)<-c(as.character(features_names$V2))

#subset the mean and the standard deviation for each test measurement
x_test_subsetMean<-data.frame(x_test[,1:6],x_test[,41:46],x_test[,81:86],x_test[,121:126],x_test[,161:166],x_test[,201:202],x_test[,214:215],x_test[,227:228],x_test[,240:241],x_test[,253:254],x_test[,266:271],x_test[,294:296],x_test[,345:350],x_test[,376:375],x_test[,424:429],x_test[,452:454],x_test[,503:504],x_test[,516:517],x_test[,529:530],x_test[,542:543,552],x_test[,555:561])

#add the row with the identifier of the subject who carried the experiment
subject_test<-data.frame(read.table("./GettingAndCleaning/UCI HAR Dataset/test/subject_test.txt"))
names(subject_test)<-c("id_subject")

#get the activity labels
activity_labels_test<-data.frame(read.table("./GettingAndCleaning/UCI HAR Dataset/test/y_test.txt"))
names(activity_labels_test)<-c("activity")

#change the numeric values to readable string values for the activity value column
activity_labels_test = ifelse(activity_labels_test$activity == 1, "WALKING", ifelse(activity_labels_test$activity == 2, "WALKING_UPSTAIRS", ifelse(activity_labels_test$activity == 3, "WALKING_DOWNSTAIRS", ifelse(activity_labels_test$activity == 4, "SITTING", ifelse(activity_labels_test$activity == 5, "STANDING", "LAYING")))))
activity_labels_train<-factor(activity_labels_train)

#compose the final test data frame
test_measures<-data.frame(id_subject=subject_test, activity=activity_labels_test, x_test_subsetMean)



##For the TRAIN measures:

#get the measures
x_train<-data.frame(read.table("./GettingAndCleaning/UCI HAR Dataset/train/X_train.txt"))


#add the names of the columns
names(x_train)<-c(as.character(features_names$V2))

#subset the mean and the standard deviation for each test measurement
x_train_subsetMean<-data.frame(x_train[,1:6],x_train[,41:46],x_train[,81:86],x_train[,121:126],x_train[,161:166],x_train[,201:202],x_train[,214:215],x_train[,227:228],x_train[,240:241],x_train[,253:254],x_train[,266:271],x_train[,294:296],x_train[,345:350],x_train[,376:375],x_train[,424:429],x_train[,452:454],x_train[,503:504],x_train[,516:517],x_train[,529:530],x_train[,542:543,552],x_train[,555:561])

#add the column with the identifier of the subject who carried the experiment
subject_train<-data.frame(read.table("./GettingAndCleaning/UCI HAR Dataset/train/subject_train.txt"))
names(subject_train)<-c("id_subject")

#get the activity label
activity_labels_train<-data.frame(read.table("./GettingAndCleaning/UCI HAR Dataset/train/y_train.txt"))
names(activity_labels_train)<-c("activity")

#change the numeric values to readable string values for the activity value column
activity_labels_train = ifelse(activity_labels_train$activity == 1, "WALKING", ifelse(activity_labels_train$activity == 2, "WALKING_UPSTAIRS", ifelse(activity_labels_train$activity == 3, "WALKING_DOWNSTAIRS", ifelse(activity_labels_train$activity == 4, "SITTING", ifelse(activity_labels_train$activity == 5, "STANDING", "LAYING")))))

activity_labels_train<-factor(activity_labels_train)

#compose the final train data frame
train_measures<-data.frame(id_subject=subject_train, activity=activity_labels_train, x_train_subsetMean )

#merge the train and the test measures in a data frame
mergedData<-merge(test_measures, train_measures,all = TRUE)

#order the data by id_subject and activity
mergedData<-mergedData[order(mergedData$id_subject, mergedData$activity),]

mergedData
