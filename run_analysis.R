info <- function(df) {
    name <- deparse(substitute(df))
    print(sprintf("dim   %4d %4d  %s", dim(df)[1], dim(df)[2], name))
    print(sprintf("names %4s %4s  %s", names(df)[1], names(df)[length(df)], name))
    print("---------------------------------")
}
library(dplyr)
test_dir  <- "test/"
train_dir <- "train/"

# KEY OFF EXISTENCE OF X_test TO LOAD FILES ONLY ONCE
if (!exists("X_test")) {
    print("read.table(X_test.txt)")
    X_test <- read.table(paste(test_dir, "X_test.txt", sep=""))
    y_test <- read.table(paste(test_dir, "y_test.txt", sep=""))
    subject_test <- read.table(paste(test_dir, "subject_test.txt", sep=""))
    print("read.table(X_train.txt)")
    X_train <- read.table(paste(train_dir, "X_train.txt", sep=""))
    y_train <- read.table(paste(train_dir, "y_train.txt", sep=""))
    subject_train <- read.table(paste(train_dir, "subject_train.txt", sep=""))
    activity_labels <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
}
if (!exists("X_test")) {
    print("read.table(test/X_test.txt)")
    X_test <- read.table("test/X_test.txt")
    y_test <- read.table("test/y_test.txt")
    subject_test <- read.table("test/subject_test.txt")
    print("read.table(test/X_train.txt)")
    X_train <- read.table("train/X_train.txt")
    y_train <- read.table("train/y_train.txt")
    subject_train <- read.table("train/subject_train.txt")
    activity_labels <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
}
#OUTPUT INFO ON FILES
info(X_test)
info(y_test)
info(subject_test)
info(X_train)
info(y_train)
info(subject_train)
info(activity_labels)
info(features)

#LOOK AT STRUCTURE OF FEATURE NAMES TO FIND THOSE FOR MEAN AND STANDARD DEVIATION
subfeature$V0 <- as.character(features$V2)
for(i in 1:length(features$V2)) {
    subfeature$V1[i] <- unlist(strsplit(as.character(features$V2[i]), "[-]"))[1]
    subfeature$V2[i] <- unlist(strsplit(as.character(features$V2[i]), "[-]"))[2]
    subfeature$V3[i] <- unlist(strsplit(as.character(features$V2[i]), "[-]"))[3]
    subfeature$V4[i] <- unlist(strsplit(as.character(features$V2[i]), "[-]"))[4]
}
subfeature$use[] <- FALSE
subfeature$use[subfeature$V2 == "mean()"] <- TRUE
subfeature$use[subfeature$V2 == "std()"] <- TRUE
print("subfeature$V1")
print(unique(subfeature$V1))
print("subfeature$V2")
print(unique(subfeature$V2))
print("subfeature$V3")
print(unique(subfeature$V3))
print("subfeature$V4")
print(unique(subfeature$V4))

# BIND ACTIVITY # AND SUBJECTS TO TRAINING AND TEST DATA
Z_train <- cbind(X_train, y_train, subject_train)
Z_test  <- cbind(X_test,  y_test,  subject_test)

# 1) MERGE TRAINING AND TEST DATA TOGETHER
X_all <- rbind(Z_train, Z_test)

# 4) USE DESCRIPTIVE NAMES IN FEATURES DATAFRAME AND ADD ACT AND SUBJECT
# (need to do this before step 2 of extracting mean and std deviation)
colnames(X_all) <- c(as.character(features$V2), "Act", "Subject")
colnames(activity_labels) <- c("V1", "Activity")

# 2) EXTRACT ONLY THE MEAN AND STD DEVIATION VARIABLES
tidy1 <- X_all[,subfeature$use == TRUE]
print(dim(tidy1))

# 3) USE DESCRIPTIVE ACTIVITY NAMES BY MERGING WITH ACTIVITY LABELS
tidy2 <- merge(tidy1, activity_labels, by.x="Act", by.y="V1")
print("writing tidy_data_set.txt")
write.table(tidy2, "tidy_data_set.txt", row.name=FALSE)
print(dim(tidy2))

# 5) CREATE SECOND DATA SET WITH AVERAGES GROUPED BY SUBJECT AND ACTIVITY
tidy3 <- group_by(tidy2, Subject, Activity)
print(dim(tidy3))
tidy  <- summarise_each(tidy3, funs(mean))
print("writing tidy_data_set_averages.txt")
write.table(tidy, "tidy_data_set_averages.txt", row.name=FALSE)
print(dim(tidy))
