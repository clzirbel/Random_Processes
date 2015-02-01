# gambler_outcome.R generates outcomes of Gambler's wealth

InitialWealth  = 10;            # starting wealth for the gambler
OpponentWealth = 20;            # starting wealth for the opponent
p = 0.5;                        # probability of winning each bet

MaxWealth = InitialWealth + OpponentWealth;  # number of dollars at the table

NumSteps = 100;                 # start the graph with this number of total steps; add more later if needed

Input = ""                      # keep track of whether the user has typed q to quit

while (Input != "q") {          # continue until user types q
  
  n = matrix(,ncol=NumSteps)    # initialize a row vector to store bet number
  W = matrix(,ncol=NumSteps)    # initialize a row vector to store the gambler's wealth
  
  n[1] = 0;                     # start at time 0.  The first entry in a vector is 1, not 0
  W[1] = InitialWealth;         # wealth at time zero
  
  i = 1;                        # current step number

  plot(n[1], W[1], pch=20, xlim=c(0,NumSteps), ylim=c(0,MaxWealth),xlab="Bet number",ylab="Wealth",main="Gambler's wealth")
                                # plot one point, set point style, set axis limits, set axis labels, set graph title


  while (W[i] > 0 && W[i] < MaxWealth) {  # repeat the following lines unti the game ends
  
    n[i+1] = n[i] + 1;         # keep track of the number of bets so far
    
    if ((runif(1) < p)) {      # runif(1) is uniformly distributed between 0 and 1
      W[i+1] = W[i] + 1;       # move up with probability p
    } 
    else {
      W[i+1] = W[i] - 1;       # move down with probability 1-p
    }
    
    if (i+1 <= NumSteps) {     # early in the game, plot steps one at a time
      lines(n[c(i,i+1)],W[c(i,i+1)])           # connect points with lines
      points(n[c(i,i+1)],W[c(i,i+1)],pch=20)   # put a dot at each point
      Sys.sleep(0.1)           # pause for this many seconds after each step
    }
    
    i = i + 1;                 # increase the step number by 1

  }                            # ends the block of commands to repeat while the game is running

  if (i > NumSteps) {          # if the game lasted a long time, plot the history with lines
    plot(n, W, xlim=c(0,i+1), ylim=c(0,MaxWealth),type="l",xlab="Bet number",ylab="Wealth",main="Gambler's wealth")    
    dev.flush()                # update the drawing window
  }
  else {                       # if the game was short, plot with lines and dots
    plot(n, W, xlim=c(0,NumSteps), ylim=c(0,MaxWealth),type="l",xlab="Bet number",ylab="Wealth",main="Gambler's wealth")    
    points(n, W, pch=20)    
    dev.flush()                # update the drawing window
  }
  Input = readline("Press Enter to simulate again, q Enter to quit ")   # wait for Enter to be pressed before going to the next simulation
  
}                              # end the while loop
