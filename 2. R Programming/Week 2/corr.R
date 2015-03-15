corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  classes=c("factor","numeric","numeric","integer")
  csv<-NULL
  correlations<-numeric(0)
  
  files<-list.files(directory)
  
  for (i in 1:length(files)){
    #compute completed cases
      nobs=0  
      fname<-sprintf("%s//%s", directory, files[i])   ## set filename
      csv<-read.csv(fname,colClasses=classes)  ## read file
      completed_obs<-complete.cases(csv)
      for(j in 1:length(completed_obs)){
        if (completed_obs[j]){
          nobs = nobs + 1
        }
      }
  
      ## nobs holds the number of complete observations for file fname
     if(nobs > threshold) {
       NAcsv<-na.omit(csv)
       correlate<-cor(NAcsv$nitrate,NAcsv$sulfate)
       correlations<-append(correlations,correlate)
       
     }
  }
    

  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  correlations
}
