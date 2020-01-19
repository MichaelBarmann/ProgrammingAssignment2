##This script contains two functions, makeCacheMatrix() and cacheSolve(),
#which are described below:


## makeCacheMatrix() takes a matrix as its argument.
#A makeCacheMatrix object has an inverse (of its argument),
#as well as setter and getter methods for the argument and its inverse.
#It returns a list of all the setter and getter functions
makeCacheMatrix <- function(x = matrix()) {
  
  inv_x <- NULL
  set <- function(y) {
    x <<- y
    inv_x <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setInv <- function(val){
    inv_x <<- val
  } 
  getInv <- function() {
    m
  } 
  
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}




##cacheSolve takes a makeCacheMatrix() object as its argument
##cacheSolve returns the inverse of the argument it is passed.
#It first checks to see if the inverse is stored in the cache.
#If it isn't, it uses solve() to obtain the inverse. 

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInv(m)
  m
}



