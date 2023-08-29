# Principal Component Analysis: Step-by-step

# Read data ----

data = read.csv('image.csv')

# # Center and scale the data ----

data.scaled <- scale(data[, 2:14], center = TRUE, scale = TRUE)

# Get the covariance matrix ----
# of the data

cov.d.s <- cov(data.scaled)

# Get eigenvalues and eigenvectors ----
# of the covariance matrix 

ev <-eigen(cov.d.s)

# Get eigenvalues & plot scree plot ----

L <- ev$values 

L.s <- L/sum(L)

barplot(L.s,names.arg = paste0("L",seq(1,13)),
        ylab = 'Relative Variance', ylim = c(0,0.6),xlab='Dimensions')  

# Get eigenvectors ----

V <- ev$vectors

# scale the eigenvectors wrt +1

V <- -V

# Generate Scores matrix ----
# Project the data on the eigenvectors

P <- data.scaled %*% V

# Plot the projected data for PC1 & PC2 ----

plot(P[ ,1:2],xlab='PC1',ylab='PC2')


