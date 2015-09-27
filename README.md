Introduction
------------
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. What follows first are my notes on the original data.

About the raw data
------------------
The features (561 of them) are labels are found in the features.txt and measurements for the same found in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.
The same holds for the training set.

About the dataset and script
----------------------------
The script called run_analysis.R which will merge the test and training sets together. 

The steps for this script
-------------------------
The UCI HAR Dataset must be extracted and is available in directory “UCI HAR Dataset”.
Merging the data from test and train folders by combining those using rbind and cbind function in R.
Selecting only columns from the data set whch has information about measurements on the mean and standard deviation for each measurement. 
Labels are substitutes and proper column names assigned.
Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Codebook
------------------
The codebook contains information about the variables and observations on the dataset.


