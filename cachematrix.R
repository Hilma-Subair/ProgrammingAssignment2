## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {
  inve <- NULL
  set <- function(y) {
    x <<- y
    inve <<- NULL
 }
 get <- function() x
 setinverse <- function(inverse) inve <<- inverse
 getinverse <-  function() inve
 list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}
cacheinverse <- function(x, ...) {
  inve <- x$getinverse()
  if(!is.null(inve)) {
    message("getting cached data")
    return(inve)
  }
  matrix_to_be_inverted <- x$get()
  inve <- solve(matrix_to_be_inverted , ...)
  x$setinverse(inve)
  inve
}



