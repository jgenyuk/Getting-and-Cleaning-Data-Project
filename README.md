# Getting-and-Cleaning-Data-Project

This project includes following files for the final course project of the Getting and Cleaning Data course:

1. Human Activity Recognition Using Smartphones Dataset, converted to tidy data
2. Script run_analysis.R which converts the original dataset to tidy data
3. Code book describing the dataset

The script uses the following steps to convert the data:

1. Reads testing and training data files, as well as files with subjects and acticity codes.
2. Converts activity codes to a factor with meaningful activity names as levels.
3. Merges the testing and training data.
4. Reads the feature names and assigns names to the data frame columns.
5. Extracts only the measurements on the mean and standard deviation for each feature.
6. Adds an activity column.
7. Melts the data set using activity and subject as id variables.
8. Takes averages of each variable for each activity-subject combination and removes duplicates rows.
9. Reshapes data frame into a tidy data set by casting.
