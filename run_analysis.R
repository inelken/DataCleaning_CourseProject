# the variable basedir contains the path to the data.
# The organization of the files is assumed to be from the unzipped file.
basedir<-"UCI HAR Dataset"
# 1. Read variable names and keep only means and stds
var.names<-read.table(file.path(basedir,"features.txt"))
var.touse<-seq(1,561)
var.touse<-var.touse[grepl(c("mean()"),var.names[,2],fixed=T) | grepl(c("std()"),var.names[,2])]
# Human readable activity names
activity.names<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
# 2. Read train dataset, keep only relevant vars, give them informative names.
# Then append subject and activity
traindir<-"train"
train<-read.table(file.path(basedir,traindir,"X_train.txt"))
train<-train[,var.touse]
names(train)<-var.names[var.touse,2]
sub_train=read.table(file.path(basedir,traindir,"subject_train.txt"))
a_train=read.table(file.path(basedir,traindir,"Y_train.txt"))
train$Subject<-sub_train[,1]
train$Activity<-factor(activity.names[a_train[,1]])
# 3. Read test dataset, keep only relevant vars, give them informative names.
# Then append subject and activity
testdir<-"test"
test<-read.table(file.path(basedir,testdir,"X_test.txt"))
test<-test[,var.touse]
names(test)<-var.names[var.touse,2]
sub_test=read.table(file.path(basedir,testdir,"subject_test.txt"))
a_test=read.table(file.path(basedir,testdir,"Y_test.txt"))
test$Subject<-sub_test[,1]
test$Activity<-factor(activity.names[a_test[,1]])
# tested whether there are any missing values:
# any(colSums(is.na(train))>0)
# any(colSums(is.na(test))>0)
# 4. Merge by subject - this is simply the union of the two data frames since
# subjects are disjoint
database<-rbind(train,test)
database<-database[order(database$Subject),]
database$Subject<-factor(database$Subject)
database<-database[,c(67,68, seq(1:66))]
# 5. Creates a second, independent tidy data set with the average of each
# variable for each activity and each subject.
md <- melt(database, id.vars=c("Subject","Activity"))
x <- ddply(md, .(Subject, Activity,variable), summarize, mean.val=mean(value))
m.subj.act<-dcast(x, Subject+Activity~variable)
# Write new data frame to text file.
# read command:
# mmm<-read.table("meanSubjAct.txt",sep=",",header=T)
write.table(m.subj.act,"meanSubjAct.txt",sep=",")
