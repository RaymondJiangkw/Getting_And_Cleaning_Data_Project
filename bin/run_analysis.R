# Getting and Cleaning Data Project from @John Hopkins University
# Author: RaymondKevin
# Date: 2020-01-31

# Do Preparations and Get the Data
library(reshape2)
library(dplyr)
path = ".//src//UCI HAR Dataset/"
Features_Label <- read.table(file.path(path,"features.txt"),col.names = c("index","featureNames"))
Activity_Label <- read.table(file.path(path,"activity_labels.txt"),col.names = c("classLabels","activityName"))

# Extract only the measurements on the mean and standard deviation for each measurement.
Features_Selected <- grep("(mean|std)\\(\\)",Features_Label$featureNames)
measurements <- Features_Label[Features_Selected,]$featureNames
measurements <- gsub('[()]','',measurements)

# Load Training Datasets
train <- read.table(file.path(path,"train//X_train.txt"))[,Features_Selected]
colnames(train) <- measurements
trainActivities <- read.table(file.path(path,"train//Y_train.txt"),col.names = c("Activity"))
trainSubjects <- read.table(file.path(path,"train//subject_train.txt"),col.names = c("Subject"))
train <- cbind(trainSubjects,trainActivities,train)

# Load Test Datasets
test <- read.table(file.path(path,"test//X_test.txt"))[,Features_Selected]
colnames(test) <- measurements
testActivities <- read.table(file.path(path,"test//Y_test.txt"),col.names = c('Activity'))
testSubjects <- read.table(file.path(path,"test//subject_test.txt"),col.names = c('Subject'))
test <- cbind(testSubjects,testActivities,test)

# Merge
mergedDT = rbind(train,test)

# Create a seond data set.
colNames <- c("Subject","Activity")
tidyDT = melt(data = mergedDT,id = colNames,measure.vars = setdiff(colnames(mergedDT),colNames)) %>% dcast(Subject + Activity~variable,mean)

# Write the file
write.table(tidyDT, file.path(path,"tidyData.txt"),sep = ",",row.names = FALSE)