
# Load the package ----

library(ggplot2)


# Read the data for volcano plot ----

data <- read.csv("vData_1.csv")

# Create volcano plot step by step using ggplot2 ----

# Step 1

ggplot()

# Step 2

ggplot(data)


vp1 <- ggplot(data, aes( x = log2FoldChange, y = -log10(pvalue))) +
  
  geom_point() +
  
  geom_vline(xintercept = c(-1,1), color="blue") + 
  
  geom_hline(yintercept = -log10(0.05), color="blue") +
  
  labs(x = "FoldChange(log2)" , 
       y = "pvalue(-log10)") +
  
  theme_classic()
  
vp1


