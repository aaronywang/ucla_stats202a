"""
Stat 202A - Homework 1
Author: 
Date : 
Description: This script implements the sweep operator as
well as Gauss-Jordan elimination in both plain and
vectorized form

INSTRUCTIONS: Please fill in the missing lines of code
only where specified. Do not change function names, 
function inputs or outputs. You can add examples at the
end of the script to double-check your work, but MAKE 
SURE TO COMMENT OUT ALL OF YOUR EXAMPLES BEFORE SUBMITTING.

Also, whenever I refer to matrix in this python code,
I am basically referring to an array (np.array)

Very important: Do not change the working directory in your code. 
If you do, I will be unable to grade your 
work since Python will attempt to change my working directory
to one that does not exist.
"""

## Import numpy so we can use mathematical objects
## If you need other libraries go ahead and load them as well
import numpy as np


""" Problem 1 """
A = np.array([[1,2,3],[7,11,13],[17,21,25]], dtype = float)

A = A.transpose()

A[0,1]

n,c = A.shape
n
   
""" Function 1: Sweep operation """
def mySweep(A, m):
    """
    Perform a SWEEP operation on A with the pivot element A[m,m].
    
    A: a square matrix.
    m: the pivot element is A[m, m].
    : Returns a swept matrix. Original matrix is unchanged.
    """
    
    ## Copy matrix A into B so that A is unchangeed.
    B = np.copy(A)   
    
    """ Fill in the body of this function! """    
    n,c = A.shape
    for k in range(m):
        for i in range(n):
            for j in range(n):
                if i != k and j != k:
                    B[i,j] = B[i,j]-((B[i,k]*B[k,j])/B[k,k])
        for i in range(n):
            if (i != k):
                B[i,k] = B[i,k]/B[k,k]
        for j in range(n):
            if (j != k):
                B[k,j] = B[k,j]/B[k,k]
        B[k,k] = -1/B[k,k]
    """ Returns swept matrix B. Output should be an array / np.array / 
    numpy.ndarray, basically an array of some sort"""
    return B
    
print(-mySweep(A,3))
    
""" Function 2: Use sweep operation to find determinant """
    
def myDet(A):
    """
    Compute the determinant of A using the sweep operation.
    
    A: a square matrix.
    : Returns the determinant of A.
    """
    
    ## Copy matrix A into B so that A is unchangeed.
    B = np.copy(A)    
    
    
    """ Fill in the body of this function! """
    
    
    """ Returns the determinant of A. This should be a number, 
     e.g. of class numpy.float """
    return(det)
    
    
""" Problem 2 """


""" Function 3: Elementwise version of Gauss Jordan """   
def myGaussJordan(A, m):
    
   """ Perform Gauss Jordan elimination on A.
   A: a square matrix.
   m: Number of diagonal elements to loop through.
   """
  
   """FILL IN THE BODY OF THIS FUNCTION """
    
    
    
    
    
    
    
   """ Function returns the matrix (aka array) B """
   return B    
    
    
""" Function 4: Vectorized version of Gauss Jordan """    
def myGaussJordanVec(A, m):
    
   """ Perform Gauss Jordan elimination on A.
   A: a square matrix.
   m: Number of diagonal elements to loop through.
   """
  
   """FILL IN THE BODY OF THIS FUNCTION """
    
    
    
    
    
    
    
   """ Function returns the matrix (aka array) B """
   return B    


""" Optional examples (comment out before submitting!) """
## A = np.array([[1, 2, 3], [7, 11, 13], [17, 21, 23]], dtype = float).T    