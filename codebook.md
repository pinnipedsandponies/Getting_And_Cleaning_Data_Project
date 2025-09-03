Project Code Book

This project looks at the mean and standard deviation of various activities measurements collected as part of the UC Irvine’s Machine Learning’s Human Activity Recognition Using Smartphones study.
The run_analysis.R code processes the raw data sets to isolate just the mean and standard deviations.

The raw date is available from the UC Irvine Machine Learning Repository here: https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones

Dataset Information: 

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living  while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Notes on raw data measurements and units: 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

- Features are normalized and bounded within [-1,1].
 
- dataset information obtained from UC Irvine repo page, 2012 Reyes-Ortiz et al. 


Dataset analysis and Project Tidy Data:

The raw data was processed using the run_analysis.R script provided in this repository. 
This script does not include downloading the data into your working directory. You must download it separately first or already have it in your working directory. It also requires the dpylr package to be installed in your library. 

This script will:

 Create vector objects for the various raw data sets included in the UC Irvine raw data file.
	  These objects are the raw measurements on both axises and the subject, activity, and measurement 		labels. 

 Merge the relevant data sets into one.
	  The X-axis measurements and labels are merged, the Y-axis measurements and labels are merged, 	then both are merged into one raw dataset.

  Extract the measurements for mean and standard deviation for each subject/activity.
	  The mean and standard deviation for each activity is extracted, by study subject, 
	  and stored in a new vector.

 Updates the activity and variable names to make them more understandable.
	  The activity labels are applied to make the data more understandable, and the variable names are
	   updated for more clarity.

  Creates and writes a separate tidy data set. 
  	A new data table is created with the subsetted raw data with the updated labeling, and written as a txt 
  	file called ProjectTidyData