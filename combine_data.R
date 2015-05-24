combine_data <- function()
{
#this program will import predefined project data according to the following working directory structure  
#Working Directory Structure:
#-----------------------------------------------------------------------------------------------------  
  #run_analysis.R
  #test
    #subject_test.txt
    #X_test.txt
    #y_test.txt
  #train
    #subject_train.txt
    #X_train.txt
    #y_train.txt
#-----------------------------------------------------------------------------------------------------  

#the program will then filter the data columns for each group (test,train) separately according to the project specifications:
#keep columns with mean() and std()
#the program will then clean up the data to match the following format and output the results to combined_data.txt
#in the working directory and return the data for further use.  The cleaned up output format follows:
#Subject
#Activity
#tBodyAcc.mean.X
#tBodyAcc.mean.Y
#tBodyAcc.mean.Z
#tBodyAcc.std.X
#tBodyAcc.std.Y
#tBodyAcc.std.Z
#tGravityAcc.mean.X
#tGravityAcc.mean.Y
#tGravityAcc.mean.Z
#tGravityAcc.std.X
#tGravityAcc.std.Y
#tGravityAcc.std.Z
#tBodyAccJerk.mean.X
#tBodyAccJerk.mean.Y
#tBodyAccJerk.mean.Z
#tBodyAccJerk.std.X
#tBodyAccJerk.std.Y
#tBodyAccJerk.std.Z
#tBodyGyro.mean.X
#tBodyGyro.mean.Y
#tBodyGyro.mean.Z
#tBodyGyro.std.X
#tBodyGyro.std.Y
#tBodyGyro.std.Z
#tBodyGyroJerk.mean.X
#tBodyGyroJerk.mean.Y
#tBodyGyroJerk.mean.Z
#tBodyGyroJerk.std.X
#tBodyGyroJerk.std.Y
#tBodyGyroJerk.std.Z
#tBodyAccMag.mean
#tBodyAccMag.std
#tGravityAccMag.mean
#tGravityAccMag.std
#tBodyAccJerkMag.mean
#tBodyAccJerkMag.std
#tBodyGyroMag.mean
#tBodyGyroMag.std
#tBodyGyroJerkMag.mean
#tBodyGyroJerkMag.std
#fBodyAcc.mean.X
#fBodyAcc.mean.Y
#fBodyAcc.mean.Z
#fBodyAcc.std.X
#fBodyAcc.std.Y
#fBodyAcc.std.Z
#fBodyAccJerk.mean.X
#fBodyAccJerk.mean.Y
#fBodyAccJerk.mean.Z
#fBodyAccJerk.std.X
#fBodyAccJerk.std.Y
#fBodyAccJerk.std.Z
#fBodyGyro.mean.X
#fBodyGyro.mean.Y
#fBodyGyro.mean.Z
#fBodyGyro.std.X
#fBodyGyro.std.Y
#fBodyGyro.std.Z
#fBodyAccMag.mean
#fBodyAccMag.std
#fBodyBodyAccJerkMag.mean
#fBodyBodyAccJerkMag.std
#fBodyBodyGyroMag.mean
#fBodyBodyGyroMag.std
#fBodyBodyGyroJerkMag.mean
#fBodyBodyGyroJerkMag.std
#-----------------------------------------------------------------------------------------------------  




#import data from wd subdirectories
#-----------------------------------------------------------------------------------------------------  
  #import features and activity_lables
  features <- read.table("features.txt",header = FALSE, col.names = c("FeatureID","FeatureDesc"))
  activity_labels <- read.table("activity_labels.txt",header = FALSE, col.names = c("ActivityID","ActivityDesc"))
  
  #import test data using features field FeatureDesc as column names for X_test data table
  subject_test <- read.table("test\\subject_test.txt",header = FALSE,col.names = c("SubjectID"))
  y_test <- read.table("test\\y_test.txt", header = FALSE, col.names = c("ActivityID"))
  X_test <- read.table("test\\X_test.txt", header = FALSE, col.names = features[,"FeatureDesc"])
  
  #import train data using features field FeatureDesc as column names for X_train data table
  subject_train <- read.table("train\\subject_train.txt",header = FALSE,col.names = c("SubjectID"))
  y_train <- read.table("train\\y_train.txt", header = FALSE, col.names = c("ActivityID"))
  X_train <- read.table("train\\X_train.txt", header = FALSE, col.names = features[,"FeatureDesc"] )
#-----------------------------------------------------------------------------------------------------  
  
#reduce data to requested columns of -mean() and -std() according to project requirements
#-----------------------------------------------------------------------------------------------------
  #create regex for each type of "filter" and add them to a filters list
  mean_filter <- ".mean[(]"
  std_filter <- ".std[(]"
  filter_list <- c(mean_filter,std_filter)
  #build pattern from filters list
  pattern <- paste(filter_list,collapse = "|")
  #create filter factor list for column names that match the regex filters
  column_filter_index <- grepl(pattern,features[,"FeatureDesc"],ignore.case = TRUE, fixed = FALSE)
 
  #create new filtered tables for test and train data based on the above column filter index
  X_test_filtered <- X_test[,column_filter_index]
  X_train_filtered <- X_train[,column_filter_index]
#-----------------------------------------------------------------------------------------------------


#add subject and activity columns to the filtered data sets
#-----------------------------------------------------------------------------------------------------
  X_test_filtered$Subject = subject_test$SubjectID
  X_test_filtered$Activity = activity_labels[y_test$ActivityID,"ActivityDesc"]
  X_train_filtered$Subject = subject_train$SubjectID
  X_train_filtered$Activity= activity_labels[y_train$ActivityID,"ActivityDesc"]
#----------------------------------------------------------------------------------------------------- 
 

#remove the test,train,feature, activity_labels,subject_test,subject_train data because it is no longer needed will use the filtered data tables from here
#-----------------------------------------------------------------------------------------------------  
#rm(list = c("X_test","X_train","features","y_test","y_train","activity_labels","subject_test","subject_train"))
#----------------------------------------------------------------------------------------------------- 
 

#combine the filtered test and train data
#-----------------------------------------------------------------------------------------------------
combined_data <- rbind(X_test_filtered,X_train_filtered)
#-----------------------------------------------------------------------------------------------------


#clean up the combined data to make it "tidy"
#-----------------------------------------------------------------------------------------------------
combined_data <- combined_data[c(67,68,1:66)]
columns <- colnames(combined_data)
columns <- gsub("...",".",columns,fixed = TRUE)
columns <-gsub("..","",columns,fixed = TRUE)
colnames(combined_data) <- columns
#-----------------------------------------------------------------------------------------------------


#remove the temporary test and train filtered data now that combined data has been created
#-----------------------------------------------------------------------------------------------------
#rm(list = c("X_test_filtered","X_train_filtered"))
#----------------------------------------------------------------------------------------------------- 
write.table(combined_data,"combined_data.txt",row.names = FALSE, col.names = TRUE)  

return(combined_data)
  
}