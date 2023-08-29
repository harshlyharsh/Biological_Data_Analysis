# k-means clustering with a test data

# Read data ----

data <- read.csv("facs.csv")

# Perform k-means clustering ----
# Use kmeans() function

# Set seed for random number generator
set.seed(1) 

# Compare clustering with different k ----

# Perform clustering different k in a for loop

k_clusters <- list()

for (k in 2:6){
  
  k_clusters[[k]] <- kmeans(data, k, nstart = 50)
  
}


# Collect Within cluster sum of squares for all clustering

wcss <- rep(0,5)

for (k in 2:6){
  wcss[k-1] <- k_clusters[[k]]$tot.withinss
}

# Create a barplot for WCSS

barplot(wcss, names = seq(2,6), xlab = "k", 
        ylab = " Within cluster SS")

# plot the result for selected k 
# Here we are using k = 3

plot(data$FL2.H,data$FL3.H,xlab = "FL2.H", ylab = "FL3.H", col = k_clusters[[3]]$cluster,pch = 20, cex = 3)

# plot the result for selected k 
# Here we are using k = 4

plot(data$FL3.H,data$FL4.H,xlab = "FL3.H", ylab = "FL4.H", col = k_clusters[[4]]$cluster,pch = 20, cex = 3)