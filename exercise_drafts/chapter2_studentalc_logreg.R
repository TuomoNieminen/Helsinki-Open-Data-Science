# merge two datasets
# ----------------

# 1 load two datasets

# meta: 
browseURL("https://archive.ics.uci.edu/ml/datasets/STUDENT+ALCOHOL+CONSUMPTION")

# read the math class questionaire data
math <- read.table("student-mat.csv",sep=";",header=TRUE)

# look at the column names
colnames(math)

# read the portuguese class questionaire data
por <- read.table("student-por.csv",sep=";",header=TRUE)

# look at the column names
colnames(por)

# 2 merge the two datasets

# common columns to merge the datasets by
merge_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

# merge the two datasets by selected common variables
math_por <- merge(math, por, by = merge_by, suffixes = c(".math", ".por"))

# see the new column names
colnames(math_por)


# 3 structure of the new dataset

# number of students
nrow(math_por) # 382 students

# structure of the new data
str(math_por) 


# average the rest of the columns
# --------------------------------

# 4 preparation

# which columns in the dataset were not used for merging the data
notjoined_columns <- colnames(math)[!colnames(math) %in% merge_by]

# create a new data frame with the common columns
alcohol <- math_por[, merge_by]

# 5 averaging multiple columns

# access the dplyr library
library(dplyr)

# for each original column name not used for merging the data..
for(column_name in notjoined_columns) {
  
  # first select two columns whose name starts with column_name
  df <- select(math_por, starts_with(column_name))
  
  # if the columns are of numeric type..
  if(is.numeric(df[, 1])) {
    # take the average of the two columns
    alcohol[column_name] <- (df[, 1] + df[, 2]) /2
    
  } else {
    # else simply use the first common column
    alcohol[column_name] <- df[, 1]
    }
}


colnames(alcohol)

# 6 structure of the averaged data

# stucture
str(alcohol)

# summaries
summary(alcohol)

# 7 create a binary variable
alcohol$alcohol_use <- alcohol$

# Logistic regression