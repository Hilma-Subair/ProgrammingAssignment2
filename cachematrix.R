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
  inverted_matrix <- x$get()
  inve <- solve(inverted_matrix , ...)
  x$setinverse(inve)
  inve
}
new_matrix <- makeCacheMatrix(matrix(4:7,2,2))
new_matrix$get()
new_matrix$getinverse()
cacheinverse(new_matrix)
new_matrix$set(matrix(c(5, 6, 8, 6,7,3,4,2,4),3,3,3))
new_matrix$get()
new_matrix$getinverse()
cacheinverse(new_matrix)
new_matrix$getinverse()

