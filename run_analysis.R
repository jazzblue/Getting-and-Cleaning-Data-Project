# This script performs the following tasks (this list of tasks was provided by 
# "Getting and Cleaning the Data" Coursera class instructors):
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates an independent tidy data set with the average of each variable for each 
# activity and each subject.
#
# Invoking the script:
#	run_analysis(dataDir)
#	Arguments:
#		dataDir: directory of the extracted HAR data


run_analysis <- function(dataDir) {
	# This the main function that performs the tasks described above.
	# The function wrutes the tidy data into file tidyMeanData.txt.
	# Arguments:
	# 	dataDir: directory of the extracted HAR data
	# Output file:
	#	tidyMeanData.txt


	# Create combined train and test subset that consists of subject activity
	# and easurements on mean and standard deviation
	dataSubset <- createSubset(dataDir, createFeatureTable(dataDir))

	# Create dataset consisting of average of each variable for each activity 
	# and each subject
	finalData <- aggregate(.~subject+activity, dataSubset , FUN=mean)

	write.table(finalData, file="tidyMeanData.txt", row.names=FALSE)
}

createFeatureTable <- function(dataDir) {
	# Returns table with two columns: feature_num, feature_title
	# The function combines 3 tables: activity table, subject table and feature table.
	# Arguments:
	# 	dataDir: UCI HAR Dataset directory

	# Read in features
	features <- read.table(paste(dataDir, "features.txt", sep="\\"), sep = " ")

	# Filtering "mean()" and "std()" feature names
	filteredFeat <- features[grepl("mean\\(\\)|std\\(\\)", features[,2]),]

	# Removing "-" and converting letter "t" after "Time"	
	filteredFeat[,2] <- gsub("^t", "Time", filteredFeat[,2], perl=TRUE)

	# Removing "-" and converting letter "f" after "Freq"	
	filteredFeat[,2] <- gsub("^f", "Freq", filteredFeat[,2], perl=TRUE)

	# Removing "-" and converting first letter after "-" to upper case	
	filteredFeat[,2] <- gsub("-(\\w)", "\\U\\1", filteredFeat[,2], perl=TRUE)

	filteredFeat[,2] <- gsub("\\(\\)", "", filteredFeat[,2], perl=TRUE)  # Remove parenthesis

	# Add prefix "Mean"
	filteredFeat[,2] <- gsub("^", "mean", filteredFeat[,2], perl=TRUE) 

	# Prepend two new columns: "subject" and "activity"
	filteredFeat[, 1] <- filteredFeat[, 1] + 2  # Add 2 to column number since we are prepending 2 new columns
	filteredFeat<- rbind(data.frame(V1=1:2, V2=c("subject", "activity")), filteredFeat)  # Prepend columns
	colnames(filteredFeat) <- c("feature_num", "feature_title")  # Assigning titles to columns
	return(filteredFeat)
}

createSubset <- function(dataDir, featureTable) {
	# Returns subset of combined train and test data measurements.
	# The data subset consists of subject, activity and all the measurements on mean
	# and standard deviation. All other measuerements are omitted.
	# Arguments:
	# 	dataDir: UCI HAR Dataset directory.
	# 	featureTable: tidy data column names

	combData <- list()  # Initialie combined data list

	# Read train and test measurements and combine with subject activity data
	for (dataType in c("train", "test")) {
		dir <- paste("UCI HAR Dataset", dataType, sep = "\\")
		file_suffix <- paste(dataType, "txt", sep=".")

		# Reaf measurement data
		measureData <- read.table(file=paste(dir, paste("X", file_suffix, sep="_"), sep="\\"))

		# Read activity data
		actData <- read.table(file=paste(dir, paste("y", file_suffix, sep="_"), sep="\\"))

		# Read subject data
		subjData <- read.table(file=paste(dir, paste("subject", file_suffix, sep="_"), sep="\\"))

		# Pepend subject and activity data to measurement data
		combData[[dataType]] <- cbind(subjData , cbind(actData , measureData))
	}

	# Combine train and test data
	harCombined <- rbind(combData[["train"]], combData[["test"]])

	# Subset combined data based on tidy feature table
	harSubset <- data.frame(harCombined[, featureTable[order(featureTable$feature_num), "feature_num"]])

	# Name columns based on tidy feature table
	colnames(harSubset) <- featureTable[order(featureTable$feature_num), "feature_title"]

	# Replacing activity numbers with corresponding labels
	activityLookup <- read.table(paste(dataDir, "activity_labels.txt", sep="\\"))
	activityIndex <- match(harSubset$activity, activityLookup[, 1])
	harSubset$activity <- activityLookup[activityIndex, 2]

	return(harSubset)
}

