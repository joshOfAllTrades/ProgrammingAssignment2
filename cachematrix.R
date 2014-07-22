## Matrix inversion is usually a costly computation. This library enables the
## caching of this calculation through a special matrix wrapper.

## Creates a matrix wrapper that can cache its inverse.
##
## mtrx: an invertable matrix
makeCacheMatrix <- function(mtrx = matrix()) {
    # The cached inverse
    invMtrx <- NULL

    # Sets a new matrix
    set <- function(newMtrx) {
        mtrx <<- newMtrx
        # Invalidate the cache since we have a changed matrix
        invMtrx <<- NULL
    }

    # Returns the matrix we are operating on
    get <- function() { mtrx }

    # Retrieves the inverse matrix - the returned value may be freshly
    # calculated or may be returned from the cache
    getInv <- function(...) {
        # The inverse will be NULL if it hasn't been calculated
        if(is.null(invMtrx)) {
            message("Calculating inverse...")
            invMtrx <<- solve(mtrx, ...)
        } else {
            message("Getting cached inverse...")
        }

        invMtrx
    }

    # Return the closure's API
    list(set = set, get = get, getInv = getInv)
}

## This function computes the inverse of the matrix contained within the matrix
## wrapper. If the inverse has already been calculated (and the matrix has not
## changed), then cacheSolve() will retrieve the inverse from the cache.
##
## cm: a cache matrix object
cacheSolve <- function(cm, ...) {
    # Not much to do here since the closure takes care of itself...
    cm$getInv(...)
}
