# format credit card data for iods course
# description of the data is here: https://www.kaggle.com/dalpozz/creditcardfraud
# Please cite: Andrea Dal Pozzolo, Olivier Caelen, Reid A. Johnson and Gianluca Bontempi

creditcard <- read.csv("creditcard.csv", header = T)

# split the data to frauds and nonfrauds
cc_split <- by(creditcard, creditcard$Class, FUN = function(df) df)

# use only a sample of the nonfrauds
library(dplyr)
frauds <- cc_split$`1`
nonfrauds <- sample_n(cc_split$`0`, 10000 - nrow(frauds))

# combine back together
cc <- rbind(frauds, nonfrauds)

# random order
cc <- cc[sample(nrow(cc)),]
rownames(cc) <- 1:nrow(cc)

# distribution of frauds and nonfrauds
table(cc$Class)

plot(cc$V1, cc$V2, col = cc$Class + 3)

# save 
write.csv(file = "cc.csv", cc, row.names = F)
