# Course_Project_Dannhauser__3

This repository is submited for the peer graded assignment of the'Getting and Cleaning Data' course project. 
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

The analyzed dataset contains data collected from the accelerometers from the Samsung Galaxy S smartphone. Note, the dataset was downloaded (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and locally stored in the folder of the R script.

Project files:
code book.md indicate all the variables and summaries calculated, along with units, and any other relevant information for the project.
run_analysis.R performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy dataset.txt is the exported final data after going through all the sequences described above.
