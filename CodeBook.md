## Code book for dataset "independent_data.txt"


This file describes the variables, the data, and any transformations performed to
clean up the data to create the independent dataset "independent_data.txt". The file
contains 1 row of header (first row), and the rest data has 180 rows and 81 columns.

There are 30 subjects in total. Each subject has 6 types of activities. There are 30x6=180
combinations of pair (subject, activity). For each pair of (subject, activity), the average
values for the 79 variables in the original feature set are computed.

#### Variables in "independent_data.txt"
```
   [1] "Subject"             : Subject id for this record
   [2] "Activity"            : Activity label for this record, one of ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
   [3] "tBodyAcc-mean()-X"   : average value of the feature variable "tBodyAcc-mean()-X" for this (subject, activity)
   [4] "tBodyAcc-mean()-Y"   : average value of the feature variable "tBodyAcc-mean()-Y" for this (subject, activity)           
   [5] "tBodyAcc-mean()-Z"   : average value of the feature variable "tBodyAcc-mean()-Z" for this (subject, activity)           
   [6] "tBodyAcc-std()-X"    : average value of the feature variable "tBodyAcc-std()-X" for this (subject, activity) 
   [7] "tBodyAcc-std()-Y"    : average value of the feature variable "tBodyAcc-std()-Y" for this (subject, activity) 
   [8] "tBodyAcc-std()-Z"    : average value of the feature variable "tBodyAcc-std()-Z" for this (subject, activity)
   [9] "tGravityAcc-mean()-X"    * * *  similar description  as above * * *      
  [10] "tGravityAcc-mean()-Y"     
  [11] "tGravityAcc-mean()-Z"           
  [12] "tGravityAcc-std()-X"            
  [13] "tGravityAcc-std()-Y"            
  [14] "tGravityAcc-std()-Z"            
  [15] "tBodyAccJerk-mean()-X"          
  [16] "tBodyAccJerk-mean()-Y"          
  [17] "tBodyAccJerk-mean()-Z"          
  [18] "tBodyAccJerk-std()-X"           
  [19] "tBodyAccJerk-std()-Y"           
  [20] "tBodyAccJerk-std()-Z"           
  [21] "tBodyGyro-mean()-X"             
  [22] "tBodyGyro-mean()-Y"             
  [23] "tBodyGyro-mean()-Z"             
  [24] "tBodyGyro-std()-X"              
  [25] "tBodyGyro-std()-Y"              
  [26] "tBodyGyro-std()-Z"              
  [27] "tBodyGyroJerk-mean()-X"         
  [28] "tBodyGyroJerk-mean()-Y"         
  [29] "tBodyGyroJerk-mean()-Z"         
  [30] "tBodyGyroJerk-std()-X"          
  [31] "tBodyGyroJerk-std()-Y"          
  [32] "tBodyGyroJerk-std()-Z"          
  [33] "tBodyAccMag-mean()"             
  [34] "tBodyAccMag-std()"              
  [35] "tGravityAccMag-mean()"          
  [36] "tGravityAccMag-std()"           
  [37] "tBodyAccJerkMag-mean()"         
  [38] "tBodyAccJerkMag-std()"          
  [39] "tBodyGyroMag-mean()"            
  [40] "tBodyGyroMag-std()"             
  [41] "tBodyGyroJerkMag-mean()"        
  [42] "tBodyGyroJerkMag-std()"         
  [43] "fBodyAcc-mean()-X"              
  [44] "fBodyAcc-mean()-Y"              
  [45] "fBodyAcc-mean()-Z"              
  [46] "fBodyAcc-std()-X"               
  [47] "fBodyAcc-std()-Y"               
  [48] "fBodyAcc-std()-Z"               
  [49] "fBodyAcc-meanFreq()-X"          
  [50] "fBodyAcc-meanFreq()-Y"          
  [51] "fBodyAcc-meanFreq()-Z"          
  [52] "fBodyAccJerk-mean()-X"          
  [53] "fBodyAccJerk-mean()-Y"          
  [54] "fBodyAccJerk-mean()-Z"          
  [55] "fBodyAccJerk-std()-X"           
  [56] "fBodyAccJerk-std()-Y"           
  [57] "fBodyAccJerk-std()-Z"           
  [58] "fBodyAccJerk-meanFreq()-X"      
  [59] "fBodyAccJerk-meanFreq()-Y"      
  [60] "fBodyAccJerk-meanFreq()-Z"      
  [61] "fBodyGyro-mean()-X"             
  [62] "fBodyGyro-mean()-Y"             
  [63] "fBodyGyro-mean()-Z"             
  [64] "fBodyGyro-std()-X"              
  [65] "fBodyGyro-std()-Y"              
  [66] "fBodyGyro-std()-Z"              
  [67] "fBodyGyro-meanFreq()-X"         
  [68] "fBodyGyro-meanFreq()-Y"         
  [69] "fBodyGyro-meanFreq()-Z"         
  [70] "fBodyAccMag-mean()"             
  [71] "fBodyAccMag-std()"              
  [72] "fBodyAccMag-meanFreq()"         
  [73] "fBodyBodyAccJerkMag-mean()"     
  [74] "fBodyBodyAccJerkMag-std()"      
  [75] "fBodyBodyAccJerkMag-meanFreq()" 
  [76] "fBodyBodyGyroMag-mean()"        
  [77] "fBodyBodyGyroMag-std()"         
  [78] "fBodyBodyGyroMag-meanFreq()"    
  [79] "fBodyBodyGyroJerkMag-mean()"  
  [80] "fBodyBodyGyroJerkMag-std()"      * * * similar description  as above  * * *
  [81] "fBodyBodyGyroJerkMag-meanFreq()" : average value of the feature variable "fBodyBodyGyroJerkMag-meanFreq()" for this (subject, activity)
```  

#### The steps and transformations performed to create "independent_data.txt"


1. Given test subset name "test", the script run_analysis.R reads all 12 files into 12 data frames, each contains 2974 observations:

                             subject     (1 column)
                             activity    (1 column)
                             body_acc_x  (128 columns)
                             body_acc_y  (128 columns)
                             body_acc_z  (128 columns)
                             body_gyro_x (128 columns)
                             body_gyro_y (128 columns)
                             body_gyro_z (128 columns)
                             total_acc_x (128 columns)
                             total_acc_y (128 columns)
                             total_acc_z (128 columns)
                             features    (561 columns)

2. Use cbind to bind all columns into one dataframe "test_df", which has 2947 obs. of 1715 variables
3. Follow the same procedure for subset "train" to create a dataframe "train_df", which has 7352 obs. of 1715 variables
4. Use rbind to merge two dataframes "test_df" and "train_df" into a full dataframe "full_df", which has 10299 obs. of 1715 variables
5. Extract only the mean and standard deviation columns from the feature columns, and create an extracted dataframe "extract_df"
6. Uses descriptive activity names to name the activities in "extract_df" according to the labels described in "activity_labels.txt"
7. Apply "melt" and "dcast" functions on the newly created dataframe "extract_df" to create a second, independent tidy data set "independ_data" which contains the average of each variable for each activity and each subject
8. Write the dataset "independ_data" to a text file "independent_data.txt"


