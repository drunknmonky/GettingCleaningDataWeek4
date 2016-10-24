
library(reshape2)

# 1. Merges the training and the test sets to create one data set.

# read data into data frames
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x <- rbind(X_train, X_test)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")

# determine which columns contain "mean()" or "std()"
mean_std <- grepl("mean\\(\\)", names(features)) | grepl("std\\(\\)", names(features))

x <- x[,mean_std]

names(x) <- features[mean_std, 2]
names(x) <- gsub("\\(|\\)", "", names(x))

# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
y[,1] = activity[y[,1], 2]
names(y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names.
names(subject) <- "subject"
cleaned <- cbind(subject, y, x)

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# create the tidy data set
melted <- melt(cleaned, id=c("subject","activity"))
tidy <- dcast(melted, subject+activity ~ variable, mean)

# write the tidy data set to a file
#write.csv(tidy, "tidy.csv", row.names=FALSE)
write.table(tidy, "tidy.txt", row.names=FALSE)

