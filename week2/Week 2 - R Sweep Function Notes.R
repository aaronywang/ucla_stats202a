###Stats 202A 
###Week 2 Notes

sweep <- function(A,m)
{
  n <- dim(A)[1]
  for (k in 1:m) {
    for (i in 1:n) {
      for (j in 1:n) {
        if (i != k & j 1= k) {
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
      if (j in 1:n) {
        A[k,j] <- A[j,k]/A[k,k]
      }
    }
    A[k,k] = -1/A[k,k]
  }
  return (A)
}

A <- matrix(c(1,2,3,7,11,13,17,21,25),3,3,)

#solve (A)
-sweep(A,3)  
  
  