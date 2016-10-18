############################################################# 
## Stat 202A - Homework 2
## Author: 
## Date : 
## Description: This script implements ridge regression as 
## well as piecewise linear spline regression.
#############################################################

#############################################################
## INSTRUCTIONS: Please fill in the missing lines of code
## only where specified. Do not change function names, 
## function inputs or outputs. You can add examples at the
## end of the script (in the "Optional examples" section) to 
## double-check your work, but MAKE SURE TO COMMENT OUT ALL 
## OF YOUR EXAMPLES BEFORE SUBMITTING.
##
## Very important: Do not use the function "setwd" anywhere
## in your code. If you do, I will be unable to grade your 
## work since R will attempt to change my working directory
## to one that does not exist.
#############################################################

#################################
## Function 1: Sweep operation ##
#################################

mySweep <- function(A, m){
  
  # Perform a SWEEP operation on A with the pivot element A[m,m].
  # 
  # A: a square matrix.
  # m: the pivot element is A[m, m].
  # Returns a swept matrix.
  
  ## Leave this function as is unless you want to make it 
  ## more efficient!
  
  n <- nrow(A)
  
  for(k in 1:m){ 
    for(i in 1:n)     
      for(j in 1:n)   
        if(i != k  & j != k)     
          A[i,j] <- A[i,j] - A[i,k]*A[k,j]/A[k,k]    
        
        for(i in 1:n) 
          if(i != k) 
            A[i,k] <- A[i,k]/A[k,k]  
          
          for(j in 1:n) 
            if(j != k) 
              A[k,j] <- A[k,j]/A[k,k]
            
            A[k,k] <- - 1/A[k,k]
  }
  
  return(A)
  
}

##################################
## Function 2: Ridge regression ##
##################################

myRidge <- function(X, Y, lambda){
  
  # Perform ridge regression of Y on X.
  # 
  # X: a matrix of explanatory variables.
  # Y: a vector of dependent variables. Y can also be a 
  # matrix, as long as the function works.
  # lambda: regularization parameter (lambda >= 0)
  # Returns beta, the ridge regression solution.
  
  ##################################
  ## FILL IN THIS SECTION OF CODE ##
  ##################################
  
  n <- dim(X)[1]
  p <- dim(X)[2]
  z <- cbind(rep(1,n),X,Y)
  a <- t(z)%*%z
  d <- diag(rep(lambda,p+2))
  d[1,1] <- 0
  d[p+2,p+2] <- 0
  a <- a + d
  s <- mySweep(a,p+1) #Same sweep function as the one we coded
  beta_ridge = s[0:p+1,p+2]
  
  ## Function should output the vector beta_ridge, the 
  ## solution to the ridge regression problem. Beta_ridge
  ## should have p + 1 elements.
  return(beta_ridge)
  
}


##############################################################
## Optional function (not graded, just for testing myRidge) ##
##############################################################

testRidge <- function(){
  
  ## You can edit this function however you like (or not at all). 
  ## I just included it here to help you check if your ridge 
  ## function is working properly.
  
  ## Load up "trees" data
  my.data <- trees
  
  ## Let X be the Girth and Height of trees
  ## X needs to be a matrix
  X <- as.matrix(trees[,1:2])
  
  ## Let Y be the Volume of the tree
  Y <- trees$Volume
  
  ## Compare ridge solution when lambda = 0 to ordinary linear regression
  beta_ls    <- lm(Volume ~ Girth + Height, data = my.data)$coeff
  beta_ridge <- myRidge(X, Y, 0)
  
  if(sum(beta_ridge - beta_ls) <= 10^(-5))
    cat("Looks like myRidge is working properly when lambda = 0! \n")
  
  ## You can test around some more
  
}


####################################################
## Function 3: Piecewise linear spline regression ##
####################################################


