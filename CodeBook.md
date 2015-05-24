#CodeBook.md

##combine_data.R

features = data from features.txt

activity_labels = data from activity_labels.txt

subject_test = data from test\subject_test.txt

y_test = data from test\y_test.txt

X_test = data from test\X_test.txt

subject_train = data from train\subject_train.txt

y_train = data from train\y_train.txt

X_train = data from train\X_train.txt

mean_filter = regex used to find mean() columns

std_filter = regex used to find std() columns

filter_list = combined list of regex filters to apply

pattern = the full regex pattern to match

column_filter_index = factor matrix to extract mean() and std() columns from X_test and X_train


X_test_filtered = filtered X_test data

X_train_filtered = filtered X_train data


combined_data = combined filtered data

columns = used to clean up column names for combined_data to ready it for output



##run_analysis.R

combined_data = imported data from run_analysis

aggdata = aggregated average for combined_data columns on subject and activity

columns = used to clean up column names for aggdata to ready it for output

#see features_info.txt for help clarifying output data
