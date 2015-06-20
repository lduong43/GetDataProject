# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Set up directory on local drive
setwd("~/Technical/R/John Hopkins School of Public Health/GetData/Project/UCI\ HAR\ Dataset")

#"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
list.files()

#1a - Import datasets from working directory
train<-read.table("train/X_train.txt",header=F)
train.labels<-read.table("train/y_train.txt",header=FALSE)
train.subjects<-read.table("train/subject_train.txt",header=FALSE)
#table(train.subjects)
#head(train)
test<-read.table("test/X_test.txt")
test.labels<-read.table("test/y_test.txt")
test.subjects<-read.table("test/subject_test.txt",header=FALSE)

#head(test)


#1b - Merge datasets

combined<-rbind(train, test)
names(combined)
str(combined)

#2a - Get list of features
features<-read.table("features.txt")
head(features)
features.of.interest<-features[grepl("mean()",features[,2],fixed=T)|grepl("std()",features[,2],fixed=T),]

# 2b - Extracts only the measurements on the mean and standard deviation for each measurement. 
combined<-combined[,features.of.interest[,1]]
names(combined)<-features.of.interest[,2]

# 3 - Uses descriptive activity names to name the activities in the data set

activity_labels<-read.table("activity_labels.txt")
#str(activity_labels)
#head(activity_labels)
#dim(activity_labels)

train.labels.desc<-merge(activity_labels, train.labels, by.x="V1", by.y="V1" , all=TRUE)
test.labels.desc<-merge(activity_labels, test.labels, by.x="V1", by.y="V1" , all=TRUE)

Activity <- rbind(train.labels.desc,test.labels.desc)[,2]

Subject <-rbind(train.subjects,test.subjects)
names(Subject)<-"Subject"

combined2<- cbind(Subject,Activity,combined)
str(combined2)
#head(combined2,n=1)
#tail(combined2,n=1)

# 5) From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

#install.packages("reshape2")
library(reshape2)
features.to.average<-as.character(features.of.interest$V2)

melted.data<-melt(combined2,id=c("Subject", "Activity"))
tidy.data<-dcast(melted.data,Subject + Activity ~ variable,mean)
write.table(tidy.data, file="tidy_data.txt",row.name=FALSE)
        