
dateDownloaded<-date()

##append test/train for activity
test_activity = read.table("./test/y_test.txt", 
               sep="", 
               header=FALSE,
               col.names=c("activity"), 
               fill=FALSE, 
               strip.white=TRUE)

train_activity = read.table("./train/y_train.txt", 
                           sep="", 
                           header=FALSE,
                           col.names=c("activity"), 
                           fill=FALSE, 
                           strip.white=TRUE)
full_activity<-rbind(train_activity, test_activity)


##append test/train for subject
test_subject = read.table("./test/subject_test.txt", 
                           sep="", 
                           header=FALSE,
                           col.names=c("subject"), 
                           fill=FALSE, 
                           strip.white=TRUE)

train_subject = read.table("./train/subject_train.txt", 
                            sep="", 
                            header=FALSE,
                            col.names=c("subject"), 
                            fill=FALSE, 
                            strip.white=TRUE)
full_subject<-rbind(train_subject, test_subject)

##append test/train datasets
X_train <- read.table("./train/X_train.txt", quote="\"")
X_test <- read.table("./test/X_test.txt", quote="\"")
full_data<-rbind(X_train, X_test)

##append activity to end of dataset
full_data$Activity<-full_activity

##append subject to left of dataset
Subject<-full_subject
full_data<-cbind(Subject, full_data)

##subset out columns
a_subjecttBodyAcc<-subset(full_data [,1:7])
b_tGravityAcc<-subset(full_data [42:47])
c_tBodyAccJerk<-subset(full_data [82:87])
d_tBodyGyro<-subset(full_data [122:127])
e_tBodyGyroJerk<-subset(full_data [162:167])
f_tBodyAccMag<-subset(full_data [202:203])
g_tGravityAccMag<-subset(full_data [215:216])
h_tBodyAccJerkMag<-subset(full_data [228:229])
i_tBodyGryoMag<-subset(full_data [241:242])
j_tBodyGyroJerkMag<-subset(full_data [254:255])
k_fBodyAcc<-subset(full_data [267:272])
l_fBodyAccJerk<-subset(full_data [346:351])
m_fBodyGyro<-subset(full_data [425:430])
n_fBodyAccMag<-subset(full_data [504:505])
o_fBodyBodyAccJerkMag<-subset(full_data [517:518])
p_fBodyBodyGyroMag<-subset(full_data [530:531])
q_fBodyBodyGyroJerkMag<-subset(full_data [543:544])


##cbind appropriate columns together
tidy<-cbind(a_subjecttBodyAcc, b_tGravityAcc,c_tBodyAccJerk, d_tBodyGyro, e_tBodyGyroJerk, 
             f_tBodyAccMag, g_tGravityAccMag, h_tBodyAccJerkMag, i_tBodyGryoMag, j_tBodyGyroJerkMag,
             k_fBodyAcc, l_fBodyAccJerk, m_fBodyGyro, n_fBodyAccMag, o_fBodyBodyAccJerkMag, 
             p_fBodyBodyGyroMag, q_fBodyBodyGyroJerkMag, full_activity)

