library(dplyr)
## read the math class questionaire data
math <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_3140/datasets/student-mat.csv",sep=";",header=TRUE)
## read the portuguese class questionaire data
por <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_3140/datasets/student-por.csv",sep=";",header=TRUE)
## common columns to merge the datasets by
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
## join the two datasets by selected common variables
math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))

# combine the 'duplicate' columns and add them to the 'alc' data frame
for(column_name in notjoined_columns) {
  # select the two columns with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  
  # if the first column is numeric, take a rounded average
  if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else just use the first column
    alc[column_name] <- first_column
  }
}

## combine weekday and weekend alcohol use into alc_use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

## transform alc_use into a binary (T, F) variable high_use
alc <- mutate(alc, high_use = alc_use > 2)

path <- "../datasets/alc.txt"
write.table(file = path, alc, sep = ",", row.names = F)

# str(read.table(path, sep=",", header = T))
