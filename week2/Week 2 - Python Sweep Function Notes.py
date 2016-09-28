# -*- coding: utf-8 -*-
"""
Created on Tue Sep 27 11:45:25 2016

@author: aaron
"""

import numpy as np

def sweep(B,m):
#Make a copy of the B matrix to A as to not affect the original variable input    
    A = np.copy(B)
    n,c = A.shape
    for k in range(m):
        for i in range(n):
            for j in range(n):
                if i != k and j != k:
                    A[i,j] = 
        for i in range(n):
            if i != k:
                A[i,k] = 
        for j in range(n):
            if j != k:
                A[k,j] = 
        A [k,k] = -1/A[k,k]
    return A
    
A = np.array([[1,2,3],[7,11,13],[17,21,23]],dtype = float)

print sweep(A,3)
    