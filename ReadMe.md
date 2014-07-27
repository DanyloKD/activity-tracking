#ReadMe

These repository contains solution for the cource project from Getting and Cleaning Data course. 

Required dataset for these course is here:
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Script
R script called run_analysis.R that does the following. 

* getDataDirectory - returns name of the directory where data is stored

* readActivityLabels - reads activity labels from "activity_labels.txt" stored in data directory. Returns data.frame with activities

* readFetauresLabels - reads data measurements names from features.txt. Normalizes names to convenient form.
    -  replaces "(", ")" and "-" symbols with underscore ("_") symbol
    -  replaces multiple underscores in row with only one
    -  removes underscore symbol at the end of line
    -  replaces "fbodyBody" with "fBody"
    -  inserts underscore between letter and capital letters
    -  makes letter all capital letters after underscore
    
* readDataSet - reads measurements dataset.
    -  _dataSetType_ can be "train" or "test"
    -  _activitiesLabels_ - activities returned by readActivityLabels
    -  _featuresLabels_ - measurements names returned by readFetauresLabels
  
    Returns properly labelled measurements data with subject ID, and activity type set
* getMergedDataSets - returns train and test datasets merged together
    -  _activitiesLabels_ - activities returned by readActivityLabels
    -  _featuresLabels_ - measurements names returned by readFetauresLabels

* getFirstDataSet - returns first dataset required by task.
    -  _mergedDataSet_ - dataset returned by getMergedDataSets

    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

* getSecondDataSet - returns second dataset required by task: 
    -  _mergedDataSet_ - dataset returned by getMergedDataSets
    -  _featuresLabels_ - measurements names returned by readFetauresLabels
    
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Files
Cource project contains three files:
*  ReadMe.md - these file
*  CodeBook.md - code book for second tidy data set
*  run_analysis.R - script for generating data
