## The following functions provide the ability to perform two distinct yet related actions - 
# 1. makeCacheMatrix creates a matrix capable of storing its inverse in cached form
# 2. cacheSolve provides the inverse of a matrix by solving it the first time, 
#    or pulling from memory if it has been solved before

## Start with creation of a new matrix
makeCacheMatrix <- function(x = matrix()) {

inverse = NULL

#define functions to 'set' and 'get' values within the matrix itself.
set = function(y) 
        {
                x<-y
                inverse<- NULL
        }

get <- function() x

# Define 'inverse' as a variable that can retain its state over multiple functions
setinverse <- function(solve) 
  inverse <<- solve

getinverse <- function() inverse

list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The function below will 'solve' the matrix (find its inverse)
# or if it's available, pull the solution from cache

cacheSolve <- function(x=matrix(), ...) {
        solve <- x$getinverse()

# If the given matrix's inverse exists in cached memory, pull that
        if(!is.null(solve)) {
            message("getting cached data")
        return(solve)
        }

data <- x$get()

# If the matrix's inverse is NOT in cached memory, calculate the inverse
solve <- solve(data, ...)

# Save the inverse of the matrix to cached memory
x$setinverse(solve)

# Return the inverse of the matrix
solve
}