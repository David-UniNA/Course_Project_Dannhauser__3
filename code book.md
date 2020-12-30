The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

the dataset was previously downloaded (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and locally stored in the folder of the R-script (run_analysis.R).

load libaries.

read supporting metadata using the read.table() function.

create training (train) dataset using the read.tabe() function.

create test dataset using the read.table() function.

merge training and test sets to create one data set using the rbind() and the cbind() functions.

extracts only measurements on the mean and standard deviation for each measurement using the grep() function.

uses descriptive activity names to name the activities in the data set using as.character() function and the second column of the activities variable.

appropriately labels the data set with descriptive variable names using the gsub() function.

from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The tidyData.txt file is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupping them by subject and activity.
