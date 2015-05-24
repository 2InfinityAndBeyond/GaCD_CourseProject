---
title: "Getting and Cleaning Data Course Project CodeBook"
author: "koi.torres"
date: "Sunday, May 24, 2015"
output: html_document
---

This file describes the data and any transformations or work that I have performed to clean up the data.  

Original data and full descriptions can be obtained from <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

The dataset used for this project can be obtained from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

The R script "run_analysis.R" performs the following to clean up the data:

1. Merges the training and test sets to create one data set. 
* "train/X_train.txt" and "test/X_test.txt" datasets merges to "xMergedData".
* "train/y_train.txt" and "test/y_test.txt" datasets merges to "yMergedData".
* "train/subject_train.txt" and "test/subject_test.txt" datasets merges to "sMergedData".
2. Reads "features.txt"" and extracts only the measurements on the mean and standard deviation for each measurement. Clean the column names of the subset. We remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively. 

3. Reads "activity_labels.txt" and applies descriptive activity names to name the activities in the data set and store the results to a new data.frame activities.
* 1 is converted to "walking"
* 2 is converted to "walkingupstairs"
* 3 is converted to "walkingdownstairs"
* 4 is converted to "sitting"
* 5 is converted to "standing"
* 6 is converted to "laying"

4. Merges the "sMergedData", "yMergedData", and "xMergedData" into a single data.frame "tidyData". This data has a dimension of 10299 by 68.
5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as "tidyData_averages.txt". The data has a dimension of 180 by 68.