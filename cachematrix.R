## The functions in this file provide functionality to compute the inverse of
## a matrix and cache the result of the operation so that the results are on
## hand so that if you need the value later you can retrieve it without needing
## to recalculate it. These functions provide an interface to do the above
## the user needed to worry about how to store the results and checking to see
## if the value has been computed previously.

## Wraps a matrix with the functionality to store the results of the matrix's
## inverse. Also when the value of the matrix is changed it clears the cached
## inverse so next time cacheSolve is called it will recalculate the inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Calculates the inverse of a matrix and cache the results so that if this
## function is called again on the same matrix it will return the cached value

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
	i <- x$getinverse()
	if (is.null(i)) {
		data <- x$get()
		i <- solve(data)
		x$setinverse(i)
	}
	i	
}
