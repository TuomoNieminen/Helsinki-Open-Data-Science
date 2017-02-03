
newbiplot <- function(pca, choices = 1:2, show_arrows = F, col = 1) {
  # algorithm taken from stats:::biplot.prcomp (and biplot.default)
  scores <- pca$x
  lam <- pca$sdev[choices]
  n <- NROW(scores)
  lam <- lam *sqrt(n)
  x <- t(t(scores[,choices])/lam)
  y <- t(t(pca$rotation[, choices])*lam)
  
  eigenv <- pca$sdev**2
  var_explained <- paste0("(",round(100*(eigenv/sum(eigenv)), 1),"%)")
  colnames(x) <- paste(colnames(x), var_explained[choices])

  unsigned.range <- function(x) c(-abs(min(x, na.rm = TRUE)), 
                                abs(max(x, na.rm = TRUE)))
  rangx1 <- unsigned.range(x[, 1])
  rangx2 <- unsigned.range(x[, 2])
  xlim <- ylim <- range(rangx1, rangx2)

  plot(x, type = "n", xlim = xlim, ylim = ylim)
  points(x, col = col)

  if(show_arrows) {
    rangy1 <- unsigned.range(y[, 1])
    rangy2 <- unsigned.range(y[, 2])
    ratio <- max(rangy1/rangx1, rangy2/rangx2)
    
    par(new = T)

    plot(y, axes = F, type = "n", xlim = xlim*ratio, ylim = ylim*ratio, 
         xlab = "", ylab = "")

    ylabs <- dimnames(y)[[1]]
    text(y, labels = ylabs, cex = 0.8, col = "blue")
    arrows(0, 0, y[, 1L] * 0.8, y[, 2L] * 0.8, col = "red", length = 0.1)
  }
}
