library(data.table)
library(dplyr)

# read supporting Metadata
featureNames <- read.table("UCI HAR Dataset/features.txt")

# create train dataset
X_train 	 <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
Y_train 	 <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subjectTRAIN <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# create test dataset
X_test	 <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
Y_test	 <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subjectTEST  <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)


# 1 - Merges the training and the test sets to create one data set.
subject <- rbind(subjectTRAIN, subjectTEST)
activity <- rbind(Y_train, Y_test)
features <- rbind(X_train, X_test)
colnames(features) <- t(featureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
Data <- cbind(features,activity,subject)

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
columns_MeanSTD <- grep(".*Mean.*|.*Std.*", names(Data), ignore.case=TRUE)
reqColumns <- c(columns_MeanSTD, 562, 563)
dim(Data)
exData <- Data[,reqColumns]
dim(exData)

# 3 - Uses descriptive activity names to name the activities in the data set
exData$Activity <- as.character(exData$Activity)
for (i in 1:6){
		  exData$Activity[exData$Activity == i] <- as.character(activityLabels[i,2])
		  }
exData$Activity <- as.factor(exData$Activity)

# 4 - Appropriately labels the data set with descriptive variable names
names(exData)
names(exData)<-gsub("Acc", "Accelerometer", names(exData))
names(exData)<-gsub("Gyro", "Gyroscope", names(exData))
names(exData)<-gsub("BodyBody", "Body", names(exData))
names(exData)<-gsub("Mag", "Magnitude", names(exData))
names(exData)<-gsub("^t", "Time", names(exData))
names(exData)<-gsub("^f", "Frequency", names(exData))
names(exData)<-gsub("tBody", "TimeBody", names(exData))
names(exData)<-gsub("-mean()", "Mean", names(exData), ignore.case = TRUE)
names(exData)<-gsub("-std()", "STD", names(exData), ignore.case = TRUE)
names(exData)<-gsub("-freq()", "Frequency", names(exData), ignore.case = TRUE)
names(exData)<-gsub("angle", "Angle", names(exData))
names(exData)<-gsub("gravity", "Gravity", names(exData))
names(exData)

# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
exData$Subject <- as.factor(exData$Subject)
exData <- data.table(exData)
tidyData <- aggregate(. ~Subject + Activity, exData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
## write new tidy file
write.table(tidyData, file = "UCI HAR Dataset/Tidy dataset.txt", quote = FALSE, row.names = FALSE)