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
