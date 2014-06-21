
data_dir <- "UCI HAR Dataset/"

# create column names for the variables in the signal files like the
# following ones. Each file has 128 columns, hence 128 column names:
#
# Inertial Signals/body_acc_x_train.txt
# Inertial Signals/body_acc_y_train.txt
# Inertial Signals/body_acc_z_train.txt
# Inertial Signals/body_gyro_x_train.txt
# Inertial Signals/body_gyro_y_train.txt
# Inertial Signals/body_gyro_z_train.txt
# Inertial Signals/total_acc_x_train.txt
# Inertial Signals/total_acc_y_train.txt
# Inertial Signals/total_acc_z_train.txt
gen_col_nms <- function(pfx) {
    sq <- 1:128
    sapply(sq, function(x) { sprintf("%s_%03d", pfx, x)})
}

## given directory name, set name and file prefix, read 128 variables from the signal file
read_signals <- function(dir_nm, set_nm, pfx) {
    f_nm <- paste0(dir_nm, pfx, "_", set_nm, ".txt")
    col_nms <- gen_col_nms(pfx)
    df <- read.table(f_nm, sep="",
                     header=F,
                     colClasses=rep("numeric", 128),
                     col.names=col_nms)
    df
}

## read 561 feature names, these names will become column names when
## reading the feature files
feature_fd <- read.table(paste0(data_dir, "features.txt"),
                         sep=" ",
                         header=F,
                         colClasses=c("numeric", "character"))
feature_nms <- feature_fd[, 2]


## given a data set name ("test" or "train"), read_subset reads the 12 files
## in the data set. The returned data frame has 1715 variables:
##
##      column 1:                        Subject     (1)
##      column 2:                        Activity    (1)
##      Column 2+1       to 2+128:       body_acc_x  (128)
##      Column 2+128+1   to 2+128*2:     body_acc_y  (128)
##      Column 2+128*2+1 to 2+128*3:     body_acc_z  (128)
##      Column 2+128*3+1 to 2+128*4:     body_gyro_x (128)
##      Column 2+128*4+1 to 2+128*5:     body_gyro_y (128)
##      Column 2+128*5+1 to 2+128*6:     body_gyro_z (128)
##      Column 2+128*6+1 to 2+128*7:     total_acc_x (128)
##      Column 2+128*7+1 to 2+128*8:     total_acc_y (128)
##      Column 2+128*8+1 to 2+128*9:     total_acc_z (128)
##      Column 2+128*9+1 to 2+128*9+561: features variables (561)
##
read_subset <- function(set_name) {
    dir_nm <- paste0(data_dir, set_name, "/Inertial Signals/")
    
    ## read 9 measurement files in the given data set
    body_acc_x <- read_signals(dir_nm, set_name, "body_acc_x")
    body_acc_y <- read_signals(dir_nm, set_name, "body_acc_y")
    body_acc_z <- read_signals(dir_nm, set_name, "body_acc_z")
    
    body_gyro_x <- read_signals(dir_nm, set_name, "body_gyro_x")
    body_gyro_y <- read_signals(dir_nm, set_name, "body_gyro_y")
    body_gyro_z <- read_signals(dir_nm, set_name, "body_gyro_z")
    
    total_acc_x <- read_signals(dir_nm, set_name, "total_acc_x")
    total_acc_y <- read_signals(dir_nm, set_name, "total_acc_y")
    total_acc_z <- read_signals(dir_nm, set_name, "total_acc_z")
    
    ## read subject ids
    sbj_fnm <- paste0(data_dir, set_name, "/subject_", set_name, ".txt")
    subject <- read.table(sbj_fnm,
                          sep="",
                          header=F,
                          colClasses="numeric",
                          col.names="Subject")
    
    ## read activity labels
    lab_fnm <- paste0(data_dir, set_name, "/y_", set_name, ".txt")
    activity <- read.table(lab_fnm,
                           sep="",
                           header=F,
                           colClasses="numeric",
                           col.names="Activity")
    
    ## read 561 features for each record
    features_fnm <- paste0(data_dir, set_name, "/X_", set_name, ".txt")
    features <- read.table(features_fnm,
                           sep="",
                           header=F,
                           colClasses=rep("numeric", 561),
                           check.names=F,  # keep column names like "tBodyAcc-mean()-X"
                           col.names=feature_nms)
    
    # bind all columns into one table
    df <- cbind(subject, activity,
                body_acc_x, body_acc_y, body_acc_z,
                body_gyro_x, body_gyro_y, body_gyro_z,
                total_acc_x, total_acc_y, total_acc_z,
                features)
    
    df
}


# read test and training sets into two separate data frames. Then
# merges the training and the test sets to create one data set.
test_df <- read_subset("test")        #  2947 obs. of 1715 variables
train_df <- read_subset("train")      #  7352 obs. of 1715 variables
full_df <- rbind(test_df, train_df)    # 10299 obs. of 1715 variables


# extract only the mean and standard deviation for each measurement
# (also keep Subject and Activity columns)
cols <- c(1, 2, grep("std|mean", names(test_df), perl=TRUE, value=FALSE))
extract_df <- full_df[, cols]          # 10299 obs. of 81 variables


# Uses descriptive activity names to name the activities in the data set
# according to the labels described in "activity_labels.txt"
label_act <- function(x) {
    lbs <- c("WALKING",
             "WALKING_UPSTAIRS",
             "WALKING_DOWNSTAIRS",
             "SITTING",
             "STANDING",
             "LAYING")
    lbs[x]
}
extract_df$Activity <- label_act(extract_df$Activity)


# Appropriately labels the data set with descriptive variable names.
# DONE: each variable already has been given a descriptive name in
# earlier steps


# Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject.
# first reshape the dataset according to each activity and each subject 
library(reshape2)
var_nms <- grep("std|mean", names(test_df), perl=TRUE, value=TRUE)
melt_df <- melt(extract_df,
                id=c("Subject", "Activity"),
                measure.vars=var_nms)

# Now create the independent data set with the average value of each variable
independ_data <- dcast(melt_df, Subject + Activity ~ variable, mean)
head(independ_data[, 1:5], n=12)


# write the independent data set to a text file
write.table(independ_data, file="independent_data.txt", row.names=F) # 180 obs. of 81 variables


