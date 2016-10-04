# -*- coding: utf-8 -*-
"""
Created on Tue Oct  4 11:16:48 2016

@author: aaron
"""

#Gauss Jordan
import numpy as np

def GaussJordan(A,m):
    n = shape[0]
    B = np.hstack((A,np.identity(n))) #figure out the equivalent to cbind in R and the shape
    for k in range(m):
        a = B[k,k]
        for (j in range(n*2)):
            B[k,j] = B[k,j]/a
        for (i in range (n)):
            if i != k:
                a = B[i,k]
                for (j in range(n*2)):
                    B[i,j] = B[i,j] - B[k,j]*a
        return B

def GaussJordanVec(A,m):
    n = shape[0]
    B = np.hstack((A,np.identity(n))) #figure out the equivalent to cbind in R and the shape
    for k in range(m):
        B[k,] = B[k,]/B[k,k]
        for (i in range (n)):
            if i != k:
                B[i,] = B[i,] - B[k,]*B[i,k]
    return B

  