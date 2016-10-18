###Stats 202A 
###Week 2 Notes
# Tuesday 2016-10-04

# Gauss Jordan Vec
GaussJordanVec <- function(A,m)
{
  n <- dim(A)[1]
  B <- cbind(A,dag(rep(1,n)))
  for (k in 1:m) {
    B[k,] <- B[k,]/B[k,k]
    for (i in 1:n){
      if (i != k)
        B[i,] <- B[i,] = B[k,]*B[i,k]
    }
  }
}

#Linear Regression
n <- 100
p <- 5
X <- matrix(rnorm(n*p),nrow = n)
beta <- matrix(1:p, nrow = p)

Y <- X%*%beta+rnorm(n)
lm(Y~X)

Z <- cbind(rep(1,n),X,Y)
A <- t(Z)%*%Z
S <- mySweep(A,p+1)
beta <- Z[1:p+1, p+z]

#Linear Regression Model
n = 100
x1 = rnorm(n)
x2 = rnorm(n)
y = x1 + 2*x2 + rnorm(n)
lm (Y ~ x1 + x2)

#Create data and plot to LM
A = data.frame(v1 = x1, v2 = x2, v3 = y)
lm(v3 ~ v1 + v2, data = A)

#Example
data(trees)
m <- lm(Volume ~ Height + Girth, data = lt)
summary(m)



