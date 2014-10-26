Project-run_analysis
====================

Week 3 Project Submission for Coursera's Getting and Cleaning Data course, October 2014

The script in this repo was created as an assignment for Week 3 of Coursera's "Getting and Cleaning Data" 
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

To load the files used by this script, download the zip file from:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

    Once the files have been downloaded, extract the files and folders using WinZip:
	Open the files using WinZip and select "Extract"
	When the extract form appears, navigate to the folder to put the files and folders extracted
	select "All files/folders in archive" and "Use folder names", then click "Extract"

    From R, change the working directory to the folder navigated to in the above step (using setwd)
    Run the script
    
The output from step 2 will be stored in the dataframe dataset2
The output from steps 1,3 and 4 will be stored in the dataframe dataset
The output from step 5 will be stored in the dataframe dataset5

to view the outputs, use the print command or use the write.table function to save the data to a text file
	Example:  write.table(dataset5, "./dataset5.txt", sep="\t", row.names=FALSE, col.names=TRUE) 

This dataset was originally collected and compiled by:
    [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
    This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
    Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

    More information can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


