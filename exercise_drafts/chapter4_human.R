# --------------------
# access dplyr
library(dplyr)


# Meet the human development data
# ------------------

# read data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)

# look at a summary of human
summary(human)

# look at the structure of GNI
str(human$GNI)

# replace ',' with '' (nothing) and then tranform GNI to numeric
human$GNI <- gsub(",", "", human$GNI) %>% as.numeric

# look at a summary of GNI
summary(human$GNI)


# Dealing with NA values
# ---------------------
# read data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
human$GNI <- gsub(",", "", human$GNI) %>% as.numeric

# exclude unneeded variables
keep <- c("Country", "Edu2.FM", "Labour.FM", "Edu.Expected", "GNI", "Maternal.Mortality", "Percent.Parliament")
human <- select(human, one_of(keep))

# remove rows with NA values
human <- filter(human, complete.cases(human))


# Excluding observations
# ---------------------

# read data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
human$GNI <- gsub(",", "", human$GNI) %>% as.numeric
keep <- c("Country", "Edu2.FM", "Labour.FM", "Edu.Expected", "GNI", "Maternal.Mortality", "Percent.Parliament")
human <- select(human, one_of(keep))
human <- filter(human, complete.cases(human))

# add countries as rownames
rownames(human) <- human$Country

# look at the last 10 observations
tail(human, 10)

# keep everything but the last 7 observations
n_last <- nrow(human) - 7
human <- human[1:n_last, ]


# Exlore
# ------
# modified data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human2.txt", sep  =",", header = T)

# remove the Country variable
human <- select(human, -Country)

# Access GGally
library(GGally)

# draw a generalised pairs plot of the data
ggpairs(human)


# pca 
#---

# center
human <- scale(human)

# pca
pc <- prcomp(human_)

# plot
library(ggfortify)
autoplot(pc, data = human_, label = T, loadings =T, loadings.label  = T, label.size = 2.5, size = 0, loadings.label.size = 6)
