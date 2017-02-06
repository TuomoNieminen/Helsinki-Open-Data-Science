
# The Human Development Index (HDI) is a summary measure of achievements 
# in key dimensions of human development
# data from kaggle: https://www.kaggle.com/undp/human-development
# Tuomo Nieminen 2017

# meta
# browseURL("https://www.kaggle.com/undp/human-development")

# libraries
library(dplyr)

# read human develop data
hd <- read.csv("human_development.csv", stringsAsFactors = F)

# rename variables
names(hd) <- c("hdi_rank", "country", "hdi", "life_exp", "edu_exp", "edu_mean", "GNI", "gni_minus_rank")

# deal with comma 1000 separator
hd$GNI <- gsub(",","",hd$GNI) %>% as.numeric

hd <- select(hd, -hdi_rank, - hdi, -gni_minus_rank)

# read gender inequality data
gii <- read.csv("gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

names(gii)

# "GII.Rank"
# "Country"                                     
# "Gender.Inequality.Index..GII."
# "Maternal.Mortality.Ratio"                    
# "Adolescent.Birth.Rate"
# "Percent.Representation.in.Parliament"        
# "Population.with.Secondary.Education..Female."
# "Population.with.Secondary.Education..Male."  
# "Labour.Force.Participation.Rate..Female."
# "Labour.Force.Participation.Rate..Male."      

# rename variables
names(gii) <- c("gii_rank", "country", "gii", "mm_ratio", 
                "adolesc_br", "prc_parl", "edu2_f", "edu2_m", 
                "labour_f", "labour_m")

str(gii)
gii <- mutate(gii, edu2_ratio = edu2_f / edu2_m, odds_labour = labour_f / labour_m)
gii_ <- select(gii, -gii_rank, -gii, -edu2_f, -edu2_m, -labour_f, -labour_m)


# join data
human1 <- inner_join(hd, gii_, by = "country")

tail(human1)

# remove 'World' observation
human2 <- slice(human1, -nrow(human1))

# remove rows with NA values
human3 <- filter(human2, complete.cases(human2))

# add rownames as countries and remove country variable
rownames(human3) <- human3$country

human <- select(human3, -country)


library(GGally)
# ggpairs(human)


# pca 
#---

# center
human_ <- scale(human)

# pca
pc <- prcomp(human_)

# plot
library(ggfortify)
autoplot(pc, data = human_, label = T, loadings =T, loadings.label  = T, label.size = 2.5, size = 0, loadings.label.size = 6)
