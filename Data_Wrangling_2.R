library(dplyr)
library(tidyr)

#Load the data in RStudio
titanic_data <- read.csv("titanic_original.csv")

# Change missing values in embarked to "S"
titanic_data$embarked <- as.factor(gsub("^$", "S", titanic_data$embarked))

#Calculate the mean of the Age column and use that value to populate the missing values
mean_age <- mean(titanic_data$age, na.rm=TRUE)
titanic_data$age[is.na(titanic_data$age)] <- mean_age

#Fill empty slots in boat column with "NA" 
titanic_data$boat[titanic_data$boat == ""]<- NA

#Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise
titanic_data$has_cabin_number <- ifelse(titanic_data$cabin == "", 0, 1)

#Save cleaned-up data as CSV
write.csv(titanic_data, "titanic_clean.csv")

