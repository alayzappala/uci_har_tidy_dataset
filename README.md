# run_analysis.R


### Introduction

This script is a part of the Course Project for "Getting and Cleaning Data" Course.

This script merges two parts of a separated data set: test data and training data of measures from sensor devices.

The script extracts only the measurements on the mean and standard deviation for each measurement.


### Working flow of the script

1. get the TEST measures from txt file

2. get the names of the columns from file "features.txt"

3. add the names of the columns

4. subset the mean and the standard deviation for each test measurement

5. add the row with the identifier of the subject who carried the experiment

6. get the activity labels from a file "y_test.txt"

7. change the numeric values to readable factor values for the activity value column

8. compose the final test data frame


9. Repeats steps from 1 to 8 for the TRAIN measures as with TEST measures
  

10. merges the TRAIN and the TEST measures in one data frame

11. orders the data set by id_subject and activity

12. writes a file with the merged tidy data set

###About the data that the script merges

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Attribute Information

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

### Data Source

You can get the entire data set and its description in:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
