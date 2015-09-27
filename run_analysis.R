

library(plyr)
library(reshape2)
library(xlsx)

####### reading train data set ######

xtrain<-read.csv("./UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE)

ytrain<-read.csv("./UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)

subjecttrain<-read.csv("./UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE)


######## reading test dataset ########

xtest<-read.csv("./UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE)

ytest<-read.csv("./UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE)

subjecttest<-read.csv("./UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE)


xdata<-rbind(xtrain,xtest)
ydata<-rbind(ytrain,ytest)
subjectdata<-rbind(subjecttrain,subjecttest)


##### Merging the traing and test data#####

Alldata<-cbind(subjectdata,ydata,xdata)


############  reading Variable (feature) data #####
featuredata<-read.csv("./UCI HAR Dataset/features.txt",sep="",header=FALSE)

#######selectining only mean and standard deviation columns from the merged data#####
featuredata[,2] <- as.character(featuredata[,2])
featureswanted<-grep("mean|std",featuredata[,2])

Alldata_x<-Alldata[,-c(1,2)]

selected_data<-Alldata_x[,featureswanted]

selected_data<-cbind(Alldata[1:2],selected_data)



############  reading Activity lables data #####
activity<-read.csv("./UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)

########### descriptive activity names to name the activities in the data set #####
selected_data[,2]<-activity[selected_data[,2],2]

######## labels the data set with descriptive variable names ####

names(selected_data)<-c("Subject","Activity",featuredata[featureswanted,2])


#### Independent tidy data set with the average of each variable for each activity and each subject####
tidydata<-melt(selected_data,id=c("Subject","Activity"))

avgdata<-dcast(tidydata,Subject+Activity~variable,mean)
head(avgdata,4)
dim(avgdata)

write.table(avgdata,file="./prjavg.txt",row.name=FALSE,sep="\t",quote=FALSE)

#########################################
