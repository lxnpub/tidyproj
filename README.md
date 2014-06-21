tidyproj
========

Project for "Getting and Cleaning Data"

This README file explains how the script works and how it creates the independent data set.

How use the script "run_analysis.R"

1. create a temp working directory say "tidywk"
2. cd tidywk
2. copy the R script run_analysis.R
3. download the datafile https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4. unzip the datafile, now under "tidywk" directory we should have a data dir called "UCI HAR Dataset"
5. run command "Rscript run_analysis.R", it will read and extarct all the information from the data directory. When it is done, a new independent data set is written to a text file "independent_data.txt"


