complete <- function(id){
  library(plyr)
  library(readr)
  directory <- file.path("C:/Users/soura/Documents/Data_Science_Spec_Coursera/Data-science-Coursera/rprog_data_specdata/specdata")
  
  # compiling all csv files together
  my_files <- list.files(path= directory, pattern = "*.csv", full.names = TRUE)
  # sub_data <- ldply(my_files, read_csv)
  # #getting the monitor ids
  # sub_data_id <- sub_data[which(sub_data$ID %in% id),]
  
  #create an empty data frame
  dat <- data.frame()
  # create empty vectors I_D and nopbs
  I_D <- c()
  nobs <- c()
  
  for(val in 1:length(id)){
    I_D[val] <- id[val]
    nobs[val] <- sum(complete.cases(read.csv(my_files[id[val]])))
  }
  dat <- data.frame(I_D, nobs)
  dat
  
  
}