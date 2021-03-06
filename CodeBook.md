## Description

The R script **run_analysis.R** in this repository generates tidy dataset file **tidyMeanData.txt** that is also found in this repository.
The tidy dataset mentioned above is derived from the "Human Activity Recognition Using Smartphones" Data Set, the description
of which is found in the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original HAR ("Human Activity Recognition") dataset is found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Original dataset overview (from README.txt file in the original dataset):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity measurements were captured at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Original dataset feature selection (from features_info.txt file in the original dataset):

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner 
frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Data processing and cleaning:

The data processing performed in the scope of this project is only interested in mean and standard deviation measurements from the 
experiment. Such measurement correspond to variables having names containing **-mean()** and **-std()** respectively. In addition,
all such mean and standard deviation measurement are either performed in time domain or frequency domain and as a result,
their variable names have prefix **t** or **f** respectively.

The resulted tidy dataset *tidyMeanData.txt* contains the following variables:

- subject: volunteer number
- activity: descriptive activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- *"measurement"* variables (see below) representing mean value of each **mean** and **standard deviation** original measurement variable for each subject and each activity.
The name of each such variable is constructed as follows:

  - The name of original variable is furinished prefix **mean** to denote mean value.
  - The original prefix **t** or **f** denoting *Time* or *Frequency* domain measurement respectively is converted to "Time" and "Freq" respectively. In the new variable name this 
indicator will follow the prefix **Mean** described above.
  - The rest of the of the original variable is preserved except indicators **-mean()** and **-std()** which are converted to **Mean** and **Std** respectively.
  
All these variables has no unit as the measurement were normalized.

List of *"measurement"* variables:

meanTimeBodyAccMeanX
meanTimeBodyAccMeanY
meanTimeBodyAccMeanZ
meanTimeBodyAccStdX
meanTimeBodyAccStdY
meanTimeBodyAccStdZ
meanTimeGravityAccMeanX
meanTimeGravityAccMeanY
meanTimeGravityAccMeanZ
meanTimeGravityAccStdX
meanTimeGravityAccStdY
meanTimeGravityAccStdZ
meanTimeBodyAccJerkMeanX
meanTimeBodyAccJerkMeanY
meanTimeBodyAccJerkMeanZ
meanTimeBodyAccJerkStdX
meanTimeBodyAccJerkStdY
meanTimeBodyAccJerkStdZ
meanTimeBodyGyroMeanX
meanTimeBodyGyroMeanY
meanTimeBodyGyroMeanZ
meanTimeBodyGyroStdX
meanTimeBodyGyroStdY
meanTimeBodyGyroStdZ
meanTimeBodyGyroJerkMeanX
meanTimeBodyGyroJerkMeanY
meanTimeBodyGyroJerkMeanZ
meanTimeBodyGyroJerkStdX
meanTimeBodyGyroJerkStdY
meanTimeBodyGyroJerkStdZ
meanTimeBodyAccMagMean
meanTimeBodyAccMagStd
meanTimeGravityAccMagMean
meanTimeGravityAccMagStd
meanTimeBodyAccJerkMagMean
meanTimeBodyAccJerkMagStd
meanTimeBodyGyroMagMean
meanTimeBodyGyroMagStd
meanTimeBodyGyroJerkMagMean
meanTimeBodyGyroJerkMagStd
meanFreqBodyAccMeanX
meanFreqBodyAccMeanY
meanFreqBodyAccMeanZ
meanFreqBodyAccStdX
meanFreqBodyAccStdY
meanFreqBodyAccStdZ
meanFreqBodyAccJerkMeanX
meanFreqBodyAccJerkMeanY
meanFreqBodyAccJerkMeanZ
meanFreqBodyAccJerkStdX
meanFreqBodyAccJerkStdY
meanFreqBodyAccJerkStdZ
meanFreqBodyGyroMeanX
meanFreqBodyGyroMeanY
meanFreqBodyGyroMeanZ
meanFreqBodyGyroStdX
meanFreqBodyGyroStdY
meanFreqBodyGyroStdZ
meanFreqBodyAccMagMean
meanFreqBodyAccMagStd
meanFreqBodyBodyAccJerkMagMean
meanFreqBodyBodyAccJerkMagStd
meanFreqBodyBodyGyroMagMean
meanFreqBodyBodyGyroMagStd
meanFreqBodyBodyGyroJerkMagMean
meanFreqBodyBodyGyroJerkMagStd

