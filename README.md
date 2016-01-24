==================================================================
Getting and Cleaning Data Course Project
==================================================================
Daniel Gersten Reiss
==================================================================

The provided R script cope with instructions for the Getting and Cleaning Data Course Project. The aim is to perform tasks cleaning the original data source (tasks are described below).

The project uses the Human Activity Recognition Using Smartphones Dataset (Anguita et al., 2012), available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The run_analysis.R script performs the tasks on the downloaded zip file, which must be on the working directory. The script's output is a text file (dataset2upload.txt), containing the average of each mean and standard deviation variables on the original dataset, grouped by activity and subject.



Original dataset descripion
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Script tasks
==================================================================
1. Reads original data from downloaded zip file
2. Merges the training and the test sets
3. Extracts the measurements on the mean and standard deviation for each measurement
4. Names activities in the dataset with descriptive activity names
5. Labels the data set with descriptive variable names
6. Exports data as a text file



Output dataset description
==================================================================
The output dataset is named 'dataset2upload.txt'. The description of the dataset's variables are at 'CodeBook.md'.



References
==================================================================
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
