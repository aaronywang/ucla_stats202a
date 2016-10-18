#Ridge Regression to Linear Piecewise
x <- runit(n)
x <- sort(x)
y <- x^2 + rnorm(n) * sigma #just choose a value for sigma and lambda
X <- matrix(x, nrow = n)
for (k in (1:(p-1)/p)) {
  X <- cbind(x,(x>k)*(x-k))
  beta <- myRidge(X,Y,lambda)
  yhat <- cbind(rep(1,n),X)%*%beta
  plot(X,Y,ylim = (1-0.2,1.2),col = "red")
  par(new = True)
  plot(x, yhat, ylim = (1-0.2,1.2), type = "l", col = "green")
}



#new stuff
n = 1000
p = 10
s = 10

X <- matrix(rnorm(n*p),nrow = n)
beta_true <= matrix(rep(0,p),nrow = p)
beta_true[1:s] = 1:s
Y <- X%*%beta_true + rnorm(n)
beta <- matrix(rep(0,n), nrow = p)
#implement coordinate descent algorithm
R <- Y
SS <- rep(0,p)
for (j in 1:p) {
  SS[j] = sum(x[i,j]^2)
}
for (it in 1:IT) #IT = iterations
  {
  for (j in 1:p) 
    {
    db <- sum(R*X[i,j])/ss[j]
    beta[j] <- beta[j] + db
    R = R - X[i,j] * db
  }
  print(beta)
}



#Lassu regression
n=50
p=200 #p>n
s=10
T=10
lambda_all = (100:1)*10 
#start large lambda and go down. If you just fix lambda at 10, the iterations to converge might be extremely high


L <- length(lambda_all)
X <- matrix(rnorm(n*p),nrow=n)
beta_true <- matrix(rep(0,n),nrow = p)
beta_true[1:s] = 1:s 

Y <- X%*%beta_true + rnorm(n)
beta <- matrix(rep(0,p),nrow = p)
beta_all <- matrix(rep(0,p*L),nrow = p) #L represents the number of lambda used

R <- Y #R is residual vectors
SS = rep(0,p)
for (j in 1:p) {
  SS[j] = sum(x[j]^2)
}

err = rep(0,L)
for(l = 1:L) {
  lambda = lambda_all[l]
  for (t in 1:T) { #at each lambda you run T iterations, you want to check if this converge
    for (j in 1:p) {
      db = sum(R*x[i,j]/SS[j])
      b = beta[j]+db #add becak to get least squared estimators
      b = sign(b) * max(0,abs(b)-lambda/SS[j])
      db = b-beta[j]
      R <- R - x[i,j]*db
      beta[j] = b
    }
  }
  beta_all[,l] = beta
  err[l] = sum(beta, beta_true)^2
}

par(mfrow = c(1,2))
matplot(t(matrix(rep(1,p),nrow=1)%*%abs(beta_all)),t(beta_all),type = 'l') #chek against notes, this is not complete
plot(labmda_all,err,type'l')
