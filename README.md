# Getting_And_Cleaning_Data_Project
Getting and Cleaning Data Course Final Project

This repository contains the final project results of the cleaning data course project. 
The aim of this project was to take the raw data from UC Irvine Machine Learning Repository's Human Activity Recognition Using Smartphones data and tidy it to produce a data set with the mean and standard deviation measurements for each activity. The links to the data can be found in the Code Book.

In this repo, in addition to this file, you will find:

- The Code Book explaining the data and the process involved in creating the tidy data set
- run_analysis.R code that processes and cleans the raw data sets
- ProjectTidyData.txt file containing the tidy data set produced.

Notes about run_analysis.R:

  This script does not include downloading the data into your working directory. You must download it separately first or already have it in your working directory. 
  This script requires the dpylr package to be installed in your library. 

  run_analysis.R will perform the following:
    It will create vector objects for the various raw data sets included in the UC Irvine raw data file.
    Then it will merge the relevant data sets into one.
    From there it will extract the measurements for mean and standard deviation for each subject/activity.
    It then updates the activity and variable names to make them more understandable.
    Finally it creates and writes a separate tidy data set. 
