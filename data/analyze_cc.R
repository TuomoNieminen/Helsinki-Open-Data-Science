# explore and analyze the credit card data

setwd("C:/Users/Tuomo/Documents/GitHub/Helsinki-Open-Data-Science/data")
cc <- read.csv("cc.csv")

# Exploration
# ----------

# 1. structure

# dimensions (N x d)
dim(cc)

# structure
str(cc)


# 2. Summaries

# summaries of transaction amounts and frauds
summary(cc$Amount)
table(cc$Class)

# how many zero amount transactions?
sum(cc$Amount == 0)

# exclude rows where Amount equals zero
cc <- cc[cc$Amount != 0, ]


# 3. Amount vs frauds exploration (1)

# recode 'Class' as a factor and save as a column called 'fraud'
cc$fraud <- factor(cc$Class, levels = c(0,1), labels = c("N","Y"))

# box plot of transaction amounts by fraud/legit on log scale
p <- ggplot(cc, aes(x = fraud, y = Amount))
box <- p + geom_boxplot()
box + scale_y_log10()


# 4. Amount vs frauds exploration (2)

# categorize transaction amount
cc$amount <- cut(cc$Amount, breaks = c(0, 5, 20, 100, 1000, 5000))

# create a function which computes a percentage table
prc_tbl <- function(x, y) {
  t1 <- table(x, y)
  p <- prop.table(t1)
  p <- addmargins(p)
  p <- round(p, 4)
  100*p
}

# percentage table of amount categories vs fraud/non-fraud
prc_tbl(cc$amount, cc$fraud)


# Logistic regression modelling
# -----------

# 5. fitting a logistic regression model

# fit a model
m <- glm(fraud~Amount+V2+V3+V4, family = binomial(), data = cc)

# summary of the model
summary(m)

# 6. analyzing the model output: coefficients

# print the coefficients
m

# print exponentiated coefficients
exp(coefficients(m))


# 7. model performance and validation: prediction accuracy

# predict the response
cc$prediction <- predict(m, type = "response")

head(cc[,c("Class","prediction")])

# average predicted fraud probabilities for frauds and nonfrauds
by(cc$prediction, cc$fraud, mean)


# 8. model performance and validation: cross-validation
library(boot)

cost <- function(prediction, class) sum(abs(prediction - class) > 0.5)
cv <- cv.glm(data = cc, cost = cost, glmfit = m, K = 10)$delta