##create header row
tidy<-rename(tidy, c("subject"="Subject", 
                        "V1"="tBodyAcc_MeanX", 
                        "V2"="tBodyAcc_MeanY",
                        "V3"="tBodyAcc_MeanZ",
                        "V4"="tBodyAcc_StdX",
                        "V5"="tBodyAcc_StdY",
                        "V6"="tBodyAcc_StdZ",
                        "V41"="tGravityAcc_MeanX",
                        "V42"="tGravityAcc_MeanY",
                        "V43"="tGravityAcc_MeanZ",
                        "V44"="tGravityAcc_StdX",
                        "V45"="tGravityAcc_StdY",
                        "V46"="tGravityAcc_StdZ",
                        "V81"="tBodyAccJerk_MeanX",
                        "V82"="tBodyAccJerk_MeanY",
                        "V83"="tBodyAccJerk_MeanZ",
                        "V84"="tBodyAccJerk_StdX",
                        "V85"="tBodyAccJerk_StdY",
                        "V86"="tBodyAccJerk_StdZ",
                        "V121"="tBodyGyro_MeanX",
                        "V122"="tBodyGyro_MeanY",
                        "V123"="tBodyGyro_MeanZ",
                        "V124"="tBodyGyro_StdX",
                        "V125"="tBodyGyro_StdY",
                        "V126"="tBodyGyro_StdZ",
                        "V161"="tBodyGyroJerk_MeanX",
                        "V162"="tBodyGyroJerk_MeanY",
                        "V163"="tBodyGyroJerk_MeanZ",
                        "V164"="tBodyGyroJerk_StdX",
                        "V165"="tBodyGyroJerk_StdY",
                        "V166"="tBodyGyroJerk_StdZ",
                        "V201"="tBodyAccMag_Mean",
                        "V202"="tBodyAccMag_Std",
                        "V214"="tGravityAccMag_Mean",
                        "V215"="tGravityAccMag_Std",
                        "V227"="tBodyAccJerkMag_Mean",
                        "V228"="tBodyAccJerkMag_Std",
                        "V240"="tBodyGyroMag_Mean",
                        "V241"="tBodyGyroMag_Std",
                        "V253"="tBodyGyroJerkMag_Mean",
                        "V254"="tBodyGyroJerkMag_Std",
                        "V266"="fBodyAcc_MeanX",
                        "V267"="fBodyAcc_MeanY",
                        "V268"="fBodyAcc_MeanZ",
                        "V269"="fBodyAcc_StdX",
                        "V270"="fBodyAcc_StdY",
                        "V271"="fBodyAcc_StdZ",
                        "V345"="fBodyAccJerk_MeanX",
                        "V346"="fBodyAccJerk_MeanY",
                        "V347"="fBodyAccJerk_MeanZ",
                        "V348"="fBodyAccJerk_StdX",
                        "V349"="fBodyAccJerk_StdY",
                        "V350"="fBodyAccJerk_StdZ",
                        "V424"="fBodyGyro_MeanX",
                        "V425"="fBodyGyro_MeanY",
                        "V426"="fBodyGyro_MeanZ",
                        "V427"="fBodyGyro_StdX",
                        "V428"="fBodyGyro_StdY",
                        "V429"="fBodyGyro_StdZ",
                        "V503"="fBodyAccMag_Mean",
                        "V504"="fBodyAccMag_Std",
                        "V516"="fBodyAccJerkMag_Mean",
                        "V517"="fBodyAccJerkMag_Std",
                        "V529"="fBodyGyroMag_Mean",
                        "V530"="fBodyGyroMag_Std",
                        "V542"="fBodyGyroJerkMag_Mean",
                        "V543"="fBodyGyroJerkMag_Std",
                        "activity"="Activity"))

##factors for Activity
tidy$Activity<-as.factor(tidy$Activity)
tidy$Activity<-revalue(tidy$Activity, c("1"="Walking", "2"="Walking Upstairs", 
        "3"="Walking Downstairs", "4"="Sitting", "5"="Standing", "6"="Laying"))

##create new dataframe with averages, by subject and activity
tidyMeans<-aggregate(.~Subject+Activity, tidy, mean)

##Append date processed to tidyMeans dataset
##dateProcessed<-date()



##purge helper data
rm(Subject)
rm(X_test)
rm(X_train)
rm(a_subjecttBodyAcc)
rm(b_tGravityAcc)
rm(c_tBodyAccJerk)
rm(d_tBodyGyro)
rm(e_tBodyGyroJerk)
rm(f_tBodyAccMag)
rm(full_activity)
rm(full_data)
rm(full_subject)
rm(g_tGravityAccMag)
rm(h_tBodyAccJerkMag)
rm(i_tBodyGryoMag)
rm(j_tBodyGyroJerkMag)
rm(k_fBodyAcc)
rm(l_fBodyAccJerk)
rm(m_fBodyGyro)
rm(n_fBodyAccMag)
rm(o_fBodyBodyAccJerkMag)
rm(p_fBodyBodyGyroMag)
rm(q_fBodyBodyGyroJerkMag)
rm(test_activity)
rm(test_subject)
rm(train_activity)
rm(train_subject)

tidyMeans
