corr <- function(threshold){
  library(plyr)
  library(readr)
  
  directory <- file.path("C:/Users/soura/Documents/Data_Science_Spec_Coursera/Data-science-Coursera/rprog_data_specdata/specdata")
  
  # compiling all csv files together
  my_files <- list.files(path= directory, pattern = "*.csv", full.names = TRUE)
  cr <- c()
  for (i in 1:length(my_files)) {
    if (complete(i)$nobs > threshold) {
      dat <- data.frame()
      dat <- read.csv(my_files[i])
      dat_complete<- dat[complete.cases(dat),]
      cr[i] <- cor(dat_complete[,2], dat_complete[,3])
    }
  }
    
  if (length(cr) == 0) {
    cr <- 0
    
  }
    cr[complete.cases(cr)]

} 