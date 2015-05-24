run_analysis <- function()
{
  #this program utilizes run_analysis.R to import the combined test and train data
  #it then calculates the aggregated average for the data by subject and activity
  #it outputs the data to aggregated_avg_data.txt in working directory and returns the results for further
  #calculations.  The format of the results follows:
  #-----------------------------------------------------------------------------------------------------  
  #Subject
  #Activity
  #tBodyAcc.mean.X.avg
  #tBodyAcc.mean.Y.avg
  #tBodyAcc.mean.Z.avg
  #tBodyAcc.std.X.avg
  #tBodyAcc.std.Y.avg
  #tBodyAcc.std.Z.avg
  #tGravityAcc.mean.X.avg
  #tGravityAcc.mean.Y.avg
  #tGravityAcc.mean.Z.avg
  #tGravityAcc.std.X.avg
  #tGravityAcc.std.Y.avg
  #tGravityAcc.std.Z.avg
  #tBodyAccJerk.mean.X.avg
  #tBodyAccJerk.mean.Y.avg
  #tBodyAccJerk.mean.Z.avg
  #tBodyAccJerk.std.X.avg
  #tBodyAccJerk.std.Y.avg
  #tBodyAccJerk.std.Z.avg
  #tBodyGyro.mean.X.avg
  #tBodyGyro.mean.Y.avg
  #tBodyGyro.mean.Z.avg
  #tBodyGyro.std.X.avg
  #tBodyGyro.std.Y.avg
  #tBodyGyro.std.Z.avg
  #tBodyGyroJerk.mean.X.avg
  #tBodyGyroJerk.mean.Y.avg
  #tBodyGyroJerk.mean.Z.avg
  #tBodyGyroJerk.std.X.avg
  #tBodyGyroJerk.std.Y.avg
  #tBodyGyroJerk.std.Z.avg
  #tBodyAccMag.mean.avg
  #tBodyAccMag.std.avg
  #tGravityAccMag.mean.avg
  #tGravityAccMag.std.avg
  #tBodyAccJerkMag.mean.avg
  #tBodyAccJerkMag.std.avg
  #tBodyGyroMag.mean.avg
  #tBodyGyroMag.std.avg
  #tBodyGyroJerkMag.mean.avg
  #tBodyGyroJerkMag.std.avg
  #fBodyAcc.mean.X.avg
  #fBodyAcc.mean.Y.avg
  #fBodyAcc.mean.Z.avg
  #fBodyAcc.std.X.avg
  #fBodyAcc.std.Y.avg
  #fBodyAcc.std.Z.avg
  #fBodyAccJerk.mean.X.avg
  #fBodyAccJerk.mean.Y.avg
  #fBodyAccJerk.mean.Z.avg
  #fBodyAccJerk.std.X.avg
  #fBodyAccJerk.std.Y.avg
  #fBodyAccJerk.std.Z.avg
  #fBodyGyro.mean.X.avg
  #fBodyGyro.mean.Y.avg
  #fBodyGyro.mean.Z.avg
  #fBodyGyro.std.X.avg
  #fBodyGyro.std.Y.avg
  #fBodyGyro.std.Z.avg
  #fBodyAccMag.mean.avg
  #fBodyAccMag.std.avg
  #fBodyBodyAccJerkMag.mean.avg
  #fBodyBodyAccJerkMag.std.avg
  #fBodyBodyGyroMag.mean.avg
  #fBodyBodyGyroMag.std.avg
  #fBodyBodyGyroJerkMag.mean.avg
  #fBodyBodyGyroJerkMag.std.avg
  #-----------------------------------------------------------------------------------------------------  
  
  #include the run_analysis function to get the combined data set see documentation for run_analysis.R
  print("importing combine_data.R...")
  source("combine_data.R")
  
  #read in combined data from run_analysis
  print("running run_analysis()..")
  combined_data <- combine_data()
  print("finished run_analysis aggregating data..")
  
  #calculate aggregated mean on subject and activity
  aggdata <-aggregate(combined_data[,3:68], by=list(combined_data$Subject,combined_data$Activity), FUN=mean, na.rm=TRUE)
  
  #clean up the column names to identify that they columns are now avg data
  columns <- paste(colnames(combined_data),".avg",sep = "")
  columns[1] <- "Subject"
  columns[2] <- "Activity"
  colnames(aggdata) <-  columns
  
  #write out the aggregated data to aggregated_avg_data.txt in working directory
  write.table(aggdata,"aggregated_avg_data.txt",row.names = FALSE, col.names = TRUE)  
  
  #return the aggregated avg data for furter calcs
  return(aggdata)
  
}