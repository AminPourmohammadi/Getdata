# Getdata

This repository hosts the files for the Coursera's Getting and Cleaning Data. These files include run_analysis.R, and codebook.txt that explains the variables. I explain what these files are in brief.

# run_analysis.R
I have put comments for different partitions of the code, so that it is clear what it is doing. Here I explain the code in more detail. To get the desired result change the setwd() line in line 5 of run_analysis.R, to your working directory, and then run the code.

1. First the code sets the working directory to the desired location (the default is 'c:\courses\clean.data' and then checks if the zip raw data file already exists in there. If not, it downloads it and unzips it. Then it reads activity labels, features, train data and test data into different data frames with correponsing names.
2. Then it selects which features' names, have the words 'mean' or 'std' in them, so that we can select just the data corresponding to those features. Using the indices of desired features we select the desired  columns of train and test data and then change those columns' names to respective feature names.
3. Then we using mapvalues() from plyr library (which we have loaded at the beginning of the code), we change the values of activity codes, from numbers to their descriptions. 
4. We merge all of train and test data into one data set with only the disired features and proper activity names and proper column names.
5. using melt() and dcast() from reshape2 library (that we have loaded in the beginning of the code, we produce the final desired data set and then we write it to a txt file.

# codebook.txt

This file explains what the variables of final produced dataset are, and what the variables used in the code are.
