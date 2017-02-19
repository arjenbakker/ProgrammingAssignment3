# Getting and Cleaning Data Course Project

Purpose: create a tidy set of smartphone data using script run_analysis.R

# Files in this repo

- README.md -- you are reading it right now
- CodeBook.md -- codebook describing variables, the data and transformations
- run_analysis.R -- actual R code

# Raw Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script assumes it has in it's working directory the following files and folders:
- activity_labels.txt
- features.txt
- test/
- train/

# run_analysis.R functionality

The script has the following functionality:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# run_analysis.R steps
- read the common data files
- read the test data file
  - set correct column names
  - select only 'mean' and 'std' columns
- read test subject data file
- read test activity data file
  - set correct labels
- merge subject, activity and test data together
- read training data file
  - set correct column names
  - select only 'mean' and 'std' columns
- read training subject data file
- read training activity data file
  - set correct labels
- merge subject, activity and training data together
- merge training and test data to 1 file
  - tidy column names
- calculate means of all columns by subject and activity
- write result to file

# Result

Final result is a tidy dataset in the working directory called 'tidy_dataset.txt'.
