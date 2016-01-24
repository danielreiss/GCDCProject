==================================================================
Getting and Cleaning Data Course Project - CODEBOOK
==================================================================
Daniel Gersten Reiss
==================================================================
This codebook describes the 'dataset2upload.txt' file, which is produced by the un_analysis.R script.



Variables
==================================================================
- activity
	Factor with 6 levels
	Represents the activity that was recorded on the original experiment. Activities are: WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; LAYING 

- subject
	Factor with 30 levels
	Represents the volunteers which performed the activity. Volunteers are numbered from 1 to 30.

- variable
	Factor with 73 levels
	Represents the variable from the original dataset over which the average was taken. The 73 variables are the ones that were average or standard deviation values on the original dataset.

- var.average
	Numeric
	Represents the average value of the variable. Values were calculated by mean() function over the chosen variables grouped by activity and subject.