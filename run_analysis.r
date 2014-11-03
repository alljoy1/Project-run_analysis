{
  ## Project for Week 3 of Coursera's "Getting and Cleaning Data" Instructions:
  ## You should create one R script called run_analysis.R that does the following. 
  
  ## 1.  Merges the training and the test sets to create one data set.
  ## 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## 3.	Uses descriptive activity names to name the activities in the data set
  ## 4.	Appropriately labels the data set with descriptive variable names. 
  ## 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  ## the location of the .txt file folders is in the working directory
  ## this code requires the package plyr to be installed, as it uses "arrange" to join columns in step 3 and to sort columns in step 5
  ## command to save output to file:  write.table(dataset5, "./dataset5.txt", sep="\t", row.names=FALSE, col.names=TRUE) 
  
  require(plyr)      ##loads the plyr library
  ## checks to see if parent directory for files exists in working directory
  chkdir <-list.dirs(path = ".", full.names = FALSE, recursive = TRUE)
  dirExists=if(length(grep("UCI HAR Dataset",chkdir,ignore.case=TRUE))==0) {FALSE} else {TRUE}
  
  if (dirExists) {
    ## 1.  Merges the training and the test sets to create one data set.
    ## read the files from their subfolders
    x_test<-read.table(file="./UCI HAR Dataset/test/X_test.txt", header=FALSE, strip.white=TRUE)
    x_train<-read.table(file="./UCI HAR Dataset/train/X_train.txt", header=FALSE, strip.white=TRUE)
    y_test<-read.table(file="./UCI HAR Dataset/test/y_test.txt", header=FALSE, strip.white=TRUE)   
    y_train<-read.table(file="./UCI HAR Dataset/train/y_train.txt", header=FALSE, strip.white=TRUE)  
    subj_test<-read.table(file="./UCI HAR Dataset/test/subject_test.txt", header=FALSE, strip.white=TRUE)   
    subj_train<-read.table(file="./UCI HAR Dataset/train/subject_train.txt", header=FALSE, strip.white=TRUE)  
    col_table<-read.table(file="./UCI HAR Dataset/features.txt",header=FALSE,strip.white=TRUE)
    col_names<-as.vector(col_table[,2],'character')
    act_labels<-read.table(file="./UCI HAR Dataset/activity_labels.txt",header=FALSE,strip.white=TRUE)
    ## name the columns
    names(x_test)<-col_names
    names(y_test)<-c("act_code")
    names(subj_test)<-c("Subject")
    names(x_train)<-col_names
    names(y_train)<-c("act_code")
    names(subj_train)<-c("Subject")
    names(act_labels)<-c("act_code","activity")
    ## Merge tables together
    test<-cbind(subj_test,y_test,x_test)
    train<-cbind(subj_train,y_train,x_train)
    dataset<-rbind(test,train)
    ## end step 1
    
    ## 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
    ## uses grepl to search for partial names of columns in the data frame called "dataset" created in step 1
    dataset2<-dataset[,grepl("mean\\(", names(dataset))]
    dataset2<-cbind(dataset[,1:2],dataset2,dataset[,grepl("std\\(", names(dataset))])
    ## print(dataset2)
    ## end step 2
    
    ## 3.  Uses descriptive activity names to name the activities in the data set
    dataset2<-arrange(join(dataset2,act_labels),act_code)
    ## end step 3
    
    ## 4.  Appropriately labels the data set with descriptive variable names. 
    ##  This was completed in step one by reading the file features.txt and loading the columnnames into a vector "col_names"
    ## the vector was used by the "names" assignment for the x_train and x_test data frames,
    ## literals were used by the "names" assignement for the y_train, y_test, subj_test and act_labels data frames
    ## end step 4
    
    ## 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    ## need to Aggregate the columns 
    ds5<-arrange(dataset2,Subject,activity,act_code)    
    col_names<- (as.vector(names(dataset2)))[3:length(names(dataset2))-3]
    dataset5<-ddply(ds5,.(Subject,activity,act_code), function(x) colMeans(x[col_names]))

  } 
  else
  {
      print("The folder 'UCI HAR Dataset' was not found in the working directory")
      print("this folder and all its files and subfolders are required to be in working directory")
      print("Extract files from the WinZip file, Navigate to save to the working directory, and select 'Use Folder Names'")
  }
}




