######################################3#################################################################
## This is the script for the course project in "Getting and Cleaning Data" course in Coursera.
## 
## What it does:
## 1) It downloads the Samsung Galaxy data into your working directory and merges the training and the test sets to create one data set.
## 2) Then it extracts the mean and standard deviation for each measurement with feature.txt.
## 3) It uses descriptive activity names(w/ activity_labels.txt) to name the activities in the data set at the column number 562.
## 4) It appropriately labels the data set with descriptive variable names with feature.txt variables.
## 5) Fianllay, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## 
## This script is written by Me, JungSoo
## (2014-07-27)
########################################################3################################################

## Step1 ################################################################################################
## It downloads the Samsung Galaxy data into your working directory and merges the training and the test sets to create one data set.

## Create data folder if it doesn't exist in your working directory.
if(!file.exists("./data")){dir.create("./data")}

# Download the dataset into the working directory.
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="./data/dataset.zip")

unzip("./data/dataset.zip") # Extracts files from the zipped file.
list.dirs()

setwd("./UCI HAR Dataset/") # Change the working directory to the folder that contains dataset
getwd()

list.files() # Check files in this directory
list.dirs() # Check sub-directories in this folder.

## Here, I checked to find out what files are in the datasets.
## I realize that the training set is train/X_train.txt and,
## the test set is test/X_test.txt.
## Read the two files.
train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")
mergeddata <- rbind(train, test)
head(mergeddata)

## Step2 ##################################################################################
## Then it extracts the mean and standard deviation for each measurement with feature.txt
feature<- read.table("features.txt") # Read variables names from the feature.txt
str(feature)
head(feature, n=100)
tail(feature)

# Regexp reference from coursera forum
# check <- grep("(M|m)ean|std", feature[,"V2"])
# check <- grep( "mean|std", feature[,"V2"])
# gsub("\\(.*\\)", "FFF", "121212(sda233)fsfdsd")
# gsub("(.*)", "FFF", "121212(sda233)fsfdsd")

check <- grep("std\\(\\)|mean\\(\\)", feature[,"V2"])
length(check)
feature[check, ]

only_mean_std <- mergeddata[, check]
str(only_mean_std)

## Step3 ##################################################################################
## It puts descriptive activity names(w/ activity_labels.txt) to name the activities in the data set at the column number 67.

activity_labels<- read.table("./activity_labels.txt")
str(activity_labels)
head(activity_labels)

train_labels <- read.table("./train/y_train.txt", as.is=T)
str(train_labels)

test_labels<- read.table("./test/y_test.txt")
str(test_labels)

one_labels <- rbind(train_labels, test_labels) # combine labels from the train and test.
str(one_labels)

tidydata_1st <- cbind(only_mean_std, one_labels)

str(tidydata_1st)
class(tidydata_1st[,67])
class(activity_labels[,2])
activity_labels[,2] <- as.character(activity_labels[,2])

for(i in 1:nrow(tidydata_1st)) {
                if(tidydata_1st[i, 67]==1) {
                                tidydata_1st[i, 67] <- activity_labels[1,2]
                } else if(tidydata_1st[i, 67]==2) {
                                tidydata_1st[i, 67] <- activity_labels[2,2]
                } else if(tidydata_1st[i, 67]==3) {
                                tidydata_1st[i, 67] <- activity_labels[3,2]
                } else if(tidydata_1st[i, 67]==4) {
                                tidydata_1st[i, 67] <- activity_labels[4,2]
                } else if(tidydata_1st[i, 67]==5) {
                                tidydata_1st[i, 67] <- activity_labels[5,2]
                } else if(tidydata_1st[i, 67]==6) {
                                tidydata_1st[i, 67] <- activity_labels[6,2]
                }
                }

# The descriptive names for activity, n=100
head(tidydata_1st[,67], n=100)

## Step4 ##################################################################################
## It appropriately labels the data set with descriptive variable names with feature.txt variables.

feature_var <- as.character(feature[,2])
v_names <- c(feature_var, "Activity_Name")
str(v_names)
colnames(tidydata_1st) <- v_names[check]
str(tidydata_1st)
colnames(tidydata_1st)[67] <- "Activity_Name"

## Step5 ##################################################################################
## Fianllay, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## In order to do that, I have to add each subject to the first data set.
## Each subject file should be loaded and merged together with tidydata_1st from step 4.

subject_train <- read.table("./train/subject_train.txt")
dim(subject_train)
str(subject_train)

subject_test <- read.table("./test/subject_test.txt")
dim(subject_test)
str(subject_test)

subject_combined <- rbind(subject_train, subject_test)
str(subject_combined)

tidydata_2st <- cbind(tidydata_1st, subject_combined)
str(tidydata_2st)
colnames(tidydata_2st)[68] <- "Subject" # Name the subject column with "Subject"

## To use arrange functions for ordering data..
library(plyr)
arranged_tidydata_2st <- arrange(tidydata_2st, Subject, Activity_Name)
head(arranged_tidydata_2st)

## To reshape the data easily..
library(reshape2)
melted <- melt(arranged_tidydata_2st, id.vars=c("Subject","Activity_Name"))
final_dataset <- dcast(melted, Subject+Activity_Name~ variable, mean)
str(final_dataset)
head(final_dataset)

## FINAL tidy data set!
write.table(final_dataset, "final_dataset(byJS).txt", row.names=FALSE)
# check2 <- read.table("final_dataset(byJS).txt", header=T)
