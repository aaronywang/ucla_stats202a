#############################################################
## Stat 202A - Practice assignment
## Author: Aaron Wang
## SID: 704556662
## Date: 2016-09-22
## Description: Practice completing an R script and uploading
## it to CCLE.
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


################
## Function 1 ##
################

piFun <- function(x){
  
  # This function takes the input (x), multiplies it by 
  # 3, then adds pi.
  #
  # INPUTS:
  # x: a real number
  
  #######################################
  ## FILL IN THE BODY OF THIS FUNCTION ##
  #######################################
  y <- x*3 + pi
  
  
  
  
  ## Function returns output y, a real number
  return(y)
  
}

################
## Function 2 ##
################

cosFun <- function(x){
  
  # This function takes the cosine of the input (x), then adds 
  # 0.5 to the result.
  # 
  # INPUTS:
  # x: A vector of reals
  
  #######################################
  ## FILL IN THE BODY OF THIS FUNCTION ##
  #######################################
  y <- cos(x)
  
  
  ## Function returns output y, a vector of reals
  return(y)
  
}




########################################################
## Optional examples (comment out before submitting!) ##
########################################################
# 
# piFun(3)
# piFun
# cosFun(c(-10, 10))