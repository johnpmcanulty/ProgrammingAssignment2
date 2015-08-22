## The following R functions create a cached matrix for efficiency
## in processing data by using environment variables manipulated
## using lexical scoping.

## The makeCacheMatrix R function creates a matrix object
## in the environment for efficient processing via other functions, 
## such as the cacheSolve R function below.
## Sample invocation: amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        ## Reset matrix in  global environment
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) {
        ## Save matrix in global environment
        m <<- inverse
    }
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## The cacheSolve R function returns a matrix that is the inverse of the one
## set as an environment variable using lexical scoping by the makeCacheMatrix
# R function.  We pass in a variable containing the list of functions from makeCacheMatrix.
## Sample invocation using variable created above: cacheSolve(amatrix)

cacheSolve <- function(x, ...) {
    ## Get inverse matrix, if it exists, from global environment        
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")     
        ## If we already have the inverse cached, return in
        return(m)
    }
    ## We don't have it in cache, so Inverse data matrix and set to global environment
    data <- x$get()      
    ## Compute inverse of square matrix
    m <- solve(data)        
    x$setInverse(m)
    ## Return matrix that is the inverse of 'x'
    return(m)        
}
