

# 7 Scatter plots with ggplot2
# ------------------

# Use the gglot2 library
library(ggplot2)

# initialize plot coordinates
p <- ggplot(data = learning2014, 
            aes(x = attitude, y = points, col = gender))

# define the visualization type (points)
p <- p + geom_point()

# draw the plot
p

# add a regression line
p <- p + geom_smooth(method = "lm")

# add a main title
p <- p + ggtitle("Student's attitude versus exam points")
p

# 8 Exploring the whole data frame
# --------------

# summaries of the variables
summary(learning2014)

# scatter plots of the variable pairs. [-1] excludes the first column (gender)
pairs(learning2014[-1], col = learning2014$gender)

# more advanced plotting of a data frame with the GGally and ggplot2 libraries
library(GGally)
library(ggplot2)
ggpairs(learning2014, aes(colour = gender, alpha = 0.4), 
        lower = list(combo = wrap("facethist", bins = 20)))


# 9 Simple regression

# fit a regression model
m1 <- lm(points ~ attitude, data = learning2014)

# print a summary of the model
summary(m1)


# 10 multiple regression

library(GGally)
ggpairs(learning2014, aes(col = gender))

m2 <- lm(points ~ attitude + stra, data = learning2014)

summary(m2)

# 11 Graphical model validation

m2 <- lm(points ~ attitude + stra, data = learning2014)

# diagnostic plots 
# 1: Redisuals vs Fitted values (homogenuity of variance)
# 2: qq-plot of residuals (normality of errors)
# 5: Residuals vs Leverage (impact of observations)
plot(m2, which = c(1,2,5))

# 12 predicting

m2 <- lm(points ~ attitude + stra, data = learning2014)

# Create toy new data
new_data <- data.frame(attitude = c(1,4), stra = c(2,5))
rownames(new_data) <- c("George","Samantha")

predict(m2, newdata = new_data)
