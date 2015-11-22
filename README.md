# 03_GettingCleansingProject
Repo containing project data and files on the project "Getting and Cleansing data"  which is a constituent part of the third course in the Coursera Datascience track.

# Introduction
This note describes the reading and cleansing process in order to obtain a condensed dataset from which Human Activity Recognition Analysis can be carried out. 

# Experimental Design.
The data under consideration follow from an experiment by means of which the researchers [1] were trying to correlate Human Activity with datasets from smartphones. Latter were collected by using the embedded accelerometer and gyroscope in a Samsung Galaxy S II. More details can be found in the README file which is included in the raw data download (see section raw data). Some aspects are recapitulated here for clarity.

"...The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist...."

"...The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. ..."

The data obtained basically consisted of three main measurements:
* Triaxial total acceleration
* Triaxial acceleration due to gravity
* Triaxial angular velocity
Form the first two accelerations above the body accelaration was estimated using low pass filter techniques. Pre-processing of the obtained data led to a 561-feature vector with time and frequency domain variables (see section code book).


# Raw data
The raw data can be collected by using the following link.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It is advised to copy this zip file into your (present) working directory and UNZIP from there. From this point on two approaches can be followed:
* Run the run_analysis.R script provided in order to arrive at the tidy dataset as required (note: this file has been developped under Windows and uses "/" in the specification of directory paths; in order to avoid this the script in subsequent bullet can be used as an alternative).
* Copy all the relevant txt files directly into your present working directory and run the run_analysis_v2.R script provided in order to arrive at the tidy dataset as required.
* Relevant txt files pertaining to latter bullet are:
** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt
** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt
** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt
** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt
** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt
** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt
** ~/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt

# Tidy data
By means of the tidy dataset the average of each variable (see section codebook) for each activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  and each subject (person carrying out the activity) can be determined.
The tidy dataset follows from running the R-script run_analysis.R or run_analysis_v2.R. See section Raw data for more details.
The scripts make use of the dplyr package. Make sure this package has been installed on your local machine.

The steps in the scripts are as follows:
* Variable names are collected from the features-vector
* Train and Test sets are combined with the subjects and activities; activities are specified in codes as well as desriptions
* Variable names containing "mean" or "std" are detected and the dataset is subsetted accordingly.
* group_by - summarise enables averages on all activity , subject combinations
* Resulting dataset is written into your working directory


# Code Book
The variable names start with "t" for a time signal or a "f" for a frequency domain signal. The other basic terms used are:
* Body (instrinsic body related data)
* Gravity (in contrast to above instrinsic gravity related data)
* Acc (accelation in units of g and normalised in range [-1;1])
* Gyro (radial velocity)
* Jerk (derived signal representing "acceleration of the acceleration")
* Mag (Magnitude of the signal at hand)
* X Y Z denoting the direction (2 horizontal 1 vertical component)
As mentioned earlier from the pre-processed data only the variables using mean and standard deviations were subsetted here. This resulted in the following list of varaiables (together with the activitycode, activityname and subject)
 [1] "ActivityCode"                        
 [2] "ActivityName"                        
 [3] "Subject"                             
 [4] "tBodyAcc-mean()-X"                   
 [5] "tBodyAcc-mean()-Y"                   
 [6] "tBodyAcc-mean()-Z"                   
 [7] "tBodyAcc-std()-X"                    
 [8] "tBodyAcc-std()-Y"                    
 [9] "tBodyAcc-std()-Z"                    
