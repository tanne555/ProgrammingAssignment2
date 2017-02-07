# This function serves as a container for a matrix object that can
# cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) inverse <<- inv
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse, getinverse = getinverse)
}

# This function computes the inverse of a matrix container object
# created by makeCacheMatrix. If the inverse has already been
# computed, it retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
  inverse <- x$getinverse
  if(!is.null(inverse)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
