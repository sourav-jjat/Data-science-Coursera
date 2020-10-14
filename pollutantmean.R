pollutantmean <- function(pollutant, id){
 
  directory <- file.path("C:/Users/soura/Documents/Data_Science_Spec_Coursera/Data-science-Coursera/rprog_data_specdata/specdata")
  
  # compiling all csv files together
  my_files <- list.files(path= directory, pattern = "*.csv", full.names = TRUE)
  sub_data <- ldply(my_files, read_csv)
  #getting the monitor ids
  sub_data_id <- sub_data[which(sub_data$ID %in% id),]
  
  # choose type of pollutant
  if(pollutant == "sulfate"){
    mean(sub_data_id$sulfate, na.rm= TRUE)
  }
  else if(pollutant == "nitrate"){
    mean(sub_data_id$nitrate, na.rm= TRUE)
    
  }
  
  
  
  
  
}
