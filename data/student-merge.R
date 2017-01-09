# merge two datasets
# ----------------

# 1 load two datasets

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
notjoined_names <- colnames(math)[!colnames(math) %in% merge_by]

# access the dplyr library
library(dplyr)


# 5 averaging multiple columns

# create an empty data frame
student_alc <- data.frame(matrix(nrow = nrow(math_por), ncol = 0))

# for each original column name not used for joining the data..
for(name in notjoined_names) {
  
  # first select the two columns that represent the same variable
  df <- select(math_por, starts_with(name))
  
  # if the columns are of numeric type..
  if(is.numeric(df[, 1])) {
    # take the average of the two columns
    student_alc[name] <- (df[, 1] + df[, 2]) /2
    
  } else {
    # else simply use the first common column
    student_alc[name] <- df[, 1]
    }
}

colnames(student_alc)

# 6 structure of the averaged data

# stucture
str(student_alc)

# summaries
summary(student_alc)