[10] "tGravityAcc-mean()-X"                
[11] "tGravityAcc-mean()-Y"                
[12] "tGravityAcc-mean()-Z"                
[13] "tGravityAcc-std()-X"                 
[14] "tGravityAcc-std()-Y"                 
[15] "tGravityAcc-std()-Z"                 
[16] "tBodyAccJerk-mean()-X"               
[17] "tBodyAccJerk-mean()-Y"               
[18] "tBodyAccJerk-mean()-Z"               
[19] "tBodyAccJerk-std()-X"                
[20] "tBodyAccJerk-std()-Y"                
[21] "tBodyAccJerk-std()-Z"                
[22] "tBodyGyro-mean()-X"                  
[23] "tBodyGyro-mean()-Y"                  
[24] "tBodyGyro-mean()-Z"                  
[25] "tBodyGyro-std()-X"                   
[26] "tBodyGyro-std()-Y"                   
[27] "tBodyGyro-std()-Z"                   
[28] "tBodyGyroJerk-mean()-X"              
[29] "tBodyGyroJerk-mean()-Y"              
[30] "tBodyGyroJerk-mean()-Z"              
[31] "tBodyGyroJerk-std()-X"               
[32] "tBodyGyroJerk-std()-Y"               
[33] "tBodyGyroJerk-std()-Z"               
[34] "tBodyAccMag-mean()"                  
[35] "tBodyAccMag-std()"                   
[36] "tGravityAccMag-mean()"               
[37] "tGravityAccMag-std()"                
[38] "tBodyAccJerkMag-mean()"              
[39] "tBodyAccJerkMag-std()"               
[40] "tBodyGyroMag-mean()"                 
[41] "tBodyGyroMag-std()"                  
[42] "tBodyGyroJerkMag-mean()"             
[43] "tBodyGyroJerkMag-std()"              
[44] "fBodyAcc-mean()-X"                   
[45] "fBodyAcc-mean()-Y"                   
[46] "fBodyAcc-mean()-Z"                   
[47] "fBodyAcc-std()-X"                    
[48] "fBodyAcc-std()-Y"                    
[49] "fBodyAcc-std()-Z"                    
[50] "fBodyAcc-meanFreq()-X"               
[51] "fBodyAcc-meanFreq()-Y"               
[52] "fBodyAcc-meanFreq()-Z"               
[53] "fBodyAccJerk-mean()-X"               
[54] "fBodyAccJerk-mean()-Y"               
[55] "fBodyAccJerk-mean()-Z"               
[56] "fBodyAccJerk-std()-X"                
[57] "fBodyAccJerk-std()-Y"                
[58] "fBodyAccJerk-std()-Z"                
[59] "fBodyAccJerk-meanFreq()-X"           
[60] "fBodyAccJerk-meanFreq()-Y"           
[61] "fBodyAccJerk-meanFreq()-Z"           
[62] "fBodyGyro-mean()-X"                  
[63] "fBodyGyro-mean()-Y"                  
[64] "fBodyGyro-mean()-Z"                  
[65] "fBodyGyro-std()-X"                   
[66] "fBodyGyro-std()-Y"                   
[67] "fBodyGyro-std()-Z"                   
[68] "fBodyGyro-meanFreq()-X"              
[69] "fBodyGyro-meanFreq()-Y"              
[70] "fBodyGyro-meanFreq()-Z"              
[71] "fBodyAccMag-mean()"                  
[72] "fBodyAccMag-std()"                   
[73] "fBodyAccMag-meanFreq()"              
[74] "fBodyBodyAccJerkMag-mean()"          
[75] "fBodyBodyAccJerkMag-std()"           
[76] "fBodyBodyAccJerkMag-meanFreq()"      
[77] "fBodyBodyGyroMag-mean()"             
[78] "fBodyBodyGyroMag-std()"              
[79] "fBodyBodyGyroMag-meanFreq()"         
[80] "fBodyBodyGyroJerkMag-mean()"         
[81] "fBodyBodyGyroJerkMag-std()"          
[82] "fBodyBodyGyroJerkMag-meanFreq()"     
[83] "angle(tBodyAccMean,gravity)"         
[84] "angle(tBodyAccJerkMean),gravityMean)"
[85] "angle(tBodyGyroMean,gravityMean)"    
[86] "angle(tBodyGyroJerkMean,gravityMean)"
[87] "angle(X,gravityMean)"                
[88] "angle(Y,gravityMean)"                
[89] "angle(Z,gravityMean)" 



===============================================================
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
