
#Save default WD and move into data set folder
originalWD <- getwd()
dataPath <- "UCI HAR Dataset"
setwd(dataPath)

#Get variable names for both Test and Train measurements
print("Reading Features")
features <- read.table("features.txt")

#Move into Train data folder
setwd("train")

#Get Subject IDs, Activity IDs, then Activity Data for Train data
print("Reading Training Data")
TrainSubjects <- read.table("subject_train.txt")
TrainActivityNum <- read.table("y_train.txt")
TrainData <- read.table("X_train.txt")

#Move into Test data folder
setwd("..")
setwd("test")

#Get Subject IDs, Activity IDs, then Activity Data for Test data
print("Reading Testing Data")
TestSubjects <- read.table("subject_test.txt")
TestActivityNum <- read.table("y_test.txt")
TestData <- read.table("X_test.txt")

#Reset WD
setwd(originalWD)

##PROJECT PART 3:
#Convert Activity ID numbers to useful names
TrainActivity <- as.character(factor(TrainActivityNum[,1], 
                                labels=c("Walk", 
                                         "Upstairs", 
                                         "Downstairs", 
                                         "Sit", 
                                         "Stand", 
                                         "Lay")))
TestActivity <- as.character(factor(TestActivityNum[,1], 
                                     labels=c("Walk", 
                                              "Upstairs", 
                                              "Downstairs", 
                                              "Sit", 
                                              "Stand", 
                                              "Lay")))  


#Combine Subject IDs, Activity IDs, Group Type and Activity Data for Train data
Train <- cbind(TrainSubjects, TrainActivity, "Train", TrainData)

#Combine Subject IDs, Activity IDs, Group Type and Activity Data for Test data
Test <- cbind(TestSubjects, TestActivity, "Test", TestData)

##PROJECT PART 4:
#Append descriptive variable names
names(Train) <- c("SubjectID", "Activity", "Group", as.character(features[,2]))
names(Test) <- c("SubjectID", "Activity", "Group", as.character(features[,2]))

##PROJECT PART 1:
#Merge Train and Test data into one data set
Data <- rbind(Train, Test)

##PROJECT PART 2:
#Find mean() and std() variables
meanORstd <- grepl("mean()", names(Data)) | grepl("std()", names(Data))
#Include SubjectID, Activity & Group
meanORstd[1:3] <- c(TRUE, TRUE, TRUE)
#ExtractData
subData <- Data[,meanORstd]


##PROJECT PART 5:
#Create tidy table of means
library(plyr)
sumData <- ddply(subData, .(SubjectID, Activity), numcolwise(mean))
write.table(sumData, "tidyData.txt", row.name=FALSE)









                         
                         
                         