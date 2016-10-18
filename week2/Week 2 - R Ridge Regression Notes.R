#Linear Ridge Regression
ridge <- function(x, y, lambda)
{
  n <- dim(x)[1]
  p <- dim(x)[2]
  z <- cbind(rep(1,n),x,y)
  a <- t(z)%*%z
  d <- diag(rep(lambda,p+2))
  d[p+2,p+2] <- 0
  d[1,1] <- 0
  a <- a+d
  s <- mySweep(A,p+1) #Same sweep function as the one we coded
  beta = s[1,p+1,p+2]
  return(beta)
}

