#  displays a sequence of H and T as up and down steps

sequencenumber = "IID"      # for the sequence of IID H and T
sequencenumber = "11"       # for sequences 01 to 16

T = read.table(paste("https://raw.githubusercontent.com/clzirbel/Random_Processes/master/R/head_tail_sequences/sequence",sequencenumber,".txt",sep=""),stringsAsFactors=FALSE)
S = T[1,1]

t = 0:nchar(S)                   # time points
X = rep.int(0,nchar(S))          # location of the head-tail process

for (i in 1:nchar(S)) {
  if (substr(S,i,i) == 'H') {
    X[i+1] = X[i] + 1
  } else {
    X[i+1] = X[i] - 1
  }
}

a = 0
b = 10000
c = min(X[(a+1):(b+1)])
d = max(X[(a+1):(b+1)])

plot(t,X,type="l",xlim=c(a,b),ylim=c(c,d),xlab="Step number",ylab="Position",main=paste("Head-tail sequence ",sequencenumber," as an up down walk",sep=""))

