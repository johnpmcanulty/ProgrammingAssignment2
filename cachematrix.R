## The following R functions create a cached matrix for efficiency
## in processing data by using environment variables manipulated
## using lexical scoping.

## The makeCacheMatrix R function creates a matrix object
## in the environment for efficient processing via other functions, 
## such as the cacheSolve R function below.

makeCacheMatrix <- function(x = matrix()) {

}


## The cacheSolve R function returns a matrix that is the inverse of the one
## set as an environment variable using lexical scoping by the makeCacheMatrix
# R function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
