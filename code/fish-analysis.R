# github repository
# https://github.com/course-fish274-2021/Cece-sharks


# Loading in the data & needed packages
fish_data <- read.csv("data/Gaeta_etal_CLC_data_1.csv")
library(dplyr)
library(ggplot2)


# Adding column to denote if fish is big or small, using 300 as a cutoff (command: mutate)
# Removed any fish with a scalelength less than 1mm from data (command: filter)
fish_data_cat <- fish_data %>%
  filter(scalelength > 1) %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))



