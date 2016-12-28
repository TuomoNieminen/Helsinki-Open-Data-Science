# 1 reading data from an URL
# ------------

# read the data into memory
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# look at the dimensions of the data
dim(lrn14)

# look at the structure of the data
str(lrn14)


# 2 Combining variables (1)
# -------------

# sum questions "D03", "D11", "D19", "D27 into "seek_meaning"
lrn14$seek_meaning <- rowSums(lrn14[ , c("D03", "D11", "D19", "D27")])

# sum questions "D07", "D14", "D22", "D30" into "relate_ideas"
lrn14$relate_ideas <- rowSums(lrn14[ , c("D07", "D14", "D22", "D30")])

# sum questions "D06","D15","D23","D31" into "use_evidence"
lrn14$use_evidence <- rowSums(lrn14[ , c("D06","D15","D23","D31")])

# sum questions "SU02","SU10","SU18","SU26" into "lack_purpose"
lrn14$lack_purpose <- rowSums(lrn14[ , c("SU02","SU10","SU18","SU26")])

# sum questions "SU05","SU13","SU21","SU29" into "unrel_memori"
lrn14$unrel_memori <- rowSums(lrn14[ , c("SU05","SU13","SU21","SU29")])

# sum questions "SU08","SU16","SU24","SU32" into "syllab_bound"
lrn14$syllab_bound <- rowSums(lrn14[ , c("SU08","SU16","SU24","SU32")])

# sum questions "ST01","ST09","ST17","ST25" into "organz_study"
lrn14$organz_study <- rowSums(lrn14[ , c("ST01","ST09","ST17","ST25")])

# sum questions "ST04","ST12","ST20","ST28" into "time_managem"
lrn14$time_managem <- rowSums(lrn14[ , c("ST04","ST12","ST20","ST28")])


# 3 Combining variables (2)
# -------------

# deep approach = "seek_meaning", "relate_ideas", "use_evidence" (12 questions)
lrn14$deep <- rowSums(lrn14[, c("seek_meaning", "relate_ideas", "use_evidence")]) / 12

# surface approach = "lack_purpose", "unrel_memori", "syllab_bound" (12 questions)
lrn14$surf <- rowSums(lrn14[, c("lack_purpose", "unrel_memori","syllab_bound")]) /12

# strategic approach = "organz_study", "time_managem" (8 questions)
lrn14$stra <- rowSums(lrn14[, c("organz_study","time_managem")]) / 8

# scale "Attitude" (10 questions) to create "attitude"
lrn14$attitude <- lrn14$Attitude / 10

# 4 Creating an analysis dataset
# ----------------

# current dimensions of the data
dim(lrn14)

# choose a handful of variables into a new data set
learning2014 <- lrn14[, c("gender","Age","attitude", "deep", "stra", "surf", "Points")]

# see the stucture of the new dataset
str(learning2014)


# 4 modifying column names
# -----------------

# print out the column names of the data
colnames(learning2014)

# change the name of the second column
colnames(learning2014)[2] <- "age"

# change the name of "Points" to "points"
colnames(learning2014)[7] <- "points"

# 5 Excluding observations
# ---------

# create and print a logical vector
learning2014$points > 0

# choose rows where Points is greater than zero
learning2014 <- learning2014[learning2014$points > 0, ]


# 6 Exploring the data
# --------------

# a quick way to see what's going on with scatter plots
# -1 excludes the first column from the plots (gender)
pairs(learning2014[-1], col = learning2014$gender)

# more advanced quick plots of the data
library(GGally)
ggpairs(learning2014, aes(colour = gender))


# 7 Simple regression (1)
# ------------------

# Use the gglot2 library
library(ggplot2)

# initialize plot coordinates
p <- ggplot(data = learning2014, 
            aes(x = attitude, y = points, col = gender))

# define the visualization (points)
p <- p + geom_point()

# draw the plot
p

# add a regression line
p <- p + geom_smooth(method = "lm")
p

# add a main title
p <- p + ggtitle("students attitude and exam points")
p

# 8. Simple regression (2)

# fit a regression model
m1 <- lm(points ~ attitude, data = learning2014)

# print a summary of the model
summary(m1)


# 9 multiple regression

library(GGally)
ggpairs(learning2014, aes(col = gender))

m2 <- lm(points ~ attitude + stra, data = learning2014)

summary(m2)

# 10 model assumptions
