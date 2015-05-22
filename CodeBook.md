
# Getting and Cleaning Data Project Code Book

## Part 1 - train and test merged data
Please read the original README.txt of the original extracted data set.
This part of the project creates a merged data folder, mergeddata, with the same 
subfolder and files structures of the train or test folder.
The .txt file names were truncated to remove the suffixes "_train" and "_test".
The mergeddata data has the same characteristics as described in the original 
data set README.txt for the train or test sets.

## Part 2 - partTwoSet - data frame
This part of the assignment does not affect the data contained in the resulting 
columns. It subsets the columns from the original set to the ones which name
contained mean() and str() strings. The columns in this are named with the pattern
V added with the index number of the original column.
The columns have numeric values.

## Part 3 - partThreeSet - data frame
The Activity column was bound to the Part 2 set. It contains the 6 level factor 
names of the activities from the file activity_labels.txt. The remainder of the 
set from Part 2 remain unchanged.

* Activity - Factor w/ 6 levels:
    + "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"  

## Part 4 - partFourSet - data frame
The Activity column remains unchanged and the remaining columns are given the 
corresponding feature names extracted from features.txt.

* Subject - integer - 1 to 30
* Activity - Factor w/ 6 levels:
    + "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS
* The remaining columns are numeric and have the following names:

tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, 
tBodyAcc-std()-Y, tBodyAcc-std()-Z, tGravityAcc-mean()-X, tGravityAcc-mean()-Y,         tGravityAcc-mean()-Z, tGravityAcc-std()-X, tGravityAcc-std()-Y, 
tGravityAcc-std()-Z, tBodyAccJerk-mean()-X, tBodyAccJerk-mean()-Y, tBodyAccJerk-mean()-Z, 
tBodyAccJerk-std()-X,  tBodyAccJerk-std()-Y, tBodyAccJerk-std()-Z, 
tBodyGyro-mean()-X, tBodyGyro-mean()-Y, tBodyGyro-mean()-Z, tBodyGyro-std()-X,            tBodyGyro-std()-Y,            tBodyGyro-std()-Z,           tBodyGyroJerk-mean()-X,      tBodyGyroJerk-mean()-Y,       tBodyGyroJerk-mean()-Z,     tBodyGyroJerk-std()-X,       tBodyGyroJerk-std()-Y,        tBodyGyroJerk-std()-Z, tBodyAccMag-mean(),           tBodyAccMag-std(),            tGravityAccMag-mean()      , 
tGravityAccMag-std(),         tBodyAccJerkMag-mean(),       tBodyAccJerkMag-std(), tBodyGyroMag-mean(),          tBodyGyroMag-std(),           tBodyGyroJerkMag-mean()    , 
tBodyGyroJerkMag-std(),       fBodyAcc-mean()-X,            fBodyAcc-mean()-Y          , 
fBodyAcc-mean()-Z,            fBodyAcc-std()-X,             fBodyAcc-std()-Y           , 
fBodyAcc-std()-Z,             fBodyAccJerk-mean()-X,        fBodyAccJerk-mean()-Y      , 
fBodyAccJerk-mean()-Z,        fBodyAccJerk-std()-X,         fBodyAccJerk-std()-Y       , 
fBodyAccJerk-std()-Z,         fBodyGyro-mean()-X,           fBodyGyro-mean()-Y         , 
fBodyGyro-mean()-Z,           fBodyGyro-std()-X,            fBodyGyro-std()-Y          , 
fBodyGyro-std()-Z,            fBodyAccMag-mean(),           fBodyAccMag-std()          , 
fBodyBodyAccJerkMag-mean(),   fBodyBodyAccJerkMag-std(),    fBodyBodyGyroMag-mean()    , 
fBodyBodyGyroMag-std(),       fBodyBodyGyroJerkMag-mean(),  fBodyBodyGyroJerkMag-std()

## Part 5 - partFiveSet data frame and "AveragedMeasurements.txt" file
The Subject column was bound to the Part 4 set. 
The set from Part 4 is transformed into a tidy set with four columns Subject, 
Activity, Measurement and Mean. This set is then writen into the file 
AveragedMeasurements.txt.

### partFiveSet - data frame

* Subject - integer - 1 to 30
* Activity - Factor w/ 6 levels:
    + "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS
* Measurement - Factor w/ 66 levels:
    + tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, 
tBodyAcc-std()-Y, tBodyAcc-std()-Z, tGravityAcc-mean()-X, tGravityAcc-mean()-Y,         tGravityAcc-mean()-Z, tGravityAcc-std()-X, tGravityAcc-std()-Y, 
tGravityAcc-std()-Z, tBodyAccJerk-mean()-X, tBodyAccJerk-mean()-Y, tBodyAccJerk-mean()-Z, 
tBodyAccJerk-std()-X,  tBodyAccJerk-std()-Y, tBodyAccJerk-std()-Z, 
tBodyGyro-mean()-X, tBodyGyro-mean()-Y, tBodyGyro-mean()-Z, tBodyGyro-std()-X,            tBodyGyro-std()-Y,            tBodyGyro-std()-Z,           tBodyGyroJerk-mean()-X,      tBodyGyroJerk-mean()-Y,       tBodyGyroJerk-mean()-Z,     tBodyGyroJerk-std()-X,       tBodyGyroJerk-std()-Y,        tBodyGyroJerk-std()-Z, tBodyAccMag-mean(),           tBodyAccMag-std(),            tGravityAccMag-mean()      , 
tGravityAccMag-std(),         tBodyAccJerkMag-mean(),       tBodyAccJerkMag-std(), tBodyGyroMag-mean(),          tBodyGyroMag-std(),           tBodyGyroJerkMag-mean()    , 
tBodyGyroJerkMag-std(),       fBodyAcc-mean()-X,            fBodyAcc-mean()-Y          , 
fBodyAcc-mean()-Z,            fBodyAcc-std()-X,             fBodyAcc-std()-Y           , 
fBodyAcc-std()-Z,             fBodyAccJerk-mean()-X,        fBodyAccJerk-mean()-Y      , 
fBodyAccJerk-mean()-Z,        fBodyAccJerk-std()-X,         fBodyAccJerk-std()-Y       , 
fBodyAccJerk-std()-Z,         fBodyGyro-mean()-X,           fBodyGyro-mean()-Y         , 
fBodyGyro-mean()-Z,           fBodyGyro-std()-X,            fBodyGyro-std()-Y          , 
fBodyGyro-std()-Z,            fBodyAccMag-mean(),           fBodyAccMag-std()          , 
fBodyBodyAccJerkMag-mean(),   fBodyBodyAccJerkMag-std(),    fBodyBodyGyroMag-mean()    , 
fBodyBodyGyroMag-std(),       fBodyBodyGyroJerkMag-mean(),  fBodyBodyGyroJerkMag-std()

### "AveragedMeasurements.txt" file
The data in the "AveragedMeasurements.txt" is organized into 4 space separated 
columns:

* Subject - Label of the subject
* Activity - The name of the activity performed by the subject
* Measurement - The name of the feature measured
* Mean - The average for each measurements for each subject in each activity



