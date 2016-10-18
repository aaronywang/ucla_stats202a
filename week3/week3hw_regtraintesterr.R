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

########################################################
## Optional examples (comment out before submitting!) ##
########################################################





