# Step 1 (see README.md for description)

xTrainData <- read.table("train/X_train.txt")
xTestData <- read.table("test/X_test.txt")
sTrainData <- read.table("train/subject_train.txt")
sTestData <- read.table("test/subject_test.txt")
yTrainData <- read.table("train/y_train.txt")
yTestData <- read.table("test/y_test.txt")

xMergedData <- rbind(xTrainData, xTestData)
sMergedData <- rbind(sTrainData, sTestData)
yMergedData <- rbind(yTrainData, yTestData)

# Step 2 (see README.md for description)

features <- read.table("features.txt")
meanStdIndices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
xMergedData <- xMergedData[, meanStdIndices]
names(xMergedData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(xMergedData) <- gsub("mean", "Mean", names(xMergedData))
names(xMergedData) <- gsub("std", "Std", names(xMergedData))
names(xMergedData) <- gsub("-", "", names(xMergedData))

# Step 3 (see README.md for description)

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
yMergedData[,1] = activities[yMergedData[,1], 2]
names(yMergedData) <- "activity"

# Step 4 (see README.md for description)

names(sMergedData) <- "subject"
tidyData <- cbind(sMergedData, yMergedData, xMergedData)
write.table(tidyData, "mergedTidyData.txt")

# Step 5 (see README.md for description)

numberOfSubjects <- length(table(sMergedData))
numberOfActivities <- dim(activities)[1]
numberOfColumns <- dim(tidyData)[2]
result <- matrix(NA, nrow=numberOfSubjects*numberOfActivities, ncol=numberOfColumns) 
result <- as.data.frame(result)
colnames(result) <- colnames(tidyData)
row <- 1
for(i in 1:numberOfSubjects) {
     for(j in 1:numberOfActivities) {
          result[row, 1] <- sort(unique(sMergedData)[, 1])[i]
          result[row, 2] <- activities[j, 2]
          logic1 <- i == tidyData$subject
          logic2 <- activities[j, 2] == tidyData$activity
          result[row, 3:numberOfColumns] <- colMeans(tidyData[logic1&logic2, 3:numberOfColumns])
          row <- row + 1
     }
}
write.table(result, "tidyData_averages.txt")