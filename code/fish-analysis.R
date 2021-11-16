# Loading in the data & needed packages
fish_data <- read.csv("data/Gaeta_etal_CLC_data_1.csv")
library(dplyr)
library(ggplot2)

# Adding column to denote if fish is big or small, using 300 as a cutoff
fish_data_cat <- fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))
