test<-function(x){
  ## it is a test function showing that 
  ## the symbol "<<-" is give the value to
  ## a variance in global Environment instead of 
  ## current enviroment
  a<<-x^2
  ## give a value to a in global environment
  x 
}

makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

y<<-makeCacheMatrix(x)
cacheSolve <- function(x, ...) {
  
  m <- y$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- y$get()
  m <- solve(data, ...)
  y$setinverse(m)
  m
}