
README for run_analysis.r


This script creates the tidy data output for the Coursera Getting and Cleaning Data class project.

It uses files downloaded in the UCI HAR dataset as input.

The sequence of the steps is different from the project specs to minimize the number of steps needed, but still produces the required output.


The steps used in the script are as follows:

(1) Load dplyr package for use within the script.

(2) Load files from the test sub folder.

(3) Load files from the train sub folder.

(4) Load activity labels and column names from the main folder.

(5) Add column names to all files.

(6) Select the -mean and -std columns from the data files using grepl.
This results in 79 of the columns being selected.

(7) Combine files into one table using cbind and rbind.

(8) Replace activity names in combined table.

(9) Create final output using group_by and summarise_each

(10) Write final output to a file for uploading

 
The final output is a file of 180 rows (30 subjects x 6 activities) and 81 columns which meets the tidy data requirements.

 