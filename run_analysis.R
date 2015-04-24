# Download the file from provided URL and unzip it
library(RCurl)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "data.zip")
unzip("data.zip")

# Read all the required files
train = read.table("./UCI HAR Dataset/train/X_train.txt")
train_label = read.table("./UCI HAR Dataset/train/Y_train.txt")
train_sub = read.table("./UCI HAR Dataset/train/subject_train.txt")

test = read.table("./UCI HAR Dataset/test/X_test.txt")
test_label = read.table("./UCI HAR Dataset/test/Y_test.txt")
test_sub = read.table("./UCI HAR Dataset/test/subject_test.txt")

activities = read.table("./UCI HAR Dataset/activity_labels.txt")

features = read.table("./UCI HAR Dataset/features.txt")

# TASK4 - Appropriately labels the data set with descriptive variable names
# Assign appropriate column names in the datasets
colnames(test) = features$V2
colnames(train) = features$V2
colnames(test_sub) = c("Subject")
colnames(train_sub) = c("Subject")
colnames(test_label) = c("Activity")
colnames(train_label) = c("Activity")

# TASK1 - Merges the training and the test sets to create one data set
testdata = cbind(test_sub, test_label, test)
traindata = cbind(train_sub, train_label, train)
cmpldata = rbind(traindata, testdata)

# TASK2 - Extract the columns having mean and std values
meanstdcols = grepl("mean()", colnames(cmpldata)) | grepl("std()", colnames(cmpldata))

# include activity and subject columns
meanstdcols[1:2] = TRUE

# data having mean and std related columns only
meanstddata = cmpldata[,meanstdcols]

# TASK3 - Uses descriptive activity names to name the activities in the data set
meanstddata$Activity <- factor(meanstddata$Activity, levels = activities$V1, 
                               labels = activities$V2)

# TASK5 - creates a second, independent tidy data set with the average of each 
#         variable for each activity and each subject
library(reshape2)
melted <- melt(meanstddata, id=c("Subject","Activity"))
tidy <- dcast(melted, Subject+Activity ~ variable, mean)

# Write tidy data set to a file as output
write.table(tidy, "tidy.txt", row.names=FALSE)
