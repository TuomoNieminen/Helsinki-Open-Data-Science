
# 1 loading more datasets

# meta: 
browseURL("https://archive.ics.uci.edu/ml/datasets/STUDENT+ALCOHOL+CONSUMPTION")

# read the math class questionaire data
math <- read.table("../datasets/student-mat.csv",sep=";",header=TRUE)

# look at the column names
colnames(math)

# read the portuguese class questionaire data
por <- read.table("../datasets/student-por.csv",sep=";",header=TRUE)

# look at the column names
colnames(por)

# 2 joining two datasets

# common columns to merge the datasets by
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

# join the two datasets by selected common variables
library(dplyr)
math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))

# see the new column names
colnames(math_por)


# 3 glimpse at the joined dataset
library(dlyr)

# glimpse at the new data
glimpse(math_por) 


# 4 Transforming by looping

# which columns in the datasets were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# create a new data frame with the common columns
alc <- select(math_por, one_of(join_by))

# access the dplyr library
library(dplyr)

# average/combine the rest of the columns
for(column_name in notjoined_columns) {
  
  df <- select(math_por, starts_with(column_name))
  
  if(is.numeric(select(df, 1))) {
    alc[column_name] <- rowMeans(df)
  } else {
    alc[column_name] <- select(df, 1)
  }
}

# 5 Binarizing a variable
library(dplyr)
library(ggplot2)

# glimpse at the data
glimpse(alc)

# combine weekday and weekend alcohol use into alc_use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

# draw a histogram
qplot(alc_use, data = alc, bins = 10)

# transform alc_use into a binary variable high_use
alc$high_use <- alc$alc_use > 2

# draw a bar plot
qplot(high_use, data = alc)

# exploring relationships with cross tables
addmargins(table(alc$sex, alc$high_use))

xtabs(!high_use ~ sex + age, data = alc)

xtabs(!high_use ~ sex + age, data = alc)

# Logistic regression
# -------------------

# 6 fitting a logistic regression model
m1 <- glm(high_use ~ sex + age, data = alc, family = "binomial")

summary(m1)

# 7
