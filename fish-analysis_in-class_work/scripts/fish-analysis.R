# github repository
# https://github.com/course-fish274-2021/Cece-sharks


# Loading in the data & needed packages
fish_data <- read.csv("fish-analysis_in-class_work/data/Gaeta_etal_CLC_data_1.csv")
library(dplyr)
library(ggplot2)


# Adding column to denote if fish is big or small, using 300 as a cutoff (command: mutate)
# Removed any fish with a scale length less than 1mm from data (command: filter)
fish_data_cat <- fish_data %>%
  filter(scalelength > 1) %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))


# Plot code - from GitHub pull 
ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(bins=80)


# Save plot as a picture
ggsave("scale_hist_by_length.jpg")


