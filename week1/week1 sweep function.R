############################################################# 
## Stat 202A - Homework 1
## Author: Aaron Wang 704556662
## Date: 2016-10-03
## Description: This script implements the sweep operator as
## well as Gauss-Jordan elimination in both plain and
## vectorized form
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


## ~~~~~~~~~~~~~~~~~~~~~ ##
## ~~~~~ Problem 1 ~~~~~ ##
## ~~~~~~~~~~~~~~~~~~~~~ ##  


#################################
## Function 1: Sweep operation ##
#################################

#Test 3x3 Matrix with built in solve() function
A <- matrix(c(1,2,3,7,11,13,17,21,25),3,3)

mySweep <- function(A, m){
  
  # Perform a SWEEP operation on the square matrix A with the 
  # pivot element A[m,m].
  # 
  # A: a square matrix.
  # m: the pivot element is A[m, m].
  # Returns a swept matrix.
  
  #######################################
  ## FILL IN THE BODY OF THIS FUNCTION ##
  #######################################
  n <- dim(A)[1]
  for (k in 1:m) {
    for (i in 1:n) {
      for (j in 1:n) {
        if (i != k & j != k) {
          A[i,j] <- A[i,j]-(A[i,k]*A[k,j])/A[k,k]
        }
      }
    }
    for (i in 1:n) {
      if (i != k) {
        A[i,k] <- A[i,k]/A[k,k]
      }
    }
    for (j in 1:n) {
      if (j != k) {
        A[k,j] <- A[k,j]/A[k,k]
      }
    }
    A[k,k] = -1/A[k,k]
  }
  ## The output is the modified matrix A
  return(A)
}


#########################################################
## Function 2: Use sweep operation to find determinant ##
#########################################################

myDet <- function(A){

  ## Use the sweep operator to find the determinant of 
  ## the square matrix A
  #
  # A: a square matrix.
  # Returns the determinant of A.
  
  #######################################
  ## FILL IN THE BODY OF THIS FUNCTION ##
  #######################################
  n <- dim(A)[1]
  Det <- 1
  for (k in 1:n) {
    for (i in 1:n) {
      for (j in 1:n) {
        if (i != k & j != k) {
          A[i,j] <- A[i,j]-(A[i,k]*A[k,j])/A[k,k]
        }
      }
    }
    for (i in 1:n) {
      if (i != k) {
        A[i,k] <- A[i,k]/A[k,k]
      }
    }
    for (j in 1:n) {
      if (j != k) {
        A[k,j] <- A[k,j]/A[k,k]
      }
    }
    Det <- Det * A[k,k]
    A[k,k] = -1/A[k,k]
  }
  ## Return the determinant (a real number, aka "numeric" class)
  return(Det)
}


## ~~~~~~~~~~~~~~~~~~~~~ ##
## ~~~~~ Problem 2 ~~~~~ ##
## ~~~~~~~~~~~~~~~~~~~~~ ##  

#####################################################
## Function 3: Elementwise version of Gauss Jordan ##
#####################################################


myGaussJordan <- function(A, m){
  
  # Perform Gauss Jordan elimination on A.
  # 
  # A: a square matrix.
  # m: Number of diagonal elements to loop through.

  #######################################
  ## FILL IN THE BODY OF THIS FUNCTION ##
  #######################################
  n = dim(A)[1]
  B <- cbind(A,diag(rep(1,n)))
  for (k in 1:m) {
    x <- B[k,k]
    for (j in 1:(n*2)) {
      if (j != k) {
        B[k,j] <- B[k,j]/x
      }
    }
    for (i in 1:n) {
      if (i != k) {
        y <- B[i,k]
        for (j in 1:(n*2)) {
          B[i,j] <- B[i,j]-B[k,j]*y
        }
      }
    }
  }
  return(B)
}


####################################################
## Function 4: Vectorized version of Gauss Jordan ##
####################################################

myGaussJordanVec <- function(A, m){
  
  # Perform Gauss Jordan elimination on A.
  # 
  # A: a square matrix.
  # m: Number of diagonal elements to loop through.

  #######################################
  ## FILL IN THE BODY OF THIS FUNCTION ##
  #######################################
  n = dim(A)[1]
  B <- cbind(A,diag(rep(1,n)))
  for (k in 1:m) {
    x <- B[k,k]
    B[k,] <- B[k,]/x
    for (i in 1:n) {
      if (i != k) {
        y <- B[i,k]
        B[i,] <- B[i,]-B[k,]*y
      }
    }
  }
  return(B)
}


########################################################
## Optional examples (comment out before submitting!) ##
########################################################


