bdcov <- read.csv("casos_covid.csv")
bdcov
library(tidyverse)
bdcov2 <- bdcov %>% filter(ENTIDAD_RES == "27")
View(bdcov2)
     
     library(dplyr)
clean_bdcov2 <- bdcov2 %>%

  
  select(-c(ID_REGISTRO))  %>%
  
  
  mutate (ID_REGISTRO = factor(ID_REGISTRO, levels = C(1,2,3), labels = C('Upper', 'Middle', 'Lower')))
          