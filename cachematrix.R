## overall discription: this couple of functions required to caches an inverse of matrix. 


## 1 this function builds 4 functions and returns them within a list to the parent environment. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## 2 this function retrieves matrix inverse from makeCacheMatrix or calculates the inverse and return it. 
#it checks if m is NULL.
#If m is NULL than function calculates matrix inverse
#if m isn't NULL than function retrieves the value from makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m) 
  m
}
