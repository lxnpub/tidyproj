## Project for "Getting and Cleaning Data"

This README file explains how the script works and how it creates the independent data set.

###How use the script "run_analysis.R"

1. create a temp working directory say "tidywk"
2. cd tidywk
2. copy the R script run_analysis.R
3. download the datafile https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4. unzip the datafile, now under "tidywk" directory we should have a data dir called "UCI HAR Dataset"
5. run command "Rscript run_analysis.R", it will read and extarct all the information from the data directory. When it is done, a new independent data set is written to a text file "independent_data.txt"


###How the script "run_analysis.R" works

First let's explain how the dataset is structured; then we walk step by step on how the R script handles the dataset.

The dataset is divided into two subsets: "test" and "train", they have identical structures, but contain different observation records (based on different groups of subjects).


#### test set (2947 observations)
                             test/subject_test.txt   #rows = 2947   #columns =   1
                                   test/X_test.txt   #rows = 2947   #columns = 561
                                   test/y_test.txt   #rows = 2947   #columns =   1
         test/Inertial_Signals/body_acc_x_test.txt   #rows = 2947   #columns = 128
         test/Inertial_Signals/body_acc_y_test.txt   #rows = 2947   #columns = 128
         test/Inertial_Signals/body_acc_z_test.txt   #rows = 2947   #columns = 128
        test/Inertial_Signals/body_gyro_x_test.txt   #rows = 2947   #columns = 128
        test/Inertial_Signals/body_gyro_y_test.txt   #rows = 2947   #columns = 128
        test/Inertial_Signals/body_gyro_z_test.txt   #rows = 2947   #columns = 128
        test/Inertial_Signals/total_acc_x_test.txt   #rows = 2947   #columns = 128
        test/Inertial_Signals/total_acc_y_test.txt   #rows = 2947   #columns = 128
        test/Inertial_Signals/total_acc_z_test.txt   #rows = 2947   #columns = 128

#### train set (7352 observations)
                           train/subject_train.txt   #rows = 7352   #columns =   1
                                 train/X_train.txt   #rows = 7352   #columns = 561
                                 train/y_train.txt   #rows = 7352   #columns =   1
       train/Inertial_Signals/body_acc_x_train.txt   #rows = 7352   #columns = 128
       train/Inertial_Signals/body_acc_y_train.txt   #rows = 7352   #columns = 128
       train/Inertial_Signals/body_acc_z_train.txt   #rows = 7352   #columns = 128
      train/Inertial_Signals/body_gyro_x_train.txt   #rows = 7352   #columns = 128
      train/Inertial_Signals/body_gyro_y_train.txt   #rows = 7352   #columns = 128
      train/Inertial_Signals/body_gyro_z_train.txt   #rows = 7352   #columns = 128
      train/Inertial_Signals/total_acc_x_train.txt   #rows = 7352   #columns = 128
      train/Inertial_Signals/total_acc_y_train.txt   #rows = 7352   #columns = 128
      train/Inertial_Signals/total_acc_z_train.txt   #rows = 7352   #columns = 128
      
      
For example, "test" subset has the following 12 relavant files, each decribing different
attributes (columns) for the 2947 observations (obs). Similar description applys to
the "train" subset.

                             test/subject_test.txt   #rows = 2947   #columns =   1  <- subject id for each obs
                                   test/X_test.txt   #rows = 2947   #columns = 561  <- 561 feature variables for each obs
                                   test/y_test.txt   #rows = 2947   #columns =   1  <- activiy label for each obs
         test/Inertial_Signals/body_acc_x_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal body_acc_x
         test/Inertial_Signals/body_acc_y_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal body_acc_y
         test/Inertial_Signals/body_acc_z_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal body_acc_z
        test/Inertial_Signals/body_gyro_x_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal body_gyro_x
        test/Inertial_Signals/body_gyro_y_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal body_gyro_y
        test/Inertial_Signals/body_gyro_z_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal body_gyro_z
        test/Inertial_Signals/total_acc_x_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal total_acc_x
        test/Inertial_Signals/total_acc_y_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal total_acc_y
        test/Inertial_Signals/total_acc_z_test.txt   #rows = 2947   #columns = 128  <- 128 elements for signal total_acc_z
        
The script "run_analysis.R" works as follows:

1. Given test subset name "test", read all 12 files into 12 data frames, each contains 2974 observations:

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
4. Use rbind to merge two dataframes "test_df" and "train_df" into a full dataframe "full_df"
5. Extract only the mean and standard deviation columns from the feature columns, and create an extracted dataframe "extract_df"
6. Uses descriptive activity names to name the activities in "extract_df" according to the labels described in "activity_labels.txt"
7. Apply "melt" and "dcast" functionsto on the newly created dataframe "extract_df" to create a second, independent tidy data set "independ_data" with the average of each variable for each activity and each subject
8. Write the dataset "independ_data" to a text file "independent_data.txt"


