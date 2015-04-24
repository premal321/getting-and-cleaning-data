# Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.


# Overview

30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements.

# Dataset Details

features.txt: Names of the 561 features.

activity_labels.txt: Names and IDs for each of the 6 activities.

X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

More information about the files is available in README.txt. More information about the features is available in features_info.txt.

This analysis was performed using only the files above, and did not use the raw signal data. Therefore, the data files in the "Inertial Signals" folders were ignored.


# Processing steps

The zip file was downloaded from the internet URL(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The file was unzipped to obtain all the the data sets.

All the required files were read and appropriate column names were added.

The training and test sets were combined into a single dataset

All feature columns were removed that did not contain the exact string "mean()" or "std()". Subject and Activity columns were included.

The Activity column was converted to a factor using labels describing the activities.

A tidy data set was created containing the mean of each feature for each subject and each activity.

The tidy data set was written to a .txt file.

