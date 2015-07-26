## Codebook - Coursera Getting and Cleaning Data Project

(original data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

    Subject      1-30       index of 30 persons in study

    Activity                6 text representations of activity shown below

    Act      Activity Code
                    1       WALKING
                    2       WALKING_UPSTAIRS
                    3       WALKING_DOWNSTAIRS
                    4       SITTING
                    5       STANDING
                    6       LAYING

48 features with values for -mean()-X, -mean()-Y, -mean()-Z, -std()-X, -std()-Y, -std()-Z [8*6=48]

    tBodyAcc
    tGravityAcc
    tBodyAccJerk
    tBodyGyro
    tBodyGyroJerk
    fBodyAcc
    fBodyAccJerk
    fBodyGyro
  
  18 features with values for -mean() and -std() [9*2=18]
  
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAccMag
    fBodyBodyAccJerkMag
    fBodyBodyGyroMag
    fBodyBodyGyroJerkMag

Further description of these variables can be found in the file features_info.txt and README.txt in the source zip file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .  Following are some of the key points:

1. The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years.
2. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist.
3. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
4. Features are normalized and bounded within [-1,1]. The tidy data set contains means and standard deviations of these values.
5. The t at the beginning of some of the features denote them as time domain signals.
6. The f at the beginning of the other features denote frequency domain signals.
7. The features containing mean() denote mean values.
8. The features containing std() denote standard deviation.
