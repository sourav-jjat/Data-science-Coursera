rankall <- function(diaganosis = character(), num){
  setwd("C:/Users/soura/Documents/Data_Science_Spec_Coursera/Data-science-Coursera/Week 4")
  
  ##load the csv file and do not set them as categorical vectors and
  ## replace white space and not available as NA
  outcome <- read.csv("outcome-of-care-measures.csv",stringsAsFactors = FALSE, na.strings = c("Not Available","") )
  
  ##check if state is correct
  states <- unique(outcome$State)
  if (s%in%states == FALSE) {
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
  
  
  
  ##subsetting data by column names for better understanding/visualizing
  #df <- df[,c("Hospital.Name", "State", diagnosis)]
  
  #sorting by diagnosis and then sorting by hospital name
  df <- df[order(df[,colnames(df) == diagnosis],df$Hospital.Name),]
  
  #create an empty vector for adding hospital names
  hospital_name_num <-c()
  
  
  #splitting as per states
  best_state <- split.data.frame(df, df$State)
  for (variable in states) {
    #dummy variable to store a state information in one
    best_in_state <- best_state[[variable]]
    if (num > nrow(best_state)) {
      append(hospital_name_num,NA)
    }
    if (num == "best") {
      append(hospital_name_num,best_in_state$Hospital.Name[1])
    }else if (num == "worst") {
      append(hospital_name_num, best_state$Hospital.Name[nrow(best_state) - sum(is.na(best_state[,colnames(best_state) == diagnosis]))])
    } else {
      append(hospital_name_num, best_state$Hospital.Name[num])
    }
    
    ranks <- data.frame(Hospital = hhospital_name_num, State = states)
    
  }
  
  
  #best_state <- best_state[[s]]
  
  

  
  

  
  
  
  
  
  
  
  
  
}