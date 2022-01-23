install.packages("tidyverse")
library(tidyverse)
bdcov <- read.csv("casos_covid.csv")
bdcov

bdcov2 <- bdcov %>% filter(ENTIDAD_RES == "27")
View(bdcov2)


library(dplyr)
bdcov2 <- bdcov2 %>%
  mutate (RESULTADO_LAB = factor(RESULTADO_LAB, levels = C(1,2,3), labels = C('Upper', 'Middle', 'Lower')))


library(caret)

filas.entrenamiento <- createDataPartition(bdcov2$TIPO_PACIENTE, p = 0.7, list = FALSE)

cjuntoEntrenamiento <- bdcov2[filas.entrenamiento,]

cjuntoTest <- bdcov2[-filas.entrenamiento,]

library(rpart)

modeloArbolDecicion <- rpart(
  TIPO_PACIENTE ~.,
  data = bdcov2[filas.entrenamiento,])

modeloArbolDecicion

library(rpart.plot)


rpart.plot(modeloArbolDecicion)

pred_1 <- predict(modeloArbolDecicion, cjuntoTest, type = "class")






