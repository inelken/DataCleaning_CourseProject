DataCleaning_CourseProject
==========================
### Description
The instructions for the project are in https://class.coursera.org/getdata-005/human_grading/view/courses/972582/assessments/3/submissions. 
The script run_analysis.R assumes that the data is located in a folder as created by unzipping the data file given in the course website. The name of this folder is given in the variable basedir (first code line in the script). By changing this variable, the location of the input database can be changed
#### The script performs the following operations (list numbering corresponds to section numbers in the file):
1. Prepare human-readable variable names and activity names:
The variable names are read from the feature.txt file provided as part of the database, and a string matching is performed to identify all relevant variables - those with mean() and std() in their names.
Activity names are coded by hand, according to the activity_label.txt file
2. Read and prepare the training data set:
The relevant columns are extracted, human-readable columns names are assigned, and then the subject and activity files are read and added as columns named "Subject" and "Activity".
3. Same thing, for the test data set
4. Merge train and test datasets, rearrange columns so that Subject is first column and Activity is second column
5. Create the second tidy dataset:
I melted the dataset by subject and activity, then used ddply to summarize and dcast to generate the final dataset.

#### The output of the script 
The final dataset is saved in the file meanSubjAct.txt in the working directory.
####To read the dataset into the R workspace, use:
mmm<-read.table("meanSubjAct.txt",sep=",",header=T)
