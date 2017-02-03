library(dplyr)

wiki <- read.table("wiki.txt", sep = ",", header = T)
str(wiki)

wiki_ <- cbind(wiki[,1:6], scale(wiki[, 7:ncol(wiki)])) 

summary(wiki_)

# library(MASS)
# ld <- lda(domain ~ ., data = wiki_)
# 
# plot(ld)
library(ggfortify)
pc <- princomp(wiki_[-3])
autoplot(pc, data = wiki_, colour = "domain", loadings = T, loadings.label = T)
