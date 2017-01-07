# run length distribution

library(expm)

R = 5           # run length of interest
p = 0.5         # probability of "success" or "heads"
n = 100          # step number of interest

P = matrix(0,nrow = R+1, ncol = R+1)
                # states 0, 1, ..., R of the chain
                # correspond to rows 1, 2, ..., R+1 of P


for (r in 1:R) {
  P[r,1] = 1-p         # failure or tails
  P[r,r+1] = p         # success or heads
}
P[R+1,R+1] = 1         # once state R is reached, stay there

A = P %^% n            # raise P to the desired power

print(A[1,R+1])        # show the probability of observing at least one run of length R in n steps