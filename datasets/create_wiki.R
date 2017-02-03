# Wikipedia data ---------------------------------------------------------------
# Emma Kamarainen 2017

# data from https://archive.ics.uci.edu/ml/datasets/wiki4HE#


# libraries
library(dplyr)

# read data
wiki<-read.csv("wiki4HE.csv",sep=";", header=TRUE)

# look at the data
head(wiki)
str(wiki)

# summary of the variables
summary(wiki)

# replace all ?'s with NA
wiki[wiki=='?']<-NA

# remove unused levels from factors (the '?'-level)
wiki<-droplevels(wiki)

# relevant background variables
bg_var <- select(wiki, one_of(c("AGE", "GENDER", "DOMAIN", "PhD", "YEARSEXP", "USERWIKI")))

# select all the other variables than background vars
questions <- wiki[!colnames(wiki) %in% colnames(bg_var)]

# turn all the likert scale variables from factor to numeric
questions<- mutate_all(questions, as.numeric)

# inverse Qu4 because it's a negative question
questions$Qu4 <- 6 - questions$Qu4

# create new variables based on the questions
useful <- select(questions, contains('PU')) %>% rowMeans(na.rm = TRUE)
easyuse <- select(questions, contains('PEU')) %>% rowMeans(na.rm = TRUE)
enjoyment <- select(questions, contains('ENJ')) %>% rowMeans(na.rm = TRUE)
quality <- select(questions, contains('Qu')) %>% rowMeans(na.rm = TRUE)
visibility <- select(questions, contains('Vis')) %>% rowMeans(na.rm = TRUE)
social_image <- select(questions, contains('Im')) %>% rowMeans(na.rm = TRUE)
sharing_attitude <- select(questions, contains('SA')) %>% rowMeans(na.rm = TRUE)
use_behaviour <- select(questions, contains('Use')) %>% rowMeans(na.rm = TRUE)
profile <- select(questions, contains('Pf')) %>% rowMeans(na.rm = TRUE)
job_relevance <- select(questions, contains('JR')) %>% rowMeans(na.rm = TRUE)
behavioral_intention <- select(questions, contains('BI')) %>% rowMeans(na.rm = TRUE)
incentives <- select(questions, contains('Inc')) %>% rowMeans(na.rm = TRUE)
experience <- select(questions, contains('Exp')) %>% rowMeans(na.rm = TRUE)

# combine question variables to new data frame
df <- data.frame(useful, easyuse, enjoyment, quality, visibility, social_image, sharing_attitude, use_behaviour, profile, job_relevance, behavioral_intention,
                 incentives, experience)


# transform yearsexp to numeric
bg_var$YEARSEXP <- bg_var$YEARSEXP %>% as.character %>% as.integer

# transform DOMAIN to factor
bg_var$DOMAIN <- bg_var$DOMAIN %>% factor(levels = 1:6, labels = c("Art", "Sci", "Heal","Engi","Law", "Othr"))

# combine
wikinew <- cbind(bg_var, df)

# number of rows
nrow(wikinew)

# rows with na
complete_rows <- complete.cases(wikinew)

# how many rows without na's
sum(complete_rows)

#remove na's from questions
wikinew<- filter(wikinew, complete_rows)

nrow(wikinew)

# glimpse at the data
glimpse(wikinew)

# convert names to lowercase
colnames(wikinew) <- tolower(colnames(wikinew))

# save
write.table(file = "wiki.txt", wikinew, sep = ",", row.names = F)

# test <- read.table("wiki.txt", sep = ",", header = T)
# str(test)
