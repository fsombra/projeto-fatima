library(caTools)         # external package providing write.gif function
jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F", 
                                 "yellow", "#FF7F00", "red", "#7F0000")) 
m <- 1200                # define size
C <- complex( real=rep(seq(-1.8,0.6, length.out=m), each=m ), 
              imag=rep(seq(-1.2,1.2, length.out=m), m ) ) 
C <- matrix(C,m,m)       # reshape as square matrix of complex numbers
Z <- 0                   # initialize Z to zero
X <- array(0, c(m,m,20)) # initialize output 3D array
for (k in 1:20) {        # loop with 20 iterations
  Z <- Z^2+C             # the central difference equation  
  X[,,k] <- exp(-abs(Z)) # capture results
} 
write.gif(X, "Mandelbrot.gif", col=jet.colors, delay=100)