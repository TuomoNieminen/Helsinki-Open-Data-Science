# Boston data lda
# Emma Kamarainen 2017

library(MASS)

# load
data("Boston")

# look at the dataset
pairs(Boston)
summary(Boston)

# center and standardize variables
b <- as.data.frame(scale(Boston))

# crim to categorical
summary(b$crim)
crime <- cut(b$crim, quantile(b$crim), include.lowest = TRUE, 
             labels = "low", "med_low", "med_high", "high")

# remove original
b <- dplyr::select(b, -crim)

# combine
b <- data.frame(b, crime)

# lda

# http://stackoverflow.com/questions/17232251/how-can-i-plot-a-biplot-for-lda-in-r
lda.arrows <- function(x, myscale = 1, color='red', tex = 0.75, choices = c(1,2), ...){
  ## adds `biplot` arrows to an lda using the discriminant function values
  heads <- coef(x)
  arrows(x0 = 0, y0 = 0, 
         x1 = myscale * heads[,choices[1]], 
         y1 = myscale * heads[,choices[2]], col=color, ...)
  text(myscale * heads[,choices], labels = row.names(heads), 
       cex = tex, col=color)
}

lda.fit = lda(crime~., data=b)
plot(lda.fit, col=as.numeric(b$crime), pch=as.numeric(b$crime))
lda.fit

df <- dplyr::select(b,-crime)
dim(df)
dim(lda.fit$scaling)

MM <- as.matrix(df) %*% lda.fit$scaling
plot(MM, col=as.numeric(b$crime), pch=as.numeric(b$crime))
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