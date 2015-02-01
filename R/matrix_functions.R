# matrix functions

library(gplots)
library(expm)

# print_matrix outputs a matrix to the screen, adjusting the width of the output so that no line is wrapped

print_matrix = function(M) {
  options(width = dim(M)[2]*8)
  for (i in 1:dim(M)[1]) {
    for (j in 1:dim(M)[2]) {
      cat(sprintf("%0.4f ",M[i,j]),fill=FALSE)
    }
    cat("\n")
  }
}

# plot_matrix_as_image makes a gray-scale heat map of a matrix

plot_matrix_as_image = function(M,minimumstate=1,titletext="") {
  nr <- dim(M)[1]
  nc <- dim(M)[2]
  #Request a square plot area:
  par(pty="s")
  #Plot an image using the row/column numbers as the x/y variables:
  
  D = t(M[nr:1,])              # flip matrix vertically, then transpose
  
  grayscale = rgb( seq(1,0,length=256),  # Red
                    seq(1,0,length=256),  # Green
                    seq(1,0,length=256))  # Blue
  
  image(x=1:nr, y=1:nc, z=D, axes=FALSE, frame.plot=TRUE, col=grayscale, main=titletext, xlab=NA, ylab=NA)
  #Add axis labels, use las=2 for perpendicular text:
  axis(1, 1:nr, labels=(1:nr) - 1 + minimumstate, las=2)
  axis(2, 1:nc, labels=(nc:1) - 1 + minimumstate, las=2)
  #Get a nice border around the image: 
  box()
  #Add a solid black grid:
  grid(nx=nr, ny=nc, col="black", lty="solid") 
}

# transition_matrix_powers plots six powers of a given transition matrix

transition_matrix_powers = function(P,minimumstate=0,n=c(1,2,3,20,200,2000)) {
  par(mfrow=c(3,2))

  n = n[c(1,4,2,5,3,6)]             # re-order to run down the first column
  
  for (i in n) {
    plot_matrix_as_image(P %^% i,minimumstate,sprintf("Graphical representation of P^%d",i))
  }

  
  
}