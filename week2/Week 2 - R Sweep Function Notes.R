###Stats 202A 
###Week 2 Notes
# Tuesday 2016-09-27

#Create a 3x3 matrix for testing
A <- matrix(c(1,2,3,7,11,13,17,21,25),nrow=3,ncol=3)

solve(A)

#define sweep function
sweep <- function(A,m)
{
  n <- dim(A)[1]
  for (k in 1:m) {
    for (i in 1:n) {
      for (j in 1:n) {
        if (i != k & j != k) {
          A[i,j] <- A[i,j]-A[i,k]/A[k,k]
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
        A[k,j] <- A[j,k]/A[k,k]
      }
    }
    A[k,k] = -1/A[k,k]
  }
  return (A)
}



#solve (A)
-sweep(A,3)  

###Thursday 2019-09-29
##Gauss Jordan Elimination
#A -> |A|

#pseudo code
det <- 1

for (k in 1:n) {
  det <- det * A[k,k]
  A <- swep[k] * A #A is an nxn matrix
}


gaussJordan <- function(a,m) {
  n = dim(A)[1]
  B <- cbind(A,diag(rep(1,n)))
  for (k in 1:m) {
    a <- B[k,k]
    for (j in 1:(n*2)) {
      B[k,j] <- B[k,j]/a
    }
    for (i in 1:n) {
      if (i != k) {
        a <- B[i,k]
        for (j in 1:(n*2)) {
          B[i,j] <- B[i,j]-B[k,j]*a  
        }
      }
    }  
  }
  return (B)
}
}
  



  
  