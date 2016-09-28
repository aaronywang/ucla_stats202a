"""
#############################################################
## Stat 202A - Practice assignment
## Author: Aaron Wang
## SID: 704556662
## Date: 2016-09-22
## Description: Practice completing a python script and 
## uploading it to CCLE.
#############################################################

#############################################################
## INSTRUCTIONS: Please fill in the missing lines of code
## only where specified. Do not change function names,
## function inputs or outputs. You can add examples at the
## end of the script (in the "Optional examples" section) to
## double-check your work, but MAKE SURE TO COMMENT OUT ALL
## OF YOUR EXAMPLES BEFORE SUBMITTING.
#############################################################
"""

import numpy as np
import math
from math import cos

################
## Function 1 ##
################

def piFun(x):
    
    """ This function takes the input (x), multiplies it by 
    3, then adds pi.
    ....... 
    INPUTS:
    x: A real number 
    """
    y = x * 3 + np.pi
        
    
    ## Function returns output y, a real number
    return(y)

piFun(6)    
    
################
## Function 2 ##
################

def cosFun(x):
    
    """ This function takes the cosine of the input (x), then adds 0.5 to the
    result.
    ....... 
    INPUTS:
    x: A vector of reals 
    """
    
    #######################################
    ## FILL IN THE BODY OF THIS FUNCTION ##
    #######################################
    y = [cos(float(i))+0.5 for i in x]
    
    ## Function returns output y, a vector of reals
    return(y)    
    
 
########################################################
## Optional examples (comment out before submitting!) ##
########################################################
#
#piFun(3)
#piFun(-2)
#cosFun(range(-10, 10))