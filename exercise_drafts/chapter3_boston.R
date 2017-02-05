# Boston data lda
# Emma Kamarainen 2017

# https://stat.ethz.ch/R-manual/R-devel/library/MASS/html/Boston.html
library(MASS)

# load
data("Boston")

# look at the dataset
str(Boston)
pairs(Boston)
summary(Boston)

# plot matrix with ggpairs()
p <- ggpairs(Boston, mapping = aes(), 
             upper = list(continuous = wrap("points")), 
             lower = list(continuous = wrap("cor")))
p

# correlations
library(corrplot)
library(tidyverse)
cor_matrix<-cor(Boston) %>% round(digits = 2)
corrplot(cor_matrix, method="circle", type="upper", cl.pos="b", tl.pos="d", tl.cex = 0.6)


# center and standardize variables
boston <- as.data.frame(scale(Boston))

# crim to categorical
summary(boston$crim)
crime <- cut(boston$crim, quantile(boston$crim), include.lowest = TRUE, 
             labels = c("low", "med_low", "med_high", "high"))

# remove original
boston <- dplyr::select(boston, -crim)

# combine
boston <- data.frame(boston, crime)

# lda

# http://stackoverflow.com/questions/17232251/how-can-i-plot-a-biplot-for-lda-in-r
lda.arrows <- function(x, myscale = 1, color='red', tex = 0.75, choices = c(1,2), ...){
  ## adds `biplot` arrows to an lda using the discriminant function values
  heads <- coef(x)
  arrows(x0 = 0, y0 = 0, 
         x1 = myscale * heads[,choices[1]], 
         y1 = myscale * heads[,choices[2]], col=color, ...)
  text(myscale * heads[,choices], labels = row.names(heads), 
       cex = tex, col=color, pos=3)
}

lda.fit = lda(crime ~ ., data=boston)
plot(lda.fit, col=as.numeric(boston$crime), pch=as.numeric(boston$crime))
lda.fit

df <- dplyr::select(boston,-crime)
dim(df)
dim(lda.fit$scaling)

MM <- as.matrix(df) %*% lda.fit$scaling
MM <- as.data.frame(MM)
plot(MM, col=as.numeric(boston$crime), pch=as.numeric(boston$crime))
lda.arrows(lda.fit, myscale = 1)


# 3D plot
# install.packages('plotly')
library(plotly)
d <- as.data.frame(MM)
plot_ly(data=d, x = d$LD1, y = d$LD2, z = d$LD3, color=crime,
        type= 'scatter3d', mode='markers')

# kmeans
# seed
set.seed(13)

# distance matrix
dist<-dist(df)

# number of clusters
library(ggplot2)
k.max <- 10
wss <- sapply(1:k.max, function(k){kmeans(dist, k, nstart=10)$tot.withinss})
qplot(1:k.max, wss, geom = 'line')

km <-kmeans(dist, 4)
# pairs(df, col=km$cluster)
plot_ly(data=d, x=d$LD1, y=d$LD2, z=d$LD3, color=km$cluster,
        type= 'scatter3d', mode='markers')

# kmedoids
library(cluster)
pa <- pam(dist(df), 3)
# pairs(df, col=pa$cluster)
plot_ly(data=d, x=d$LD1, y=d$LD2, z=d$LD3, color=pa$cluster,
        type= 'scatter3d', mode='markers')