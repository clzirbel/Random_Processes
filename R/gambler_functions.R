# gambler_transition_matrix(m,n,p) is a function which sets up the transition matrix for a gambler's wealth after successive iid bets of 1 dollar.
# Input parameters are m, the amount of money the gambler has, n, the amount the opponent has, and p, the probability that the gambler wins each bet.

gambler_transition_matrix = function(m=10,n=20,p=0.5) {

	N = m + n           # total wealth at the table
	q = 1 - p           # probability of losing a bet

	P = matrix(0,ncol=N+1,nrow=N+1)   # set up a matrix of zeros, of the right size
	                    # rows 1..N+1 correspond to wealths 0..N

	for (i in 2:N) {    # let i take values 2, 3, 4, ..., N
	  P[i,i-1]=q        # wealth decreases by 1
	  P[i,i+1]=p        # wealth increases by 1
	}

	P[1,1] = 1          # stay at 0 wealth with probability 1
	P[N+1,N+1] = 1      # stay at wealth N with probability 1

	return(P)
}


