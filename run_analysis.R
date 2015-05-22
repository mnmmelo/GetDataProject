library(reshape2)
library(plyr)

data.url <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# If you have an error in your system with the automatic download and unzip,
# please download and unzip the data files manualy.
if(!file.exists("UCIHAR.zip")) {
    download.file(data.url, "./UCIHAR.zip", method="curl")
}
if(!file.exists("./UCI HAR Dataset")) {
    unzip("./UCIHAR.zip")
}
# ------------------------------------------------------------------------

##
## 1. Merge the training and the test sets to create one data set
##
# Create merged data folders and files
setwd("./UCI HAR Dataset")
if(!dir.exists("./mergeddata")) {
    dir.create("./mergeddata")
    if(!dir.exists("./mergeddata/Inertial Signals")) {
        dir.create("./mergeddata/Inertial Signals")
        # For each file in train folder and it's subfolder
        for(file in list.files("train", recursive=TRUE, pattern=".txt")) {
            # The origin path of the file
            origin.file <- paste("./train/", file, sep="")
            # Remove the "_train" sufix for the desination file name
            dest.file <- sub("_train", "", file)
            # The destination path for the
            dest.path <- paste("./mergeddata/", dest.file,  sep="")
            # The name of the file to append
            append.file <- sub("_train", "_test",
                               paste("./test/", file, sep=""))
            # Copy the train file to destination
            file.copy(origin.file, dest.path, overwrite=TRUE)
            # Append the test file content to copied file
            file.append(dest.path, append.file)
        }
    }
}

##
## 2. Extract only the measurements on the mean and standard deviation for each
## measurement.
##
if(!exists("partTwoSet")) {
    # Get mean() and std() features labels
    meanLabels <- read.table(text = grep("mean()", readLines("./features.txt"),
                                         fixed=TRUE,value=TRUE),
                             col.names=c("ID", "FeatureName"))
    stdLabels <- read.table(text = grep("std()", readLines("./features.txt"),
                                        fixed=TRUE,value=TRUE),
                            col.names=c("ID", "FeatureName"))
    meanStdLabels <- rbind(meanLabels, stdLabels)
    # Order the labels by ID
    meanStdLabels <- meanStdLabels[order(meanStdLabels$ID),]
    # Get measurement features
    meanStdMeasurements <- read.table("./mergeddata/X.txt", numerals="no.loss")
    # Subset to mean() and std() columns
    partTwoSet <- meanStdMeasurements[, meanStdLabels$ID]
}

##
## 3. Use descriptive activity names to name the activities in the data set
##
# Read features activities and activity labels (names)
featuresActivities <- read.table("./mergeddata/y.txt", col.names="ActivityID")
activityLabels <- read.table("./activity_labels.txt",
                             col.names=c("ActivityID", "Activity"))
# Bind ID column to track order of features activities
featuresActivities$ID <- 1:nrow(featuresActivities)
# Merge by ActivityID
featuresActivities <- merge(featuresActivities, activityLabels, "ActivityID")
# Get the original order of rows
featuresActivities <- featuresActivities[order(featuresActivities$ID), ]
# Subset Activity ID and name
featuresActivities<- featuresActivities[, c("ActivityID", "Activity")]
# Bind activity names to the measurements set
partThreeSet <- cbind(featuresActivities$Activity, partTwoSet)
colnames(partThreeSet)[1] <- "Activity"

##
## 4. Appropriately label the data set with descriptive variable names.
##
partFourSet <- partThreeSet
colnames(partFourSet)[1] <- "Activity"
colnames(partFourSet)[2:ncol(partFourSet)] <-
    as.character(meanStdLabels$FeatureName)

##
## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
##
# Bind Subject column to measurements set
subjects <- read.table("./mergeddata/subject.txt")
colnames(subjects) <- "Subject"
partFiveSet <- cbind(subjects, partFourSet)
# Transform the measurements set into narrow tydy format with columns
# Subject, Activity, Measurement and Value
partFiveSet <- melt(partFiveSet, id.vars=c("Subject", "Activity"),
                    variable.name="Measurement", value.name="Value")
# Average values by Subject, Activity and Measurement into Mean
partFiveSet <- ddply(partFiveSet, c("Subject", "Activity", "Measurement"),
                              summarize, Mean = mean(Value))
# Write averaged measurements dataframe to file without quotes or row names
write.table(partFiveSet, file="../AveragedMeasurements.txt",
            quote=FALSE, row.names=FALSE)

####
setwd("../")



