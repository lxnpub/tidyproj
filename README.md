tidyproj
========

##Project for "Getting and Cleaning Data"

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


### test set (2947 observations)
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

### train set (7352 observations)
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
      
      
For example, "test" subset has the following relavant files, each decribing different
attributes (columns) for the 2947 observations (obs)

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
        
        
