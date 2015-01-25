---
title: "README"
author: "Keith"
date: "Sunday, January 25, 2015"
output: html_document
---  

#README for Getting and Cleaning Data
##Course Project  

###Included Files
The folling files are included in this GitHub Repo:  
**run_analysis.R** - This script uses the "Human Activity Recognition Using Smartphones Dataset, Version 1.0", as provided by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto; Smartlab - Non Linear Complex Systems Laboratory.  Ths output of the script is a tidy data set that summarizes many variables provided in the raw data set.  
**tidyData.txt** - The tidy data table, as output by run_analysis.R, with 180 observations.  The data represents observations from 30 participants performing 6 seperate tasks (30*6=180).  See the included CodeBook.Rmd file for descriptions of variables.  
**CodeBook.Rmd** - The description of the tidyData table, as well as all included variables.  

###Explanation of run_analysis.R
This is the primary script, designed to take the raw data files (provided by Smartlab), combine them, calculate sensor averages, then output a tidy data set of all variables.  

**Steps in script:**  
-*This script requires the plyr package*  
-Read in raw Training and Testing smartphone data  
-Reassign activity numerical factors to useful string factors  
-Combine tables of Subject IDs, activity factors, and sensor data into one table, each for Training and Testing data  
-Coming Training and Testing data into one table  
-Summarize data into a tidy data table, by computing mean values of each column, grouped by Subject ID and Activity.  


