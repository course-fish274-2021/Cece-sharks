# CODE FOR CECE-SHARKS PROJECT
# BASED ON DATA FROM AUSTRALIAN SHARK INCIDENT DATABASE

# R-packages required (copied from original database README file)
  # *** Uncomment following install.packages lines if you need to install ***
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("forcats")
# install.packages("leaflet")
# install.packages("viridis")
# install.packages("scales")
# install.packages("ggmap")
# install.packages("gridExtra")
# install.packages("rgdal")
# install.packages("magrittr")
# install.packages("tibble")
# install.packages("ozmaps")
# install.packages("ggpubr")
#install.packages("rmarkdown")

library(ggplot2)
library(dplyr)
# library(forcats)
# library(leaflet)
# library(viridis)
# library(scales)
# library(ggmap)
# library(gridExtra)
# library(rgdal)
# library(magrittr)
# library(tibble)
# library(ozmaps)
# library(ggpubr)
# library(rmarkdown)

# Adding in data
top_sharks <- read.csv("AustralianSharkIncidentDatabase-main/data/top.sharks.csv")

# Answering the questions 
  # 1. Is there a correlation between if an attack is provoked and if the person was killed?

filtered_data_recovery <- select(top_sharks, Recovery.status, Provoked.unprovoked)
fatality_data <- filter(filtered_data_recovery, Recovery.status == "fatal", Provoked.unprovoked == c("Provoked", "Unprovoked"))

ggplot(data = fatality_data, mapping = aes(x = Provoked.unprovoked, y = Recovery.status)) +
  geom_bar(stat="identity", color="blue") +
  labs(x= "Provoked or Unprovoked Attack", y= "Human Recovery Status: Fatal")

  # 2. What kind of shark is most likely to participate in a provoked vs an unprovoked attack?

filtered_data_sharks <- select(top_sharks, Shark.common.name, Provoked.unprovoked) %>%
  filter(Provoked.unprovoked == "Provoked" | Provoked.unprovoked == "Unprovoked")

ggplot(data=filtered_data_sharks, mapping = aes(x = Provoked.unprovoked, y = Shark.common.name)) +
  geom_bar(stat="identity", color="red", na.rm=TRUE) +
  theme(axis.ticks.y=element_blank(), axis.text.y=element_blank())+
  labs(x="Provoked or Unprovoked Attack", y = "Shark Type") +
  facet_wrap(~Shark.common.name)




