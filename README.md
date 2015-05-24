# Getting_and_Cleaning_Data

The following linked documentation model was developed and used to map data files to requirements.
<https://github.com/kgilstrap/Getting_and_Cleaning_Data/blob/master/DocumentationModel.jpg>

two R source files were created:

##combine_data.R
this files sits in the working directory with the following structure:
test\subject_test.txt

test\X_test.txt

test\y_test.txt

train\subject_train.txt

train\X_train.txt

train\y_train.txt

features.txt

activity_labels.txt
  
this function will import the data from the prereq files above and combine the test and train data sets 
into one unified set

the data set is output to the file combined_data.txt in the working directory.

it will also return the data set for further computation if required.

the source code contains minor documentation to explain each processing section as it occurs sequentially.

the output format contains headers and follows:

Subject

Activity

tBodyAcc.mean.X

tBodyAcc.mean.Y

tBodyAcc.mean.Z

tBodyAcc.std.X

tBodyAcc.std.Y

tBodyAcc.std.Z

tGravityAcc.mean.X

tGravityAcc.mean.Y

tGravityAcc.mean.Z

tGravityAcc.std.X

tGravityAcc.std.Y

tGravityAcc.std.Z

tBodyAccJerk.mean.X

tBodyAccJerk.mean.Y

tBodyAccJerk.mean.Z

tBodyAccJerk.std.X

tBodyAccJerk.std.Y

tBodyAccJerk.std.Z

tBodyGyro.mean.X

tBodyGyro.mean.Y

tBodyGyro.mean.Z

tBodyGyro.std.X

tBodyGyro.std.Y

tBodyGyro.std.Z

tBodyGyroJerk.mean.X

tBodyGyroJerk.mean.Y

tBodyGyroJerk.mean.Z

tBodyGyroJerk.std.X

tBodyGyroJerk.std.Y

tBodyGyroJerk.std.Z

tBodyAccMag.mean

tBodyAccMag.std

tGravityAccMag.mean

tGravityAccMag.std

tBodyAccJerkMag.mean

tBodyAccJerkMag.std

tBodyGyroMag.mean

tBodyGyroMag.std

tBodyGyroJerkMag.mean

tBodyGyroJerkMag.std

fBodyAcc.mean.X

fBodyAcc.mean.Y

fBodyAcc.mean.Z

fBodyAcc.std.X

fBodyAcc.std.Y

fBodyAcc.std.Z

fBodyAccJerk.mean.X

fBodyAccJerk.mean.Y

fBodyAccJerk.mean.Z

fBodyAccJerk.std.X

fBodyAccJerk.std.Y

fBodyAccJerk.std.Z

fBodyGyro.mean.X

fBodyGyro.mean.Y

fBodyGyro.mean.Z

fBodyGyro.std.X

fBodyGyro.std.Y

fBodyGyro.std.Z

fBodyAccMag.mean

fBodyAccMag.std

fBodyBodyAccJerkMag.mean

fBodyBodyAccJerkMag.std

fBodyBodyGyroMag.mean

fBodyBodyGyroMag.std

fBodyBodyGyroJerkMag.mean

fBodyBodyGyroJerkMag.std


##run_analysis.R
this file sits in the same working directory as combine_data.R.

it will source combine_data.R to pull the required data.

it provides the mean aggregate columns for the data on subject and activity.

it outputs the results to aggregated_avg_data.txt in the working directory and returns the results for further computation if
required.

the source code contains minor documentation to explain each processing section as it occurs sequentially.

the output format follows:

  Subject
  
  Activity
  
  tBodyAcc.mean.X.avg
  
  tBodyAcc.mean.Y.avg
  
  tBodyAcc.mean.Z.avg
  
  tBodyAcc.std.X.avg
  
  tBodyAcc.std.Y.avg
  
  tBodyAcc.std.Z.avg
  
  tGravityAcc.mean.X.avg
  
  tGravityAcc.mean.Y.avg
  
  tGravityAcc.mean.Z.avg
  
  tGravityAcc.std.X.avg
  
  tGravityAcc.std.Y.avg
  
  tGravityAcc.std.Z.avg
  
  tBodyAccJerk.mean.X.avg
  
  tBodyAccJerk.mean.Y.avg
  
  tBodyAccJerk.mean.Z.avg
  
  tBodyAccJerk.std.X.avg
  
  tBodyAccJerk.std.Y.avg
  
  tBodyAccJerk.std.Z.avg
  
  tBodyGyro.mean.X.avg
  
  
  tBodyGyro.mean.Y.avg
  
  tBodyGyro.mean.Z.avg
  
  tBodyGyro.std.X.avg
  
  tBodyGyro.std.Y.avg
  
  tBodyGyro.std.Z.avg
  
  
  tBodyGyroJerk.mean.X.avg
  
  tBodyGyroJerk.mean.Y.avg
  
  tBodyGyroJerk.mean.Z.avg
  
  tBodyGyroJerk.std.X.avg
  
  tBodyGyroJerk.std.Y.avg
  
  tBodyGyroJerk.std.Z.avg
  
  tBodyAccMag.mean.avg
  
  tBodyAccMag.std.avg
  
  tGravityAccMag.mean.avg
  
  tGravityAccMag.std.avg
  
  tBodyAccJerkMag.mean.avg
  
  tBodyAccJerkMag.std.avg
  
  tBodyGyroMag.mean.avg
  
  tBodyGyroMag.std.avg
  
  tBodyGyroJerkMag.mean.avg
  
  tBodyGyroJerkMag.std.avg
  
  fBodyAcc.mean.X.avg
  
  fBodyAcc.mean.Y.avg
  
  fBodyAcc.mean.Z.avg
  
  fBodyAcc.std.X.avg
  
  fBodyAcc.std.Y.avg
  
  fBodyAcc.std.Z.avg
  
  fBodyAccJerk.mean.X.avg
  
  fBodyAccJerk.mean.Y.avg
  
  fBodyAccJerk.mean.Z.avg
  
  fBodyAccJerk.std.X.avg
  
  fBodyAccJerk.std.Y.avg
  
  fBodyAccJerk.std.Z.avg
  
  fBodyGyro.mean.X.avg
  
  fBodyGyro.mean.Y.avg
  
  fBodyGyro.mean.Z.avg
  
  fBodyGyro.std.X.avg
  
  fBodyGyro.std.Y.avg
  
  fBodyGyro.std.Z.avg
  
  fBodyAccMag.mean.avg
  
  fBodyAccMag.std.avg
  
  fBodyBodyAccJerkMag.mean.avg
  
  fBodyBodyAccJerkMag.std.avg
  
  fBodyBodyGyroMag.mean.avg
  
  fBodyBodyGyroMag.std.avg
  
  fBodyBodyGyroJerkMag.mean.avg
  
  fBodyBodyGyroJerkMag.std.avg

#see features_info.txt for help clarifying output data
