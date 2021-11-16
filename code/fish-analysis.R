# Loading in the data & needed packages
fish_data <- read.csv("data/Gaeta_etal_CLC_data.csv")
library(dplyr)
library(ggplot2)

# Adding column to denote fish is big or small 
fish_data_cat <- fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))
