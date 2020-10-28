rankall <- function(diagnosis = character(), num){
  setwd("C:/Users/soura/Documents/Data_Science_Spec_Coursera/Data-science-Coursera/Week 4")
  
  ##load the csv file and do not set them as categorical vectors and
  ## replace white space and not available as NA
  outcome <- read.csv("outcome-of-care-measures.csv",stringsAsFactors = FALSE, na.strings = c("Not Available","") )
  

  states <- unique(outcome$State)

  
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
  
  #further reducing the dataframe to suit our needs
  if (diagnosis == "heart attack") {
    df <- df[,c(1, 2, 3)]
  }else if (diagnosis == "heart failure") {
    df <- df[,c(1, 2, 4)]
    
  }else{df <- df[,c(1, 2, 5)]}
  

  #sorting by diagnosis and then sorting by hospital name
  df <- df[order(df[,colnames(df) == diagnosis],df$Hospital.Name),]
  
  #create an empty vector for adding hospital names
  hospital_name_num <-c()
  
  #splitting as per states
  best_state <- split.data.frame(df, df$State)
  
  for (variable in states[1:length(states)]) {
    #dummy variable to store a state information in one
    best_in_state <- best_state[[variable]]
    
    best_in_state_complete <- best_in_state[complete.cases(best_in_state),]
    ##checking if the rank exceeds number of hospitals in state
    
    if (num > nrow(best_in_state)) {
      hospital_name_num <- append(hospital_name_num,as.character(NA))
    }else if (num == "best") {
      hospital_name_num <- append(hospital_name_num,best_in_state_complete$Hospital.Name[1])
    }else if (num == "worst") {
    
      hospital_name_num <- append(hospital_name_num, best_in_state_completes$Hospital.Name[nrow(best_in_state_complete)])
    } else {
      
      hospital_name_num <- append(hospital_name_num, best_in_state_complete$Hospital.Name[num])
    }
    #variable <- NULL
  }
  ranks <- data.frame(Hospital = hospital_name_num, State = states)
  ranks <- ranks[order(ranks$states),]
}