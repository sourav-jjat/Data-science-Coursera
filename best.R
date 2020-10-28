best <- function(st = character(), diagnosis = character()){
  # set working directory to the folder
  # setwd("C:/Users/soura/Documents/Data_Science_Spec_Coursera/Data-science-Coursera/Week 4")
  
  ##load the csv file and do not set them as categorical vectors and
  ## replace white space and not available as NA
  outcome <- read.csv(file.path("C:/Users/soura/Documents/Data_Science_Spec_Coursera/Data-science-Coursera/Week 4/outcome-of-care-measures.csv"),stringsAsFactors = FALSE, na.strings = c("Not Available","") )
  
  ##check if state is correct
  states <- unique(outcome$State)
  if (st%in%states == FALSE) {
    stop("invalid state")
  }
  
  ##check if conditions match
  conditions <-c("heart attack","heart failure","pneumonia")
  if (diagnosis%in%conditions == FALSE) {
    stop("invalid outcome")
  }
  
  ##extracting columns from outcome csv file
  df <- outcome[, c(2,7,11,17,23)]
  
  #change the column names
  names(df)[3] <- "heart attack"
  names(df)[4] <- "heart failure"
  names(df)[5] <- "pneumonia"
  
  #sorting by diagnosis and then sorting by hospital name
  df <- df[order(df[,colnames(df) == diagnosis],df$Hospital.Name),]
  
  #splitting as per states
  best_state <- split.data.frame(df, df$State)
  best_state <- best_state[[st]]
  best_state$Hospital.Name[1]

  
  
}