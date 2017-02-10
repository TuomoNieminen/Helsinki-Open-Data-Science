
# The Human Development Index (HDI) is a summary measure of achievements 
# in key dimensions of human development
# data from kaggle: https://www.kaggle.com/undp/human-development
# Tuomo Nieminen 2017

# meta
# ----

# # kaggle
# browseURL("https://www.kaggle.com/undp/human-development")
# 
# # HDI web page technical notes pdf
# browseURL("http://hdr.undp.org/sites/default/files/hdr2015_technical_notes.pdf")

# libraries
library(dplyr)

# data wrangling part 1
# ---------------------

# read human develop and gender inequality data
hd <- read.csv("human_development.csv", stringsAsFactors = F)
gi <- read.csv("gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
# rename variables
names(hd) <- c("HDI.Rank", "Country", "HDI", "Life.Expectancy", "Edu.Expected", "Edu.Mean", "GNI", "GNI.Minus.Rank")
names(gi) <- c("GII.Rank", "Country", "GII", "Maternal.Mortality", 
                "Adolescent.Birth", "Percent.Parliament.F", "Edu2.Female", "Edu2.Male", 
                "Labour.Female", "Labour.Male")
# do a bit of feature engineering
gi <- mutate(gi, Edu2.FM = Edu2.Female / Edu2.Male, Labour.FM = Labour.Female / Labour.Male)
# join data and write to file
human1 <- inner_join(hd, gi, by = "Country")
write.table(file = "human1.txt", human1, sep =",", row.names = F)

# data wrangling part 2
# --------------------
# access dplyr
library(dplyr)

# read data
human <- read.table("human1.txt", sep  =",", header = T)

# deal with comma  separator for thousand (GNI variable)
human$GNI <- gsub(",","",human$GNI) %>% as.numeric

# exclude unneeded variables
keep <- c("Country", "Edu2.FM", "Labour.FM", "Edu.Expected", "GNI", "Maternal.Mortality", "Percent.Parliament.F")
human <- dplyr::select(human, one_of(keep))

# remove rows with NA values
human <- filter(human, complete.cases(human))

# add countries as rownames
rownames(human) <- human$Country

# remove 'World' observation (which is the last row)
n <- nrow(human)
world <- human[n,]
human <- human[-n, ]

# remove the Country variable
human <- dplyr::select(human, -Country)

# save the data (with row.names = T !!)
write.table(file = "human2.txt", human, sep = ",", row.names = T)

# # check that everything is in order
# test <- read.table("human2.txt", sep = ",", header = T)
# str(test)
# head(test)