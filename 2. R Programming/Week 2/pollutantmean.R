#
# Programming Assignment #1
#
pollutantmean <-function(directory, pollutant, id=1:332){
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  classes=c("factor","numeric","numeric","integer")
  sum_readings <-0L
  num_observations <- 0L
  
  #columns: Date, sulfate, nitrate, ID
  for(i in 1:length(id) ) {
    fname<-sprintf("%s//%03d.csv", directory, id[i])   ## set filename
    csv<-read.csv(fname,colClasses=classes)  ## read file
    ##print(fname)
    Vcsv<-csv[pollutant]   ## column for pollutant
    NA_csv<-is.na(Vcsv[pollutant])  ## vector of pollutants that are not NA
    vals<-Vcsv[!NA_csv]  ## column of non-NA readings for pollutant
    
    j=1
    while(j < length(vals)) {
 ##   for (j in 1:length(vals)){
      num_observations = num_observations + 1
      sum_readings = sum_readings + vals[j]
      j=j+1
    }
   ## cat(fname, sum_readings, num_observations,"\n")
  }
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  sum_readings / num_observations
  

}
