# GetDataProject
Getting and Cleaning Data course project

OS: Windows 7, 32 bit
R ver: 3.2.0

The script run_analysis.R assumes the UCI HAR dataset has been downloaded and exists in an 
immediate subdirectory of the R working directory.
The script requires the dplyr package.

Reading the data into R:
Firstly the test data is read in to a data frame using read.table. The corresponding subject and activity files 
are also read into separate data frames. These data frames are then combined to a single data frame, tidyTest,
with activity and subject being the first and second columns respectively. 
The train data, subject and activity files are then similarly read and combined into a single new data frame, tidyTrain.
The 2 data frames, tidyTest and tidyTrain, are then row combined into a single data frame, tidyAll. 

Naming the data frame columns:
The variable names are read in from the file "features.txt" to a data frame, tidyNames. The variable names are
extracted from the second column of this data frame.
The columns of the main data frame, tidyAll, are named with these variable names, ActivityCode for activity and Subject for subject.

Removing unwanted columns:
Since we only want data with mean or std, the column names are searched for "mean" & "std" using the function grep()
to return a vector of indices of the columns we want to keep.
This is done separately for "mean" and "std" to create 2 vectors which are then combined and sorted to retain their order.
A new data frame, tidyMeanStd, is created by only selecting the ActivityCode, Subject and columns determined above from the 
main data frame tidyAll.

Renaming the ActivityCodes:
The labels corresponding to the ActivityCode are read in to a data frame, activityLabels, from the file "activity_labels.txt".
This is given column names "ActivityCode","Activity" to facilitate merging with the main data frame, tidyAll. 
The data frames are merged on "ActivityCode" which generates an additional column with the Activity labels we want.
The ActivityCode column is then dropped, and the data frame is re-ordered to put the Activity labels in the first column.

Cleaning up the column names:
The function grep() was used to find and replace parts of the variable (column) names.
Instances of ".", "-" or "()" are removed. 
"Acc" is expanded to "Acceleration", "mean" to "Mean" and "std" to "Std". 
Also instances of "BodyBody" are replaced with "Body".

A new data frame is created by grouping the existing data frame by subject and activity and finding the mean of each 
such combination. This data frame is then written to the file "UCI_HAR_mean_summary.txt". 
