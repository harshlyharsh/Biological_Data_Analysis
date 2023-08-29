# Read data -----  
train <- read.csv("spider_train.csv")


# Plot yes/no vs size data ----
plot(train$size, train$spider, xlab = "Size", ylab = "Probability of Digging",
     col = "red", pch = 1, cex = 2)


# Logistic regression to classify using area measure ----
# Use Generalized Linear Model function glm()
# Note: In logistic regression, 
# Probability, P = 1/(1 + exp(-1(a + b*x)))
# This can be written as:
# a + b*x = ln[P/(1-P)]
# We are calculating a and b from data
logit.size <- glm(spider ~ size, data = train, family = "binomial")
summary(logit.size)



# Plot the regression line ----
# Create vector for 'size'
sv = seq(0,1,0.01)
# Create vector for 'probability'
# We are using the predict() function that takes a 
# data frame as input. 
# Convert the size vector to a data frame and add correct header
size.data <- data.frame(sv)
names(size.data) <- "size"
# Predict the values of probability
pv <- predict(logit.size, size.data, type = 'response')
# plot area vs pv
lines(sv, pv, col = "blue", lwd = 2)


# Evaluate the model on test data ----
test <- read.csv("spider_test.csv")
# Predict the probabilities for test data
p.test <- predict(logit.size, test, type = 'response')
c.test1=ifelse(p.test>0.3,1,0)
c.test2=ifelse(p.test>0.5,1,0)
c.test3=ifelse(p.test>0.7,1,0)
tab.test1=table(Predicted=c.test1,Actual=test$spider)
tab.test2=table(Predicted=c.test2,Actual=test$spider)
tab.test3=table(Predicted=c.test3,Actual=test$spider)
print(tab.test1)
print(tab.test2)
print(tab.test3)
sn.test1 <- tab.test1[2,2]/sum(tab.test1[ ,2])
sn.test2 <- tab.test2[2,2]/sum(tab.test2[ ,2])
sn.test3 <- tab.test3[2,2]/sum(tab.test3[ ,2])
print(sn.test1)
print(sn.test2)
print(sn.test3)
x_axis=c(0.3,0.5,0.7)
y_axis=c(sn.test1,sn.test2,sn.test3)
barplot(y_axis,names.arg=x_axis,xlab="Cutoff",ylab="Sensitivity")



