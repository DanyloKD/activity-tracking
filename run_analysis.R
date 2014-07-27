#R script called run_analysis.R that does the following. 

# returns name of the directory where data is stored
getDataDirectory <- function(){
  "UCI HAR Dataset"  
}

# reads activity labels
readActivityLabels <- function(){
  activityLabelsFilePath <- paste0(getDataDirectory(), "\\", "activity_labels.txt")
  read.table(activityLabelsFilePath, row.names = 1, col.names= c("id", "activity"))
}

# reads features (measurements)
readFetauresLabels <- function(){
  featuresFilePath <- paste0(getDataDirectory(), "\\", "features.txt")
  features <- read.table(featuresFilePath, row.names = 1, col.names = c("id", "feature"))
  
  labels <- features$feature
  
  labels <- gsub("\\(|\\)|-|,", replacement = "_", labels)
  labels <- gsub("_+", replacement = "_", labels)
  labels <- gsub("_$", replacement = "" , labels)
  
  labels <- gsub("([a-z])([A-Z])", replacement = "\\1_\\2", labels)
  
  labels <- gsub("fBodyBody", replacement = "fBody", labels)
  labels <- gsub("_([A-Z])", replacement = "_\\L\\1", perl = TRUE, labels)
  
  labels
}

#reads dataset 
readDataSet <- function(dataSetType, activitiesLabels, featuresLabels){
  
  dataDirectory <- paste0(getDataDirectory(), "\\", dataSetType)
  
  if ( ! file.exists(dataDirectory) ){
    print("directory does not exists")  
  }
  
  #paths to files with data 
  subjectTestFilePath <- paste0(dataDirectory, "\\", "subject_", dataSetType, ".txt")
  dataXFilePath <- paste0(dataDirectory, "\\", "X_", dataSetType, ".txt")
  dataYFilePath <- paste0(dataDirectory, "\\", "y_", dataSetType, ".txt")
  
  #read data
  subjectTestTable <- read.table(subjectTestFilePath, col.names = c("subjectId"))
  dataXTable <- read.table(dataXFilePath, col.names = featuresLabels)
  dataYTable <- read.table(dataYFilePath, col.names = c("activityId"))
  
  #descriptive names for activities  
  activityNames <- sapply(dataYTable$activityId, function(x){as.character(activitiesLabels[x, "activity"])})  
  
  #first two columns in result dataset are subjectId, and activity name 
  dataSet <- data.frame(
    subject = subjectTestTable$subjectId,
    activity = activityNames    
  )
  
  #add measurements
  dataSet <- cbind(dataSet, dataXTable) 
}

#Merges the training and the test sets to create one data set.
getMergedDataSets <- function(activityLabels, featuresLabels){
  
  #read train dataset 
  train <- readDataSet("train", activitiesLabels, featuresLabels)
  
  #read test dataset
  test <- readDataSet("test", activitiesLabels, featuresLabels)

  #commbine two datasets together
  dataSet <- rbind(test, train)  

  dataSet
}

#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
getFirstDataSet <- function(mergedDataSet){
  columnsFilter <- c(
    "^subject$", 
    "^activity$", 
    "mean([A-Z]|_|$)", 
    "std([A-Z]|_|$)"
  )
  
  selectedColumns <- c()
  columnNames <- names(mergedDataSet)
  for(filter in columnsFilter){
    columns <- grep(filter, columnNames)
    selectedColumns <- c(selectedColumns, columns)    
  }
  
  selectedColumns <- sort(selectedColumns)
  
  selectedColumnsNames <- columnNames[selectedColumns]
  dataSet1 <- mergedDataSet[, selectedColumnsNames]
}

# Creates a second, independent tidy data set 
# with the average of each variable 
# for each activity and each subject.
getSecondDataSet <- function(mergedDataSet, featuresLabels){
  dataSet <- aggregate(
    mergedDataSet[,featuresLabels],
    by = list(
      activity = as.character(mergedDataSet[["activity"]]),
      subject = mergedDataSet[["subject"]]
    ),
    FUN = function(x){
      if (is.numeric(x)){
        mean(x)
      }
      else {
        print(x)
        NA #
      } 
    }        
  )
}

#read activities names
activitiesLabels <- readActivityLabels()

#read measurements names
featuresLabels <- readFetauresLabels();

mergedData <- getMergedDataSets(activityLabels, featuresLabels)
d1 <- getFirstDataSet(mergedData)
d2 <- getSecondDataSet(mergedData, featuresLabels)

write.table(d2, file = "data2.txt")