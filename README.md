---
title: "Getting and Cleaning Data - Project"
output:
  html_document:
    highlight: zenburn
    theme: spacelab
    toc: yes
---

## Introduction
To work with in this project we are given a dataset split into several folders
and made up of several .txt files.
The data has been split into training and test sets, stored in mirrored folder
structures, train and test. The train and test folders contain a Inertial 
Signals sub-folder. Files from the train and test sets have the "_train" and 
"_test" suffixes respectively. The files "activity_labels.txt" and 
"features.txt" in the  root folder are common to both train and test sets.

## Original dataset description
The folder structure of the dataset and data files used in this project are the following:

* UCI HAR Dataset - root folder
    + activity_labels.txt - values for the ID and Name of activities performed 
    by each subject.
    + features.txt - 561-feature vector list of frequency domain variables
    * train - train folder
        + subject_train.txt - the subjects performing the activities - 1 column, 
        range 1-30
        + X_train.txt - the training set of measured or calculated values - 561 
        columns
        + y_train.txt - the activities ID corresponding to the training set. 
        In the same order as X_train.txt.
        * Inertial Signals - Signals obtained from the smartphone accelerometer 
        and gyroscope. Used only in Part 1 of the Project: Merge train and 
        test set
    * test - test folder - the test folder content mirrors the train folder's. 
    It's files have the "_test" suffix.

## Project Deliverables
* run_analysis.R - The script to perform the tasks requested in this project
* README.md - this document
* CodeBook.Rmd - the description of the data in the file resulting from the 
run_analysis.R script

## Usage
The script will merge the train and test data of the dataset into a
"mergeddata" folder in the extracted "UCI HAR Dataset" folder.
The final output is the "AveragedMeasurements.txt" file, which is created in the 
same folder of the script.
    
* To use the run_analysis.R script in RStudio, load the script, set the working 
directory to where you want the data and results placed and source/run the script.
* To run the script in from the command line console write "Rscript run_analysis.R" without the quotes.
* To read the file "AveragedMeasurements.txt" into a dataframe you can use:
    read.table(file="AveragedMeasurements.txt", head=TRUE)
* This script requires the packaches plyr and reshape2.
* It was tested on GNU/Linux 3.19. If you have problems with the automatic download
and unzip of the data files please download and unzip them manually.

## Project Tasks
This project is made of 5 tasks. We have performed the tasks in the same order 
as they were requested. Please check the comments in the run_analysis.R script 
code for details.

### 1. Merge the training and the test sets to create one data set.

We have performed the merger of the dataset into a "mergeddata" folder with the 
same structure as the train and test folders, according to the following 
pseudocode:

1. Create mergeddata folder
2. Create Inertial Signals folder
3. For each file in the train folder and subfolder matching the pattern .txt
    + copy the file with the "_train" suffix removed to the mirrored test folder
    + append it the corresponding file from the test folder

### 2. Extract only the measurements on the mean and standard deviation for each measurement.

The labels for the measured and calculated data are in the features.txt file. 
The file contains two columns, the row number (ID) and the feature name, 
separated  y space. The order of rows corresponds to the order of the columns 
of the set of measured and calculated values of the merged X.txt file.

Pseudocode:

1. Read rows containing the exact "mean()" string from features.txt file
2. Read rows containing the exact "std()" string from features.txt file
3. Append the set 2. to 1.
4. Order the rows of 3. by the original row number (ID)
5. Read the measurements from the X.txt
6. Subset the measurements columns corresponding to the row numbers from 4.

### 3. Uses descriptive activity names to name the activities in the data set.

The activities being performed corresponding to the measured data are stored in 
the y.txt file. This file contains a single numeric column with the same number 
of rows and in the same order as the measurements in the X.txt file. The 
activity_labels.txt file links the activity labels in y.txt with the 
activity name.

Pseudocode:

1. Read activity labels from y.txt file
2. Read activity labels and activity names from activity_labels.txt file
3. Merge 1. and 2. by the activity label maintaining the order from 1.
4. Bind the activity name column from 3 to the mean() and std() set 
obtained in Part 2 step 6.

### 4. Appropriately labels the data set with descriptive variable names.

We obtained the name of the measured features in Part 2 step 4.

Pseudocode:

* Name the column of activity names from Part 3 step 4 "Activity"
* Use the feature names column from Part 2 step 4 to name the remaining columns.

### 5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

The labels of the subjects performing the activities measured are stored in 
subject.txt file. This file has the same number of rows as the measurements 
from X.txt and activities from y.txt.

Pseudocode:

1. Read subject.txt file into single column data frame and name the column "Subject".
2. Bind the "Subject" column to data frame obtained in Part 4.
3. Transform the resulting data frame into a narrow tidy data frame with columns:
    + "Subject", "Activity", "Measurement", "Value"
4. Average the measured values grouped by Subject, Activity and Measurement into the Values column.
5. Write the resulting data frame to "AveragedMeasurements.txt" file.
