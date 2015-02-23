# uci_har_tidy_dataset



### Introduction

This files are part of the Course Project for "Getting and Cleaning Data" Course

This script merges two parts of a separated data set: test data and training data of measures of the sensors devices that have been weared by 30 volunters. The script extracts only the measurements on the mean and standard deviation for each measurement.


### Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

 
### Working flow of the script

  For the TEST measures:

1. get the measures from txt file

2. get the names of the columns from file "features.txt"

3. add the names of the columns

4. subset the mean and the standard deviation for each test measurement

5. add the row with the identifier of the subject who carried the experiment

6. get the activity labels from a file "y_test.txt"

7. change the numeric values to readable factor values for the activity value column

8. compose the final test data frame


  For the TRAIN measures:

  Repeats steps from 1 to 8 as with Test measures
  

9. merges the train and the test measures in one data frame

10. orders the data set by id_subject and activity

11. writes a file with the merged tidy data set

### Data Source

You can get the entire data set and its description in:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
