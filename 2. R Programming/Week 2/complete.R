complete <- function(directory, id = 1:332) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  classes=c("factor","numeric","numeric","integer")
  nobs = 0
  nreadings = 0
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ##print ("## id nobs")
  pad = "##"
  df<-data.frame(pad=character(),readings=numeric(),ids=numeric(),nobs=numeric())
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  for(i in 1:length(id)){
    nreadings = nreadings + 1   ## how many readings
    monitor_id <-id[i] ## id
    fname<-sprintf("%s//%03d.csv", directory, monitor_id)   ## set filename
    csv<-read.csv(fname,colClasses=classes)  ## read file
    completed_obs<-complete.cases(csv)
    for(j in 1:length(completed_obs)){
      if (completed_obs[j]){
        nobs = nobs + 1
      }
    }
    df<-rbind(df,data.frame("##",nreadings,monitor_id,nobs))
 ##   df$pad="##"
##    df$readings[nreadings]<-nreadings
###    df$ids[nreadings]<-monitor_id
##    df$nobs[nreadings]<-nobs
   ## cat("##",nreadings,monitor_id, nobs,"\n")
        ##rbind()
    nobs=0 
  }
  df
}