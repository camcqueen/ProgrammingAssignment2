## This function computers the inverse of a square matrix and places it into the cached. If the function has already been run, the previous results will be retrieved without processing the function again.

## This creates a holding area for the results of the inverted matrix. Initially, the matrix is set to null or empty. 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() m
        list(set = set, get = get
                    )
}


## After the cacheSolve program is run once, the results will be stored in teh CacheMatrix (created above). This will allow the inverse to be called multiple times without requiring R to reprocess the solve function.

cacheSolve <- function(x, ...) {
}
cacheSolve <- function(x) {
        m <- solve(x)
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        ## Searches if 'm' already has cached data. If yes, return 			stored data with a warning message "getting cached data"
        }
        data <- x$get()
        m <- solve(data)
        x$set(m)
        m
        ## If 'm' is null, run through the solve(x) function, return results, and store results to the cached matrix 'm'. If you rerun the cacheSolve again, the results will return without processing the function, and a warning of "getting cached data" will appear.
}