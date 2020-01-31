# Code Book
- Author: RaymondKevin
- Data: 2020-01-31

This code book describes the resulting data of the cleaning process.

## Data Source Details
- Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Dataset Description
Since full details and explanations can be found in the *README.txt* in the zip file, here explains the structure and transformation of the new data.

### General
This data consists of the binding result of the *train* and *test* group, but taking the **average** of each variable for each activity and each subject.

| Features | Content |
|----------|---------|
|  nrow    |   180   |
|  ncols   |   68    |
|  rownames|   1~180 |
|  colnames|  Subject, Activity, *data*(std, mean)    |

### Details of Rows
- For each row, the first two columns are **Subject** and **Activity**, describing the basic information.
- The next 178 columns are all *data*(std, mean), which including
  1. tBodyAcc-X,Y,Z
  2. tGravityAcc-X,Y,Z
  3. tBodyAccJerk-X,Y,Z
  4. tBodyGyro-X,Y,Z
  5. tBodyGyroJerk-X,Y,Z
  6. tBodyAccMag
  7. tGravityAccMag
  8. tBodyAccJerkMag
  9. tBodyGyroMag
  10. tBodyGyroJerkMag
  11. fBodyAcc-X,Y,Z
  12. fBodyAccJerk-X,Y,Z
  13. fBodyGyro-X,Y,Z
  14. fBodyAccMag
  15. fBodyAccJerkMag
  16. fBodyGyroMag
  17. fBodyGyroJerkMag
- Name Transformation
  - Delete '(' and ')', e.g. *tBodyAcc-mean()-X* is **changed** into *tBodyAcc-mean-X*.
