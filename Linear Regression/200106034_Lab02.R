#Read the data: ----

d = read.csv("data1.csv")

# Assign to variables ----

#fetching data from d object.
#<- for assigning variable
x <- d$g1
y <- d$g2

#Plot the data: ----

plot(x, y, xlab = "Gene1(g1)", ylab = "Gene2(g2)", col = "red")
# Check correlation ----

cor(x,y, method = 'pearson')
# Perform linear regression: ----

#lm in R to do linear regression.
#~ defines the relation.
reg <- lm(y ~ x, data = d)

# Check the results:
summary(reg)

# Linear regression without intercept ----
reg2 <- lm(y ~ x + 0, data = d) 

summary(reg2)

#Create plot: ----
# Overlay the regression line

abline(reg2, col = "blue")
