# Wikipedia ---------------------------------------------------------------

#https://archive.ics.uci.edu/ml/datasets/wiki4HE#

# AGE: numeric 
# GENDER: 0=Male; 1=Female 
# DOMAIN: 1=Arts & Humanities; 2=Sciences; 3=Health Sciences; 4=Engineering & Architecture; 5=Law & Politics 
# PhD: 0=No; 1=Yes 
# YEARSEXP (years of university teaching experience): numeric 
# UNIVERSITY: 1=UOC; 2=UPF 
# UOC_POSITION (academic position of UOC members): 1=Professor; 2=Associate; 3=Assistant; 4=Lecturer; 5=Instructor; 6=Adjunct 
# OTHER (main job in another university for part-time members): 1=Yes; 2=No 
# OTHER_POSITION (work as part-time in another university and UPF members): 1=Professor; 2=Associate; 3=Assistant; 4=Lecturer; 5=Instructor; 6=Adjunct 
# USERWIKI (Wikipedia registered user): 0=No; 1=Yes 
# 
# Perceived Usefulness 
# PU1: The use of Wikipedia makes it easier for students to develop new skills 
# PU2: The use of Wikipedia improves students' learning 
# PU3: Wikipedia is useful for teaching 
# 
# Perceived Ease of Use 
# PEU1: Wikipedia is user-friendly 
# PEU2: It is easy to find in Wikipedia the information you seek 
# PEU3: It is easy to add or edit information in Wikipedia 
# 
# Perceived Enjoyment 
# ENJ1: The use of Wikipedia stimulates curiosity 
# ENJ2: The use of Wikipedia is entertaining 
# 
# Quality 
# QU1: Articles in Wikipedia are reliable 
# QU2: Articles in Wikipedia are updated 
# QU3: Articles in Wikipedia are comprehensive 
#   QU4: In my area of expertise, Wikipedia has a lower quality than other educational resources 
# QU5: I trust in the editing system of Wikipedia 
# 
# Visibility 
# VIS1: Wikipedia improves visibility of students' work 
# VIS2: It is easy to have a record of the contributions made in Wikipedia 
# VIS3: I cite Wikipedia in my academic papers 
# 
# Social Image 
# IM1: The use of Wikipedia is well considered among colleagues 
# IM2: In academia, sharing open educational resources is appreciated 
# IM3: My colleagues use Wikipedia 
# 
# Sharing attitude 
# SA1: It is important to share academic content in open platforms 
# SA2: It is important to publish research results in other media than academic journals or books 
# SA3: It is important that students become familiar with online collaborative environments 
# 
# Use behaviour 
# USE1: I use Wikipedia to develop my teaching materials 
# USE2: I use Wikipedia as a platform to develop educational activities with students 
# USE3: I recommend my students to use Wikipedia 
# USE4: I recommend my colleagues to use Wikipedia 
# USE5: I agree my students use Wikipedia in my courses 
# 
# Profile 2.0 
# PF1: I contribute to blogs 
# PF2: I actively participate in social networks 
# PF3: I publish academic content in open platforms 
# 
# Job relevance 
# JR1: My university promotes the use of open collaborative environments in the Internet 
# JR2: My university considers the use of open collaborative environments in the Internet as a teaching merit 
# 
# Behavioral intention 
# BI1: In the future I will recommend the use of Wikipedia to my colleagues and students 
# BI2: In the future I will use Wikipedia in my teaching activity 
# 
# Incentives 
# INC1: To design educational activities using Wikipedia, it would be helpful: a best practices guide 
# INC2: To design educational activities using Wikipedia, it would be helpful: getting instruction from a colleague 
# INC3: To design educational activities using Wikipedia, it would be helpful: getting specific training 
# INC4: To design educational activities using Wikipedia, it would be helpfull: greater institutional recognition 
# 
# Experience 
# EXP1: I consult Wikipedia for issues related to my field of expertise 
# EXP2: I consult Wikipedia for other academic related issues 
# EXP3: I consult Wikipedia for personal issues 
# EXP4: I contribute to Wikipedia (editions, revisions, articles improvement...) 
# EXP5: I use wikis to work with my students 

# working dir
setwd("/Users/d0500439/OneDrive/DataCamp/Helsinki-Open-Data-Science/data/")
setwd("C:\\Users\\emmak\\OneDrive\\DataCamp\\data")

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

# background variables
bg_var <- select(wiki, one_of(c("AGE", "GENDER", "DOMAIN", "PhD", "YEARSEXP", "UNIVERSITY", "UOC_POSITION", "OTHER_POSITION", "OTHERSTATUS", "USERWIKI")))

# select all the other variables than background vars
questions<-wiki[!colnames(wiki) %in% colnames(bg_var)]

# turn all the likert scale variables from factor to numeric
questions<- mutate_all(questions, as.numeric)

# inverse Qu4 because it's a negative question
questions$Qu4 <- 6 - questions$Qu4

# create new variables based on the questions
useful<-apply(select(questions, contains('PU')), 1, mean, na.rm = TRUE)
easyuse<-apply(select(questions, contains('PEU')), 1, mean, na.rm = TRUE)
enjoyment<-apply(select(questions, contains('ENJ')), 1, mean, na.rm = TRUE)
quality<-apply(select(questions, contains('Qu')), 1, mean, na.rm = TRUE)
visibility<-apply(select(questions, contains('Vis')), 1, mean, na.rm = TRUE)
social_image<-apply(select(questions, contains('Im')), 1, mean, na.rm = TRUE)
sharing_attitude<-apply(select(questions, contains('SA')), 1, mean, na.rm = TRUE)
use_behaviour<-apply(select(questions, contains('Use')), 1, mean, na.rm = TRUE)
profile<-apply(select(questions, contains('Pf')), 1, mean, na.rm = TRUE)
job_relevance<-apply(select(questions, contains('JR')), 1, mean, na.rm = TRUE)
behavioral_intention<-apply(select(questions, contains('BI')), 1, mean, na.rm = TRUE)
incentives<-apply(select(questions, contains('Inc')), 1, mean, na.rm = TRUE)
experience<-apply(select(questions, contains('Exp')), 1, mean, na.rm = TRUE)

# combine question variables to new data frame
df <- data.frame(useful, easyuse, enjoyment, quality, visibility, social_image, sharing_attitude, use_behaviour, profile, job_relevance, behavioral_intention,
                 incentives, experience)

# rows with na
rows <- complete.cases(df)

#remove na's from questions
df<-df[rows,]

# remove the same rows from the background varaibles
bg_var<-bg_var[rows,]

# classify yearsexp to five classes and drop the original column
bg_var$years_bin <- ntile(bg_var$YEARSEXP, n = 5)
bg_var <- select(bg_var, -YEARSEXP)
