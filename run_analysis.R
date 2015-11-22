# The dataset to be cleansed can be downloaded by means of the following ZIP file:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Copy the ZIP file to your (present) working directory and UNZIP from there.

# Subsequent setwd statements will navigate to the appropriate directories 
# from where training set data, respectively test set data will be collected 
# (via read.table):

setwd("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
setwd("./train")
subject_train<-read.table("subject_train.txt")
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")

setwd("../")
setwd("./test")
subject_test<-read.table("subject_test.txt")
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
# reset to (original) working directory for clarity
setwd("../")
setwd("../")
setwd("../")


# The varaible names are collected from the features-vector which was previously
# collected from the features.txt file 
names(X_train)<-features[,2]
names(X_test)<-features[,2]

# Train and Test sets are combined with the subjects 
# (ID's of the persons carrying out an experiment) 
# and the specific activity code of this experiment.
# Subsequently appropriate variable names are given.
SubjectTrain<-cbind(subject_train,y_train, X_train)
SubjectTest<-cbind(subject_test,y_test, X_test)

namesTrainAndTest<-names(SubjectTrain)
namesTrainAndTest[1]<-"Subject"
namesTrainAndTest[2]<-"Activity"

names(SubjectTrain)<-namesTrainAndTest
names(SubjectTest)<-namesTrainAndTest
TotalSet<-rbind(SubjectTrain,SubjectTest)


# Since the activities thusfar are only coded using numbers from 1 to 6 the descriptions
# are collected into the data via an inner_join statement in the dplyr packages.
# Note: install dplyr packages if you have not already done so.
library(dplyr)
TotalSet<-inner_join(activity_labels, TotalSet, by=c("V1"="Activity"), copy=TRUE)
names(TotalSet)[1]<-"ActivityCode"
names(TotalSet)[2]<-"ActivityName"


# From the total data set (TotalSet) the varaible names containing the string "mean" are detected
featuresMean<-grep("mean", names(TotalSet), ignore.case=TRUE)
# From the total data set (TotalSet) the variable names containing the string "std" are detected
featuresSTD<-grep("std", names(TotalSet), ignore.case=TRUE)
# latter two sets are combined to one vector, and subsequently the first 3 varaiables are also added
featuresCombined<-append(featuresMean, featuresSTD)
featuresCombined123<-append(c(1,2,3), featuresCombined)
featuresCombined123<-sort(featuresCombined123)

# Subset TotalSet accordingly 
TotalSet<-TotalSet[,featuresCombined123]


# Determine mean of all measurements per subject per activity
# and write results in text file TotalSet_aggregate.txt
TotalSet_aggregate<-TotalSet %>% group_by(ActivityCode, ActivityName, Subject) %>% summarise_each(funs(mean))
write.table(TotalSet_aggregate, file="TotalSet_aggregate.txt", row.name = FALSE)
