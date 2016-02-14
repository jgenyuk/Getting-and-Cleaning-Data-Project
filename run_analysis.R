# read data files
setwd('~/UCI_HAR_Dataset')
test <- read.table("test/X_test.txt")
train <- read.table("train/X_train.txt")

# read subjects
test_subjects <- scan("test/subject_test.txt", what="integer")
train_subjects <- scan("train/subject_train.txt", what="integer")

#read activities and convert to meaningful names
test_act <- factor(scan("test/y_test.txt", what="integer"))
train_act <- factor(scan("train/y_train.txt", what="integer"))
act_labels <- read.table("activity_labels.txt", sep=" ")
levels(test_act) <- act_labels[,2]
levels(train_act) <- act_labels[,2]

# merge two data sets
data <- rbind(test,train)

# read column names
features <- read.table("features.txt",sep=" ")
features <- features[,2]
names(data) <- features

# select columns with mean and std
select_cols <- grep('mean\\(|std\\(', features)
data <- data[,select_cols]

# add activity names
act <- c(as.character(test_act), as.character(train_act))
data$activity <- act
subjects <- c(test_subjects, train_subjects)
data$subjects <- subjects

# reshape into a separate tidy data set

library(reshape2)
tidydata <- melt(data, id.vars=c("activity", "subjects"))
tidydata$mean <- with(tidydata,ave(value, as.factor(activity), as.factor(subjects), variable))
tidydata <- unique(tidydata[,c("activity","subjects", "variable","mean")])
HAR_data <- dcast(tidydata, subjects+activity ~ variable)




