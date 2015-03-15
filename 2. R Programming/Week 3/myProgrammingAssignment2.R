
#
####NOT SUBMITTED  submit cachematrix.R for assignment
#
# Cache the Inverse of a Matrix
#
# rprog-12 - Assignment #2 - Craig Lewis
#
# makeCacheMatrix - Creates  a special matrix object that can cache its inverse
#
makeCacheMatrix <- function(x = numeric()) {
  
  Inv <- NULL                               ## Inv is the cached inverted matrix
  set <- function (y) {                     ## Set function; X is the matrix and Inv is NULL to start
    x <<- y
    Inv <<- NULL
    
  }
  get <- function ()x                       ## Return the matrix
  getinverse <- function (Inv)              ## Return the cached Inversion matrix
                                            ## Set the cached Inversion matrix
  setinverse <- function ginv(inverted) Inv << inverse
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}
#
# cacheSolve - Computes the inverse of the special matrix returned by CacheMatrix
#
cacheSolve {
  
}