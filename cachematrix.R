## Matrix inversion is usually a costly computation. This library enables the
## caching of this calculation through a special matrix wrapper.

## Creates a matrix wrapper that can cache its inverse.
##
## mtrx: an invertable matrix
makeCacheMatrix <- function(x = matrix()) {
}

## This function computes the inverse of the matrix contained within the matrix
## wrapper. If the inverse has already been calculated (and the matrix has not
## changed), then cacheSolve() will retrieve the inverse from the cache.
##
## cm: a cache matrix object
cacheSolve <- function(cm, ...) {
}
