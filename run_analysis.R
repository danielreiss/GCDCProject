#run_analysis.R

#Unzip downloaded dataset that must be on working directory according to project instructions
unzip("HARDataset.zip")

library(dplyr)

#Read and clean feature information
features <- readLines("./UCI HAR Dataset/features.txt")
features <- strsplit(features, " ")
features <- data.frame(matrix(unlist(features), nrow=561, byrow=TRUE))
features <- tbl_df(features)
names(features) <- c("code","variable")
features$variable <- gsub(pattern = "\\(\\)", replacement = "", x = features$variable)
features$variable <- gsub(pattern = "-", replacement = ".", x = features$variable)
features$variable <- gsub(pattern = "([0-9]),([0-9])", replacement = "\\1to\\2", x = features$variable)
features$variable <- gsub(pattern ="([A-Z]),([A-Z])", ignore.case = FALSE, replacement = "\\1n\\2", x = features$variable)
features$variable <- gsub(pattern ="([A-Z]),([0-9])", replacement = "\\1\\2", x = features$variable)

#Read activity labels
activity.labels <- read.table(file = "./UCI HAR Dataset/activity_labels.txt"
						, sep=" "
						, header = FALSE
						, col.names=c("code","activity")
						, colClasses=c("factor","factor")
					)
activity.labels <- tbl_df(activity.labels)



#Read training and test data; its labels and subjects
training <- read.fwf ("./UCI HAR Dataset/train/X_train.txt"
				, widths = rep(16,561)
				, col.names = features$variable
				, strip.white = TRUE
				, as.is = TRUE
				, colClasses = "double")
training <- tbl_df(training)

test <- read.fwf ("./UCI HAR Dataset/test/X_test.txt"
				, widths = rep(16,561)
				, col.names = features$variable
				, strip.white = TRUE
				, as.is = TRUE
				, colClasses = "double")
test <- tbl_df(test)

training.labels <- readLines("./UCI HAR Dataset/train/y_train.txt")
test.labels <- readLines("./UCI HAR Dataset/test/y_test.txt")

training.subject <- readLines("./UCI HAR Dataset/train/subject_train.txt")
test.subject <- readLines("./UCI HAR Dataset/test/subject_test.txt")

# Consolidate training and test data, labels and subjects
training <- mutate(training
				, activity.lab = factor(training.labels)
				, set = factor("training")
				, subject = factor(training.subject)
		       )
test <- mutate(test
			, activity.lab = factor(test.labels)
			, set = factor("test")
			, subject = factor(test.subject)
		   )

# 1. Merges the training and the test sets to create one data set.

activity.data <- rbind(training, test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

activity.data.subset <- select(activity.data
						, set
						, subject
						, activity.lab
						, contains("mean")
						, contains("std")
						, -contains("meanFreq")
					)


# 3. Uses descriptive activity names to name the activities in the data set

activity.data.subset <- inner_join(	x = activity.data.subset
						, y = activity.labels
						, by = c("activity.lab" = "code") 
						, copy = FALSE
					     )
activity.data.subset <- select (	activity.data.subset
						, set
						, subject
						, activity
						, tBodyAcc.mean.X:fBodyBodyGyroJerkMag.std
					 )	# The objective is to reorder columns

# 4. Appropriately labels the data set with descriptive variable names.
	# This has already been done when creating the data frames "training" and "test" with col.names = features$variable as a parameter.
	# No further action is required.
	# The variables that were named by me were: "activity", indicating the activity, 
	# and "set", indicating wheter is training or test data.

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(tidyr)

activity.data.avg <- activity.data.subset %>% 
				group_by(activity, subject) %>% 
				summarise_each(funs(mean) ,-set)%>% 
				gather(variable, var.average, -activity, -subject) %>%
				arrange(activity,subject,variable)

#WRITE PROJECT'S UPLOADED ANSWER
write.table(activity.data.avg, "dataset2upload.txt", row.name=FALSE)
