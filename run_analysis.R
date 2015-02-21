##  run_analysis.r
##  script for course project
##  created 2/18/2015

## load dplyr library
library(dplyr)

## load test files
setwd("C:/Users/Rich/Documents/UCI HAR Dataset/test/")
tstdat <- read.table("X_test.txt")
tstsub <- read.table("subject_test.txt")
tstact <- read.table("y_test.txt")

## load train files
setwd("C:/Users/Rich/Documents/UCI HAR Dataset/train/")
trndat <- read.table("X_train.txt")
trnsub <- read.table("subject_train.txt")
trnact <- read.table("y_train.txt")

## load other files
setwd("C:/Users/Rich/Documents/UCI HAR Dataset/")
lblact <- read.table("activity_labels.txt")
lbldat <- read.table("features.txt")

## add column names
colnames(tstdat) <- lbldat$V2
colnames(trndat) <- lbldat$V2
colnames(tstact) <- c("Activity")
colnames(trnact) <- c("Activity")
colnames(tstsub) <- c("Subject")
colnames(trnsub) <- c("Subject")

## select mean and std columns from test and train tables
tstdat <- tstdat[,grepl("-mean|-std",colnames(tstdat))]
trndat <- trndat[,grepl("-mean|-std",colnames(trndat))]

## combine tables into one table
tstcmb <- cbind(tstsub, tstact, tstdat)
trncmb <- cbind(trnsub, trnact, trndat)
comb <- rbind(tstcmb, trncmb)

## replace activity numbers with activity names
for (i in 1:nrow(comb)) {
  for (j in 1:nrow(lblact)) {
    if (comb$Activity[i] == lblact$V1[j])
    {comb$Activity[i] <- as.character(lblact$V2[j]) } 
  }
}

## create tidy summary file grouped by subject and activity
tidyd <- comb
tidyd <- tidyd %>% group_by(Subject, Activity) %>%
  summarise_each(funs(mean))

## write final output to file for upload
write.table(tidyd, file="tidydata.txt", row.name=FALSE)
