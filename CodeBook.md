<h1>Code Book</h1>
Data used in the analysis is from the Human Activity Recognition Using Smartphones Dataset.
The data can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


- 'features.txt': List of all features - 561 in total

- 'activity_labels.txt': Links the class labels with their activity name. 6 activities in total.

- 'train/X_train.txt': Training set. 10299 x 561 data frame.

- 'train/y_train.txt': Training labels. 10299 x 1 data frame with activity IDs

- 'test/X_test.txt': Test set. 2947 x 561 data frame.

- 'test/y_test.txt': Test labels. Vector of 2947 intgers. It relates the ID of the activity to the observation in X_test.txt

<h2>Steps performed in the analysis</h2>
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.