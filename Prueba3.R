install.packages("dplyr")
library(dplyr)
bdcov <- read.csv("casos_covid.csv")
View(bdcov)
bdcov <- bdcov[bdcov$ENTIDAD_NAC != 1:26,]
