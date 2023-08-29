# Read data file
exp.data <- read.csv("exp.csv", row.names = 1, header = TRUE)

# Create data matrix
d <- data.matrix(exp.data, rownames.force = TRUE)

# Create cluster heatmap ----
# Adds dendograms to the heatmap
# Scale the data
# Create new heatmap with one dendogram
# Final heatmap
heatmap(d[34:43,1:10], Colv = NA, 
        scale = "column",
        xlab = "Samples",
        ylab = "Genes",
        margins = c(5,8))