mySpline <- function(x, Y, lambda, p = 100){
  
  # Perform spline regression of Y on x.
  # 
  # x: An n x 1 vector or n x 1 matrix of explanatory variables.
  # You can assume that 0 <= x_i <= 1 for i=1,...,n.
  # Y: An n x 1 vector of dependent variables. Y can also be an 
  # n x 1 matrix, as long as the function works.
  # lambda: regularization parameter (lambda >= 0)
  # p: Number of cuts to make to the x-axis.
  
  ##################################
  ## FILL IN THIS SECTION OF CODE ##
  ##################################
  n = 40
  #p = 100
  sigma = .1
  #lambda = 0.5
  
  x <- runif(n)
  x <- sort(x)
  Y <- x^2 + rnorm(n) * sigma #just choose a value for sigma and lambda
  X <- matrix(x, nrow = n)
  for (k in (1:(p-1)/p)) {
    X <- cbind(X,(x>k)*(x-k))
  }
  
  beta_spline <- myRidge(X,Y,lambda)
  y.hat <- cbind(rep(1,n),X)%*%beta_spline

  
  ## Function should return a list containing two elements:
  ## The first element of the list is the spline regression
  ## beta vector, which should be p + 1 dimensional (here, 
  ## p is the number of cuts we made to the x-axis).
  ## The second element is y.hat, the predicted Y values
  ## using the spline regression beta vector. This 
  ## can be a numeric vector or matrix.
  output <- list(beta_spline = beta_spline, predicted_y = y.hat)
  return(output)
}

#Plot the piecewise linear spline
plot(x,Y,ylim = c(-0.2,1.2),col = "red")
par(new = TRUE)
plot(x, y.hat, ylim = c(-0.2,1.2), type = "l", col = "green")


#Plot the y.hat~x for different lambda
lambda_test <- c(1,0.1,0.01)
color = c("green","blue","red")
plot(x,y,ylim = c(-0.2,1.2),col = "red")
for (i in 1:3) {
  beta <- myRidge(X,Y,lambda_test[i])
  y.hat <- cbind(rep(1,n),X)%*%beta
  par(new = TRUE)
  plot(x, y.hat, ylim = c(-0.2,1.2), type = "l", col = color[i])
}


########################################################
## Optional examples (comment out before submitting!) ##
########################################################


#######################################################################################
## Exploring the relationship between regularization and training and testing errors ##
#######################################################################################
n = 40
p = 100
sigma = .1
lambda = 0.5


x <- runif(n)
x <- sort(x)
Y <- x^2 + rnorm(n) * sigma #just choose a value for sigma and lambda
X <- matrix(x, nrow = n)
for (k in (1:(p-1)/p)) {
  X <- cbind(X,(x>k)*(x-k))
}

beta_spline <- myRidge(X,Y,lambda)
y.hat <- cbind(rep(1,n),X)%*%beta_spline


#Plot the piecewise linear spline
plot(x,Y,ylim = c(-0.2,1.2),col = "red")
par(new = TRUE)
plot(x, y.hat, ylim = c(-0.2,1.2), type = "l", col = "green")


#Plot the y.hat~x for different lambda
lambda_test <- c(1,0.1,0.01)
color = c("green","blue","red")
plot(x,y,ylim = c(-0.2,1.2),col = "red")
for (i in 1:3) {
  beta <- myRidge(X,Y,lambda_test[i])
  y.hat <- cbind(rep(1,n),X)%*%beta
  par(new = TRUE)
  plot(x, y.hat, ylim = c(-0.2,1.2), type = "l", col = color[i])
}



#Plot Training vs Testing Error

num_train <- round(n*0.5)
num_test <- round(n*0.5)
index = sample(1:n, size = n)
training_idx <- index[1:num_train]
testing_idx <- index[-(1:num_test)]
x_train=x[training_idx]
Y_train=Y[training_idx]
x_test=x[testing_idx]
Y_test=Y[testing_idx]

#Train
X_train <- matrix(x_train, nrow = num_training)
for (k in (1:(p-1)/p)) {
  X_train <- cbind(X_train,(x_train>k)*(x_train-k))
}

#Test
X_test <- matrix(x_test, nrow = num_test)
for (k in (1:(p-1)/p)) {
  X_test <- cbind(X_test,(x_test>k)*(x_test-k))
}


beta_test <- myRidge(X_test,Y_test,lambda)
y_test.hat <- cbind(rep(1,num_test),X_test)%*%beta_test

#Plot Errors for Training Data
lambda_test_train <- seq(0, by = 0.1, length =50)
train_err <- rep(0,length=50)
test_err <- rep(0,length=50)

for (i in 1:50) {
  beta <- myRidge(X_train,Y_train,lambda_test_train[i])
  y_train.hat <- cbind(rep(1,num_train),X_train)%*%beta
  train_err[i] = mean((Y_train-y_train.hat)^2)
  
  y_test.hat <- cbind(rep(1,num_test),X_test)%*%beta
  test_err[i] = mean((Y_test-y_test.hat)^2)
}

plot(lambda_test_train, test_err,type="l", col = "blue")
par(new = TRUE)
plot(lambda_test_train, train_err,type="l" ,col = "red")

