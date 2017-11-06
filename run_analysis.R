# set working direc.

setwd("D:/R/Coursera/Getting and cleaning data/week4/UCI HAR Dataset")

# read the data
features <- read.table('./features.txt',header = F)
activity <- read.table('./activity_labels.txt',header = F)

# read training data
training_subjects  <- read.table('./train/subject_train.txt',header=F)
xtrain             <- read.table('./train/x_train.txt',header=F)
ytrain             <- read.table('./train/y_train.txt',header=F)

#Assign names to  data
colnames(activity)         <- c('activityId','activityType')
colnames(training_subjects) <- 'subjectId'
colnames(xtrain)           <- features[,2]
colnames(ytrain)          <- 'activityId'

#merge training data
merged_training_data      <- cbind(ytrain,training_subjects,xtrain)
#read the test data
subjecttest               <- read.table('./test/subject_test.txt',header=F)
xtest                      <- read.table('./test/X_test.txt',header=F)
ytest                      <- read.table('./test/y_test.txt',header=F)

#assign the names to test column
colnames(subjecttest)       <- 'subjectId'
colnames(xtest)             <- features[,2]
colnames(ytest)             <- 'activityId'
merged_test_data            <- cbind(ytest,subjecttest,xtest)

#####################################################
#1 merge the test and training data
####################################################
 merged_data                <- rbind(merged_training_data,merged_test_data)

#############################
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
#############################

#get the vector for extracting(no.2)
colNames                 <- colnames(merged_data) 
desired_columns          <- grepl('activityId|subjectId|mean|sd',colNames)
desired_data             <- merged_data[,desired_columns]

##############
#3 Use descriptive activity names to name the activities in the data set
##############
desired_data$activityId          <- factor(desired_data$activityId, 
levels=activity[,1],labels =activity[,2])

#######################
#4 Appropriately label the data set with descriptive variable names
#######################
columnames    <- colnames(desired_data)

columnames <- gsub('\\()','',columnames)
columnames <- gsub('mean','Mean',columnames)
columnames <- gsub('std$','sd',columnames)
columnames <- gsub('^t','time',columnames)
columnames <- gsub('Acc','Accelerometer',columnames)
columnames <- gsub('[Gg]ravity','Gravity',columnames)
columnames <- gsub('[Gg]yro','Gyro',columnames)
columnames <- gsub('AccMag','AccMagnitude',columnames)
columnames <- gsub('[Bb]odyaccjerkmag)','BodyAccJerkMagnitude',columnames)
columnames <- gsub('JerkMag','JerkMagnitude',columnames)

colnames(desired_data) <- columnames

##################
# 5 Create a second, independent tidy set with the average of each
# variable for each activity and each subject
#################
library(dplyr)
desired_data_means  <- desired_data%>%
  group_by(subjectId,activityId)%>%
  summarise_each(funs(mean))

# writing the output data
write.table(desired_data_means,'tidy_data.txt',row.names = T)

