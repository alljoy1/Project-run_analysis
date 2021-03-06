This R script was created as an assignment for Week 3 of Coursera's "Getting and Cleaning Data" 
Project Instructions:
  ## You should create one R script called run_analysis.R that does the following. 
  
  ## 1. Merges the training and the test sets to create one data set.
  ## 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## 3.	Uses descriptive activity names to name the activities in the data set
  ## 4.	Appropriately labels the data set with descriptive variable names. 
  ## 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  ## the location of the .txt file folders is in the working directory
  ## this code requires the package plyr to be installed, as it uses "arrange" to join columns in step 3
  ## command to save output to file:  write.table(dataset5, "./dataset5.txt", sep="\t", row.names=FALSE, col.names=TRUE) 

Data Used:
    WinZip folder downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip	
    The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
    A full description is available at the site where the data was obtained: 
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

    License:
    ========
    Use of this dataset in publications must be acknowledged by referencing the following publication [1]  
    [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
    This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
    Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
    The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

    For each record it is provided:
    ======================================

    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    - Triaxial Angular velocity from the gyroscope. 
    - A 561-feature vector with time and frequency domain variables. 
    - Its activity label. 
    - An identifier of the subject who carried out the experiment.

    The dataset includes the following files:
    =========================================
    - 'README.txt'
    - 'features_info.txt': Shows information about the variables used on the feature vector.
    - 'features.txt': List of all features.
    - 'activity_labels.txt': Links the class labels with their activity name.
    - 'train/X_train.txt': Training set.
    - 'train/y_train.txt': Training labels.
    - 'test/X_test.txt': Test set.
    - 'test/y_test.txt': Test labels

    More information can be obtained by reading the "README.txt" of the downloaded zip file.

Variables Used:

    chkdir is a character vector listing all directories (folders) in the working directory
    dirExists is a boolean vector which is set to true if the folder "UCI HAR Dataset" is found in the working directory (uses chkdir)
    x_test is a data frame where the x_test.txt file is read and stored in
    x_train is a data frame where the x_train.txt file is read and stored in
    y_test is a data frame where the y_test.txt file is read and stored in   
    y_train is a data frame where the y_train.txt file is read and stored in
    subj_test is a data frame where the subject_test.txt file is read and stored in  
    subj_train is a data frame where the subject_train.txt file is read and stored in
    col_table is a data frame where the features.txt file is read and stored in
    col_names is a vector containing the 2nd column data stored in the col_table data frame (2nd column of the features.txt file)
	      In addition to the col_names vector for naming columns, the literals "Subject", "act_code", and "activity" are used to name columns containing that data.
    act_labels is a data frame where the activity_labels.txt file is read and stored in
    test is a dataframe containing the combined x, y and subject files for "test"
    train is a dataframe containing the combined x, y and subject files for "train"
    dataset is the combined dataset for all tables, adding the activity name column from the data frame act_labels (activity_labels.txt)
    dataset2 is the extract of only the measurements on the mean and standard deviation for each measurement
    ds5 is a temporary dataframe used to hold rearranged dataset prior to aggregation
    dataset5 is the "tidy data" from step 5, an independent tidy data set with the average of each variable for each activity and each subject

'R' Functions & Features used

    The plyr library was used for the arrange function and the ddply function
    The list.dirs function was used to check if the current working directory contained the parent folder of the data files
    The read.table function was used to load the data from the files into data frame variables
    The "names" function was used to name the columns for the datasets
    The "cbind" and "rbind" functions were used to combine the various subject, x and y files into one data frame
    The "grepl" function was used to locate partial column names to extract the means and the standard deviation columns
    The "as.vector" function was used to create a vector from a data frame subset    
    The "arrange" function was used to join columns in step 3 and sort columns in step 5
    The "ddply" function was used to aggregate columns in step 5

