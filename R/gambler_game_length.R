# gambler_game_length.R

source('gambler_functions.R')             # read this file and execute the commands
P = gambler_transition_matrix(10,20,0.5)  # set up a 31 by 31 matrix, call it P
mu = matrix(0,ncol=31,nrow=1)             # set mu to be a row vector of all zeros
mu[1,11] = 1                              # probability 1 of starting with wealth 10

n = matrix(0,ncol=1,nrow=1)               # keep track of time points
F = matrix(0,ncol=1,nrow=1)

for (i in 1:1000) {
  mu = mu %*% P
  n[i+1] = i                              # keep track of time points
  F[i+1] = mu[1,1] + mu[1,31]             # probability that the game is over after n bets
  cat("Time",i,"probability",F[i+1],"\n")
}

cat("Time points\n",n[1:20],"\n")
cat("CDF values\n",F[1:20],"\n")
cat("Maximum probability",max(F),"\n")

plot(n,F,type="l",xlab="Number of bets",ylab="Probability the game is done")

pmf = c(0,diff(F))

cat("PMF values\n",pmf[1:20],"\n")

plot(n,pmf,type="p",pch=20,xlim=c(0,1000),xlab="Number of bets",ylab="Probability the game ends at this time")

cat("Maximum of PMF is",pmf[which.max(pmf)],"which occurs at time",which.max(pmf)-1,"\n")

EX = 0
for (i in 1:length(F)) {
  EX = EX + 1 - F[i]
}

cat("Expected length of the game is",EX,"\n")

