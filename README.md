---
title: "Getting and Cleaning Data Course Project"
author: "koi.torres"
date: "Sunday, May 24, 2015"
output: html_document
---

This file describes how to run the R script "run_analysis.R" and how it works.

How to run the R script "run_analysis.R"?

* Download and unzip the data file from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
* Set the folder "UCI HAR Dataset" as your R working directory in RStudio.
* Load and run the "run_analysis.R" script in RStudio.

How the R script "run_analysis.R" works?

* Step 1, merges the training (xTrainData, yTrainData, sTrainData) and the test (xTestData, yTestData, sTestData) sets to create one data set (xMergedData, yMergedData, sMergedData).
* Step 2, extracts only the measurements on the mean and standard deviation for each measurement. Appropriately labels the data set with descriptive variable names. It converts the variable names such as tBodyAcc-mean()-X, tBodyAcc-mean()-Y, and tBodyAcc-mean()-Z to a different format which are tBodyAccMeanX, tBodyAccMeanY, and tBodyAccMeanZ respectively. 
* Step 3, uses descriptive activity names to name the activities in the data set. It converts the activity values 1,2,3,4,5, and 6 to walking, walking_upstrairs, walking_downstairs, sitting, standing, and laying respectively.   
* Step 4, merges the sMergedData, yMergedData, and xMergedData into a single data.frame tidyData.
* Step 5, from the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.




