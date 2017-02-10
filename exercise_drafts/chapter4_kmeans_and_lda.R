
# helper func
lda.arrows <- function(x, myscale = 1, arrow_heads = 0.1, color = "red", tex = 0.75, choices = c(1,2)){
  heads <- coef(x)
  arrows(x0 = 0, y0 = 0, 
         x1 = myscale * heads[,choices[1]], 
         y1 = myscale * heads[,choices[2]], col=color, length = arrow_heads)
  text(myscale * heads[,choices], labels = row.names(heads), 
       cex = tex, col=color, pos=3)
}

# access MASS
library(MASS)

# access data
data("Boston")

# scale
boston <- scale(Boston)

# distance matrx
d <- dist(boston)

# k-means clustering
km <-kmeans(d, centers = 3)

# lda
lda.fit <- lda(km$cluster~., data = data.frame(boston))

plot(lda.fit, col = km$cluster)
lda.arrows(lda.fit, myscale = 4)
