# this program generates various random strings of H and T characters

N = 10000                   # length of strings to generate

# Method 1
S = ''                      # start with an empty string
for (i in 1:N) {            # make the variable i take values 1 to N
  if (runif(1) < 0.5) {     # generate a random uniform(0,1) variable
    S = paste(S,'H',sep='') # if it is less than 0.5, add H to S
  } else {                  # otherwise,
    S = paste(S,'T',sep='') # add T to S
  }
}
allStrings = S              # store the resulting sequence

# Method 2
S = ''
for (i in 1:N) {
  if (runif(1) < 0.7) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
allStrings = c(allStrings,S) # append the new string to the list of all strings

# Method 3
S = ''
for (i in 1:N) {
  if ((i %% 2) == 0) {      # if i is even; i %% 2 is the remainder
    if (runif(1) < 0.2) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  } else {
    if (runif(1) < 0.8) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  }
}
allStrings = c(allStrings,S)

# Method 4
S = ''
for (i in 1:N) {
  if (runif(1) < i/N) {     # this is where this method differs from method 1
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
allStrings = c(allStrings,S)

# Method 5
S = ''
for (i in 1:(N/10)) {
  s = sample(c('H','H','H','H','H','T','T','T','T','T'),10) # sample without replacement
  s = paste(s,collapse='')              # reduce to a string
  S = paste(S,s,sep='')                 # append new string to S
}
allStrings = c(allStrings,S)

# Method 6
S = ''
if (runif(1) < 0.5) {
  S = paste(S,'H',sep='')
} else {
  S = paste(S,'T',sep='')
}
for (i in 2:N) {
  if (substr(S,i-1,i-1) == 'H') {  # pull out character i-1 in S
    if (runif(1) < 0.01) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  } else {
    if (runif(1) < 0.99) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  }
}
allStrings = c(allStrings,S)

# Method 7
S = ''
if (runif(1) < 0.5) {
  S = paste(S,'H',sep='')
} else {
  S = paste(S,'T',sep='')
}
for (i in 2:N) {
  if (substr(S,i-1,i-1) == 'H') {
    if (runif(1) < 0.9) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  } else {
    if (runif(1) < 0.1) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  }
}
allStrings = c(allStrings,S)

# Method 8
S = ''
while (nchar(S) <= N) {      # keep doing this until S is long enough
  L = sample(5:10,1)         # generate one random integer from 5 to 10
  for (i in 1:L) {
    S = paste(S,'H',sep='')
  }
  L = sample(5:10,1)         # generate one random integer from 5 to 10
  for (i in 1:L) {
    S = paste(S,'T',sep='')
  }
}
S = substr(S,1,N)
allStrings = c(allStrings,S)

# Method 9
S = ''
for (i in 1:N) {
  if (runif(1) < 0.5) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
while (length(grep('HHHHH',S)) > 0 || length(grep('TTTTT',S)) > 0) {
                                  # count the number of occurrences of HHHHH and TTTTT
  S = gsub('HHHHH','HTTTH',S)     # replace HHHHH with HTTTH
  S = gsub('TTTTT','THHHT',S)
}
allStrings = c(allStrings,S)

# Method 10
S = ''
for (i in 1:N) {
  if (runif(1) < 0.5) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
while (length(grep('HTH',S)) > 0 || length(grep('THT',S)) > 0) {
  S = gsub('HTH','HHH',S)
  S = gsub('THT','TTT',S)
}
allStrings = c(allStrings,S)

# Method 11
S = ''
for (i in 1:N) {
  if (runif(1) < 0.5) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
for (a in 1:(N/2)) {
  substr(S,a,a) = substr(S,a+N/2,a+N/2) # set one substring equal to another
}
allStrings = c(allStrings,S)

# Method 12
S = ''
for (i in 1:N) {
  if (runif(1) < 0.5) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
for (a in 1:(N/2)) {
  substr(S,a,a) = substr(S,N-a+1,N-a+1) # set one substring equal to another
}
allStrings = c(allStrings,S)

# Method 13
S = ''
for (i in 1:N) {
  if (runif(1) < 0.5) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
for (j in 1:(N/2)) {
  a = sample(1:(N-10),1)              # random integer from 1 to N-10
  substr(S,a,a) = substr(S,a+10,a+10) # set one substring equal to another
}
allStrings = c(allStrings,S)

# Method 14
S = ''
for (i in 1:N) {
  if (runif(1) < 0.5) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
for (j in 1:(N/50)) {
  a = sample(1:(N-40),1)
  substr(S,a,a+20) = substr(S,a+20,a+40)
}
allStrings = c(allStrings,S)

# Method 15
S = ''
for (i in 1:N) {
  if (runif(1) < 0.5) {
    S = paste(S,'H',sep='')
  } else {
    S = paste(S,'T',sep='')
  }
}
for (j in 1:(N/50)) {
  a = sample(1:(N-40),1)
  for (k in 0:19) {
    substr(S,a+k,a+k) = substr(S,a+40-k,a+40-k)
  }
}
allStrings = c(allStrings,S)

# Method 16
S = ''
if (runif(1) < 0.5) {
  H = 'F'
} else {
  H = 'L'
}
for (i in 1:N) {
  if (H == 'F') {
    if (runif(1) < 0.5) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  } else {
    if (runif(1) < 0.7) {
      S = paste(S,'H',sep='')
    } else {
      S = paste(S,'T',sep='')
    }
  }
  if (H == 'F') {
    if (runif(1) < 0.1) {
      H = 'L'
    }
  } else {
    if (runif(1) < 0.1) {
      H = 'F'
    }
  }
}
allStrings = c(allStrings,S)

# write out the sequences to separate files, with scrambled numbers
numMethods = length(allStrings)
order = sample(1:numMethods,numMethods)  # random permutation

for (m in 1:numMethods) {
  print(sprintf('Method %2d is written out as sequence %2d',m,order[m]))
  fileConnection = file(paste('sequence',sprintf('%02d',m),'.txt',sep=''))
  writeLines(allStrings[order[m]], fileConnection)
  close(fileConnection)
}
