# Boston data

# https://stat.ethz.ch/R-manual/R-devel/library/MASS/html/Boston.html
library(MASS)

# load
data("Boston")
# scale
boston <- as.data.frame(scale(Boston))

# crim to categorical
crime <- cut(boston$crim, quantile(boston$crim), include.lowest = TRUE, labels = c("low", "med_low", "med_high", "high"))

# remove original
boston <- dplyr::select(boston, -crim)

# combine
boston <- data.frame(boston, crime)

# write output
write.table(boston, "boston_scaled.csv")
