## This code assumes the files exist in the specified directory structure
## Use dplyr library
library(dplyr)

## Read in the test data
testX <- read.table("UCI HAR Dataset//test//X_test.txt")
## Read in test labels (Activities)
testY <- read.table("UCI HAR Dataset//test//y_test.txt")
## Read in test subjects (id of participants)
testSub <- read.table("UCI HAR Dataset//test//subject_test.txt")
## Combine the test data/labels/subjects into a dataframe
## First column will be labels (Activities)
tidyTest <- cbind(testY,testSub,testX)

## Read in the train data/labels/subjects in similar manner
trainX <- read.table("UCI HAR Dataset//train//X_train.txt")
trainY <- read.table("UCI HAR Dataset//train//y_train.txt")
trainSub <- read.table("UCI HAR Dataset//train//subject_train.txt")
## Combine train data/labels/subjects into dataframe
tidyTrain <- cbind(trainY,trainSub,trainX)

## Now we combine the test and train data into a single dataframe
tidyAll <- rbind(tidyTest,tidyTrain)

## Clean up environment a bit
rm(testX)
rm(testY)
rm(tidyTest)
rm(tidyTrain)

## Read in the variable names
tidyNames <- read.table("UCI HAR Dataset//features.txt")
## Add column names for Activity and Subject and all variables
names(tidyAll) <- c("ActivityCode","Subject",as.vector(tidyNames[,2]))

## We only want the variables with mean or std, upper or lower case
## get vector of column names containing "std"
stdName <- grep("std", names(tidyAll), ignore.case = TRUE)
## get vector of column names containing "mean"
meanName <- grep("mean", names(tidyAll), ignore.case = TRUE)
## Combine vectors
chooseCols <- c(stdName,meanName)
## sort to maintain order by variable
chooseCols <- sort(chooseCols)
## reduce the data frame by keeping only "mean" & "std" variables for subject & activity
tidyMeanStd <- tidyAll[,c(1,2,chooseCols)]

## Read in the activity labels
activityLabels <- read.table("UCI HAR Dataset//activity_labels.txt")
## Name activity labels dataframe so we can merge with data set
names(activityLabels) <- c("ActivityCode","Activity")
tidyMeanStd <- merge(tidyMeanStd, activityLabels, by = "ActivityCode", all = TRUE)

## Now we can drop the ActivityCode column and replace it with Activity which contains descriptive values
tidyMeanStd <- tidyMeanStd[,-1]
## And re-order the columns so the new Activity column is first
tidyMeanStd <- tidyMeanStd[,c(88,1:87)]

## Clean up the column names
newNames <- names(tidyMeanStd)
newNames <- gsub("\\.",newNames,replacement = "")
newNames <- gsub("\\-",newNames,replacement = "")
newNames <- gsub("\\(",newNames,replacement = "")
newNames <- gsub("\\)",newNames,replacement = "")
newNames <- gsub("BodyBody",newNames,replacement = "Body")
newNames <- gsub("Acc",newNames,replacement = "Acceleration")
newNames <- gsub("mean",newNames,replacement = "Mean", ignore.case = TRUE)
newNames <- gsub("std",newNames,replacement = "Std", ignore.case = TRUE)
names(tidyMeanStd) <- newNames

## Summarise the data set by subject & activity with mean for each variable
newTable <-
        tidyMeanStd %>% group_by(Subject, Activity) %>%
        summarise_each(funs(mean))

## Write the summary data set to file
write.table(newTable, file = "UCI_HAR_mean_summary.txt", row.names = FALSE)
