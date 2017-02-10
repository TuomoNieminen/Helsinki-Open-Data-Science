# preprocess statistic learnign questionsiare data
# Tuomo Nieminen 2017
# Data from Kimmo Vehkalahti

# # meta
# browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-meta.txt")
# 
# # summamuuttujat
# browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS2-meta.txt")
# 
# # Kimmon analyyseja
# browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/Abstract-Vehkalahti.pdf")
# browseURL("http://www.helsinki.fi/~kvehkala/JYTmooc/Kimmo_Vehkalahti_ISI60.pdf")
# 

# read data
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# questions related to learning dimensions
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30", "D06", "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# create combination variables by taking the mean
lrn14$deep <- rowMeans(lrn14[, deep_questions])
lrn14$surf <- rowMeans(lrn14[, surface_questions])
lrn14$stra <- rowMeans(lrn14[, strategic_questions])

# scale attitude
lrn14$attitude <- lrn14$Attitude / 10

# keep selected variables
learning2014 <- lrn14[, c("gender","Age","attitude", "deep", "stra", "surf", "Points")]

# rename some columns
colnames(learning2014)[2] <- "age"
colnames(learning2014)[7] <- "points"

# exclude student who did not attend exams
learning2014 <- learning2014[learning2014$points > 0, ]

# save to file
write.table(learning2014, file = "learning2014.txt", sep = ",", row.names = F)

# learning2014 <- read.table("learning2014.txt", sep = ",", header = T))
# learning2014 <- read.table("https://raw.githubusercontent.com/TuomoNieminen/Helsinki-Open-Data-Science/master/data/learning2014.txt", sep = ",", header = T)
