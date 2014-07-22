DataCleaning_CourseProject
==========================

# The script run_analysis.R assumes that the data is located in a folder in the working directory as created by unzipping the data file given in the course website. To use another folder, change the variable basedir (first code line in the script).
# The script performs the following operations (list numbering corresponds to section numbers in the file):
# 1. Prepapre human-readable variable names and activity names:
# The variable names are read from the feature.txt file provided as part of the database, and a string matching is performed to identify all relevant variables - those with mean() and std() in their names.
# Activity names are coded by hand, according to the activity_label.txt file
# 2. Read and prepare the training data set:
# The relevant columns are extracted, human-readable columns names are assigned, and then the subject and activity files are read and added as columns named "Subject" and "Activity".
# 3. Same thing, for the test data set
# 4. Merge train and test datasets, rearrange columns so that Subject is first column and Activity is second column
# 5. Create the second tidy dataset:
# I melted the dataset by subject and activity, then used ddply to summarize and dcast to generate the final dataset.
