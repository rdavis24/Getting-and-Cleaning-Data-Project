## Coursera Getting and Cleaning Data Project

Instructions for running analysis:

* Unzip the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to a directory on your computer,
say C:\Users\yourname\Documents\R\clean_data\ (the following assumes that it was unzipped into the subdirectory getdata-projectfiles-UCI HAR Dataset)

* Copy run_analysis.R to C:\Users\Red\Documents\R\clean_data\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset

* In RStudio, setwd("C:\\Users\\Red\\Documents\\R\\clean_data\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset") or set up a project for that existing directory

* In RStudio, source("run_analysis.R").  This will do the following:

1. Read the 8 required data files

2. Output information about the dimensions and first and last variables in each of the files

3. Look at the structure of the feature names to help determine those which are mean and standard deviation measurements and mark them for extraction.

4. Bind the subject and feature names to the training and test data

5. Merge the training and test data (STEP 1)

6. Change column names to feature names that were contained in features.txt (STEP 4). This needs to be done before mean() and std() columns are extracted.

7. Extract only the mean and standard deviation columns (STEP 2)

8. Merge the activity names that were contained in activity_labels.txt (STEP 3)

9. Write this initial tidy data set to tidy_data_set.txt

10. Create a second data set with averages grouped by subject and activity

11. Write this final tidy data set to tidy_data_set_averages.txt
