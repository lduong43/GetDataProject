# GetDataProject

# How the run_analysis.R code works

run_anlysis.R is an R script which creates a tidy dataset containing the average mean and standard deviation measures for all 30 subjects for from data collected from the accelerometers from the Samsung Galaxy S smartphone.

1) Sets up a directory for the analysis on the local drive
2) Imports the relevant datasets into R from the saved as txt files on the local drive
3) Merges the training and test datasets to form a file containing all subjects
4) Creates a vector containing on the vairables which are means and standard deviations and selects only these relevant columns
5) Uses the activity labels dataset to label the activities
6) Restructures the file to contain a seperate line for each subject and activity, and takes the mean measurement of this


# tidy_data.txt codebook

The tidy_data.txt file contains the average mean and standard deviation measures for all 30 subjects for from data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the original data can be found @ http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

There are 40 rows and 68 columns.

## Rows
Each row represents a subect's activity and associated average mean and standard deviation measures.

## Columns

Subject - A number from 1 to 30 representing an individual subject in the experiment
Activity - The activity the subject was performing when the accelermoter reading was made

All other columns - feature measurements from the accelerometer following the following naming conventions:

mean or std denotes original measurement was either a mean or standard deviation

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag