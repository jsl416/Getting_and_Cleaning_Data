Getting_and_Cleaning_Data
===========================

Readme Files for the Course project of "Getting and Cleaning Data"  

This readme file shows two parts   
1) How the R script called "run_analysis.R" is working  
2) the codebook for the final data set created.  

# 1) About "run_analysis.R" script  
This purpose of the "run_analysis.R" is to create a tidy set directed by the Course project guidelines.  
(1) It downloads the Samsung Galaxy data into your working directory and merges the training and the test sets to create one data.  
(2) Then it extracts the mean and standard deviation for each measurement with feature.txt.  
(3) It uses descriptive activity names(w/ activity_labels.txt) to name the activities in the data set at the column number 562.  
(4) It appropriately labels the data set with descriptive variable names with feature.txt variables.  
(5) Fianllay, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
  
Since there are 30 subjects who took parts in the experiment and 6 activities, the total number of rows of the final dataset is 180, with column names from "feature.txt".  
  
The details of r syntax can be found in the r script as comments.  
  
# 2) Codebook for the Final Dataset

To see how these values are measured, please refer to "features_info.txt" in 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" file.  
  
68 Variables with 180 values(Except "Subject", "Acitivity_Name", all are AVERAGE values of that particular variables!)  
1. Subject : One who has performed the experiment  
2. Activity_Name : What activity Subject has performed  
                  * LAYING  
                  * SITTING  
                  * STANDING  
                  * WALKING  
                  * WALKING_DOWNSTAIRS  
                  * WALKING_UPSTAIRS  
3. Ave_tBodyAcc-mean()-X  
4. Ave_tBodyAcc-mean()-Y  
5. Ave_tBodyAcc-mean()-Z  
6. Ave_tBodyAcc-std()-X  
7. Ave_tBodyAcc-std()-Y  
8. Ave_tBodyAcc-std()-Z  
9. Ave_tGravityAcc-mean()-X  
10. Ave_tGravityAcc-mean()-Y  
11. Ave_tGravityAcc-mean()-Z  
12. Ave_tGravityAcc-std()-X  
13. Ave_tGravityAcc-std()-Y  
14. Ave_tGravityAcc-std()-Z  
15. Ave_tBodyAccJerk-mean()-X  
16. Ave_tBodyAccJerk-mean()-Y  
17. Ave_tBodyAccJerk-mean()-Z  
18. Ave_tBodyAccJerk-std()-X  
19. Ave_tBodyAccJerk-std()-Y  
20. Ave_tBodyAccJerk-std()-Z  
21. Ave_tBodyGyro-mean()-X  
22. Ave_tBodyGyro-mean()-Y  
23. Ave_tBodyGyro-mean()-Z  
24. Ave_tBodyGyro-std()-X  
25. Ave_tBodyGyro-std()-Y  
26. Ave_tBodyGyro-std()-Z  
27. Ave_tBodyGyroJerk-mean()-X  
28. Ave_tBodyGyroJerk-mean()-Y  
29. Ave_tBodyGyroJerk-mean()-Z  
30. Ave_tBodyGyroJerk-std()-X  
31. Ave_tBodyGyroJerk-std()-Y  
32. Ave_tBodyGyroJerk-std()-Z  
33. Ave_tBodyAccMag-mean()  
34. Ave_tBodyAccMag-std()  
35. Ave_tGravityAccMag-mean()  
36. Ave_tGravityAccMag-std()  
37. Ave_tBodyAccJerkMag-mean()  
38. Ave_tBodyAccJerkMag-std()  
39. Ave_tBodyGyroMag-mean()  
40. Ave_tBodyGyroMag-std()  
41. Ave_tBodyGyroJerkMag-mean()  
42. Ave_tBodyGyroJerkMag-std()  
43. Ave_fBodyAcc-mean()-X  
44. Ave_fBodyAcc-mean()-Y  
45. Ave_fBodyAcc-mean()-Z  
46. Ave_fBodyAcc-std()-X  
47. Ave_fBodyAcc-std()-Y  
48. Ave_fBodyAcc-std()-Z  
49. Ave_fBodyAccJerk-mean()-X  
50. Ave_fBodyAccJerk-mean()-Y  
51. Ave_fBodyAccJerk-mean()-Z  
52. Ave_fBodyAccJerk-std()-X  
53. Ave_fBodyAccJerk-std()-Y  
54. Ave_fBodyAccJerk-std()-Z  
55. Ave_fBodyGyro-mean()-X  
56. Ave_fBodyGyro-mean()-Y  
57. Ave_fBodyGyro-mean()-Z  
58. Ave_fBodyGyro-std()-X  
59. Ave_fBodyGyro-std()-Y  
60. Ave_fBodyGyro-std()-Z  
61. Ave_fBodyAccMag-mean()  
62. Ave_fBodyAccMag-std()  
63. Ave_fBodyAccJerkMag-mean()  
64. Ave_fBodyAccJerkMag-std()  
65. Ave_fBodyGyroMag-mean()  
66. Ave_fBodyGyroMag-std()  
67. Ave_fBodyGyroJerkMag-mean()  
68. Ave_fBodyGyroJerkMag-std()  
