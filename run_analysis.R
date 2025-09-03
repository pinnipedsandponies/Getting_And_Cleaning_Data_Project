
## Getting and Cleaning Data Project
## This code processes the data from the UCI Data set (see code book and 
## readme file for further information/ source data) to create a tidy data set
## comprised of the mean and standard deviation measurements for each activity.
## requires dplyr package. Please install dplyr if needed. 

library(dplyr)

## Loading data (file folder already in WD)

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Start compiling data
## Step 1: merging training and test sets into one data set: 

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merged_data <- cbind(Subject, Y, X)

## Step 2: Extract the mean and standard deviation for each measurement

mean_std <- merged_data %>% select(subject, code, contains("mean"), contains("std"))


## Step 3: add activity names

mean_std$code <- activities[mean_std$code, 2]

## Step 4: rename variables with descriptive names

names(mean_std)[2] = "activity"
names(mean_std)<-gsub("Acc", "Accelerometer", names(mean_std))
names(mean_std)<-gsub("Gyro", "Gyroscope", names(mean_std))
names(mean_std)<-gsub("BodyBody", "Body", names(mean_std))
names(mean_std)<-gsub("Mag", "Magnitude", names(mean_std))
names(mean_std)<-gsub("^t", "Time", names(mean_std))
names(mean_std)<-gsub("^f", "Frequency", names(mean_std))
names(mean_std)<-gsub("tBody", "TimeBody", names(mean_std))
names(mean_std)<-gsub("-mean()", "Mean", names(mean_std), ignore.case = TRUE)
names(mean_std)<-gsub("-std()", "STD", names(mean_std), ignore.case = TRUE)
names(mean_std)<-gsub("-freq()", "Frequency", names(mean_std), ignore.case = TRUE)
names(mean_std)<-gsub("angle", "Angle", names(mean_std))
names(mean_std)<-gsub("gravity", "Gravity", names(mean_std))

## Step 5: Create new Tidy Data set of the data

ProjectTidyData <- mean_std %>% group_by(subject, activity) %>% summarise_all(mean)

## Create txt file from Tidy Data set 

write.table(ProjectTidyData, "ProjectTidyData.txt", row.name=FALSE)
