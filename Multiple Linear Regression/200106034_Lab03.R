# Read data ----
data2 <- read.csv("data2.csv")

# Perform regression using lm() ----

my_reg <- lm(S ~M + N + P + Q + R, data = data2)

# Check summary of regression ----
# (1) Estimated coefficients
# (2) Adjusted R-squared
# (3) t-test for each coefficient
# (4) ANOVA

summary(my_reg)

# Perform regression using updated lm() ----

updated_my_reg <- lm(S ~M + P + R, data = data2)

# Check summary of regression ----
# (1) Estimated coefficients
# (2) Adjusted R-squared
# (3) t-test for each coefficient
# (4) ANOVA

summary(updated_my_reg)

# confidence interval for each coefficient ----

confint(updated_my_reg)
