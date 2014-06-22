## Description 

The purpose of this project is performing processing on the "Human Activity Recognition Using Smartphones" Data Set 
as well as providing means to perform such processing in a form of an R script.

The data description website is found in:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the HAR dataset:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data processing performs the following tasks (this list of tasks was provided by 
"Getting and Cleaning the Data" Coursera class instructors):

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates an independent tidy data set with the average of each variable for each activity and each subject.

The repository contains R script run_analysis.R that performs the mentioned above tasks.

## How to run

### R commands:
source("run_analysis.R)
run_analysis(dataDir)
    
### Arguments:
dataDir: directory path of the extracted HAR dataset

### Output file:
tidyMeanData.txt

