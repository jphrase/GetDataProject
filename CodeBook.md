Description of "UCI_HAR_mean_summary.txt"

The original experiment is described here:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

And the original data set can be downloaded here:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data set is explained in the readme.txt file contained in the download.
The original data was split into train and test subsets, each with 561 values recorded.
The subject and activity corresponding to each record are originally contained in separate files.

The R script run_analysis.R recombines the variable results with the corresponding subject and activity for each record.
Of the 561 variables, only those with names containing "mean" or "std" (ignoring case) are retained
in the new data set.
The original data set used the numbers 1-6 as a code for the type of activity. These numbers were replaced 
with the descriptive names found in the file activity_labels.txt contained in the download.

The final data set contains the average of each variable for each activity and each subject. I.e. if subject 1 performed 
activity "WALKING" multiple times these values are averaged into one value.
The first column is the activity, the second is the subject and the remaining columns are the average of each variable.
	
		
"Activity"
	description of activity, one of the following:
		"LAYING"
		"SITTING"
		"STANDING"
		"WALKING"
		"WALKING_DOWNSTAIRS"
		"WALKING_UPSTAIRS"

"Subject"
	id # of participant in the original study
		numbers 1-30

The remaining 86 columns are mean or std values summarized by mean for each participant and each activity.
The original variable names have been altered:
	trimmed of ("."," ","()","-")
	"Acc" has been expanded to Acceleration
	"mean" has been modified to "Mean"
	"std" has be modified to "Std"
	Any occurrence of "BodyBody" has been changed to "Body"
Other elements of the variable names remain as described in the original documentation ("features_info.txt")
	"tBodyAccelerationMeanX"
	"tBodyAccelerationMeanY"
	"tBodyAccelerationMeanZ"
	"tBodyAccelerationStdX"
	"tBodyAccelerationStdY"
	"tBodyAccelerationStdZ"
	"tGravityAccelerationMeanX"
	"tGravityAccelerationMeanY"
	"tGravityAccelerationMeanZ"
	"tGravityAccelerationStdX"
	"tGravityAccelerationStdY"
	"tGravityAccelerationStdZ"
	"tBodyAccelerationJerkMeanX"
	"tBodyAccelerationJerkMeanY"
	"tBodyAccelerationJerkMeanZ"
	"tBodyAccelerationJerkStdX"
	"tBodyAccelerationJerkStdY"
	"tBodyAccelerationJerkStdZ"
	"tBodyGyroMeanX"
	"tBodyGyroMeanY"
	"tBodyGyroMeanZ"
	"tBodyGyroStdX"
	"tBodyGyroStdY"
	"tBodyGyroStdZ"
	"tBodyGyroJerkMeanX"
	"tBodyGyroJerkMeanY"
	"tBodyGyroJerkMeanZ"
	"tBodyGyroJerkStdX"
	"tBodyGyroJerkStdY"
	"tBodyGyroJerkStdZ"
	"tBodyAccelerationMagMean"
	"tBodyAccelerationMagStd"
	"tGravityAccelerationMagMean"
	"tGravityAccelerationMagStd"
	"tBodyAccelerationJerkMagMean"
	"tBodyAccelerationJerkMagStd"
	"tBodyGyroMagMean"
	"tBodyGyroMagStd"
	"tBodyGyroJerkMagMean"
	"tBodyGyroJerkMagStd"
	"fBodyAccelerationMeanX"
	"fBodyAccelerationMeanY"
	"fBodyAccelerationMeanZ"
	"fBodyAccelerationStdX"
	"fBodyAccelerationStdY"
	"fBodyAccelerationStdZ"
	"fBodyAccelerationMeanFreqX"
	"fBodyAccelerationMeanFreqY"
	"fBodyAccelerationMeanFreqZ"
	"fBodyAccelerationJerkMeanX"
	"fBodyAccelerationJerkMeanY"
	"fBodyAccelerationJerkMeanZ"
	"fBodyAccelerationJerkStdX"
	"fBodyAccelerationJerkStdY"
	"fBodyAccelerationJerkStdZ"
	"fBodyAccelerationJerkMeanFreqX"
	"fBodyAccelerationJerkMeanFreqY"
	"fBodyAccelerationJerkMeanFreqZ"
	"fBodyGyroMeanX"
	"fBodyGyroMeanY"
	"fBodyGyroMeanZ"
	"fBodyGyroStdX"
	"fBodyGyroStdY"
	"fBodyGyroStdZ"
	"fBodyGyroMeanFreqX"
	"fBodyGyroMeanFreqY"
	"fBodyGyroMeanFreqZ"
	"fBodyAccelerationMagMean"
	"fBodyAccelerationMagStd"
	"fBodyAccelerationMagMeanFreq"
	"fBodyAccelerationJerkMagMean"
	"fBodyAccelerationJerkMagStd"
	"fBodyAccelerationJerkMagMeanFreq"
	"fBodyGyroMagMean"
	"fBodyGyroMagStd"
	"fBodyGyroMagMeanFreq"
	"fBodyGyroJerkMagMean"
	"fBodyGyroJerkMagStd"
	"fBodyGyroJerkMagMeanFreq"
	"angletBodyAccelerationMean,gravity"
	"angletBodyAccelerationJerkMean,gravityMean"
	"angletBodyGyroMean,gravityMean"
	"angletBodyGyroJerkMean,gravityMean"
	"angleX,gravityMean"
	"angleY,gravityMean"
	"angleZ,gravityMean"