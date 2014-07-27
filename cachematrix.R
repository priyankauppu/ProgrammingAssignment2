## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        temp <- NULL   ## creates an object called 'temp' with an undefined value.

        set <- function(y) {  ## set() function sets a new value to the 'x' matrix, overwriting 
                x <<- y                               ## the value in the parent environment of set() with the new 
                temp <<- NULL                            ## matrix passed to the makeCacheMatrix() function. It also 
        }                                             ## overwrites the value of 'temp' in the parent environment of set()
                                                      ## with an undefined value.
        
        get <- function() x                           ## get() function prints the value of 'x', i.e. the matrix passed 
                                                      ## to the makeCacheMatrix() function.

        setinverse <- function(inverse) i <<- inverse ## setinverse() function sets a new value to 'i' in the parent 
                                                      ##  environment. The new value is the result of solve() over the 
                                                      ## matrix passed to the makeCacheMatrix() function.
        
        getinverse <- function() i                    ## getinverse() function prints the value of 'i', the result of
                                                      ## solve() over the matrix passed to the makeCacheMatrix() function.

        list(set = set, get = get,                    
             setinverse = setinverse,                 ## grouping them into a single object (a list).
             getinverse = getinverse)
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                i <- x$getinverse()                           ## First, cacheSolve() function reads the 'i' object,
        if(!is.null(i)) {                             ## if 'i' was defined previously (i.e. is not NULL)
                message("getting cached data")        ## cacheSolve() gets the cached 'i' value (i.e. the
                return(i)                             ## previously defined inverse of 'x') and prints it.
        }
        data <- x$get()                               ## If 'i' is undefined (i.e. is NULL)
        i <- solve(data, ...)                         ## cacheSolve() calculates the inverse of the  matrix passed to the makeCacheMatrix() function
        x$setinverse(i)                              

}

