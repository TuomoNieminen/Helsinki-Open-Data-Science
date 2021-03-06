# --------------------
# access dplyr
library(dplyr)


# Meet the human development data
# ------------------

# read data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)

# deal with comma  separator for thousand (GNI variable)
human$GNI <- gsub(",","",human$GNI) %>% as.numeric


# Dealing with NA values
# ---------------------

# exclude unneeded variables
keep <- c("Country", "Edu2.FM", "Labour.FM", "Edu.Expect","Life.Expect", "GNI", "Matern.Mortal", "Adolesc.Birth","Parliament.F")
human <- select(human, one_of(keep))

# remove rows with NA values
human <- filter(human, complete.cases(human))


# Removing observations
# ---------------------

# add countries as rownames
rownames(human) <- human$Country

tail(human)

# remove last 7 rows
n_last <- nrow(human) - 7
human <- human[1:n_last, ]

# remove the Country variable
human <- select(human, -Country)


# modified data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human2.txt", sep  =",", header = T)


# exlore
library(GGally)
ggpairs(human)


# pca 
#---

# center
human_ <- scale(human)

# pca
pc <- prcomp(human_)

# plot
library(ggfortify)
autoplot(pc, data = human_, label = T, loadings =T, loadings.label  = T, label.size = 2.5, size = 0, loadings.label.size = 6)
