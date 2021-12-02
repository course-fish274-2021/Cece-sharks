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

fatality_data <- select(top_sharks, Recovery.status == "fatal", Provoked.unprovoked)
fatal_provoked <- filter(fatality_data, Recovery.status == "fatal", Provoked.unprovoked == "Provoked")
fatal_unprovoked <- filter(fatality_data, Recovery.status == "fatal", Provoked.unprovoked == "Unprovoked")
fatal_join <- inner_join(fatal_unprovoked, fatal_provoked, by = "Recovery.status")
# i need to join the two by provoked.unprovoked


ggplot(mapping = aes(x = Provoked.unprovoked, y = Recovery.status)) +
  geom_bar(data = fatal_provoked) +
  geom_bar(data = fatal_unprovoked) +
  labs(x= "Provoked or Unprovoked", y= "Human Recovery Status") 


#, mapping = aes(x = Provoked.unprovoked, y = Recovery.status)
#ggplot()+
# geom_histogram (data = bird_join, mapping = aes(x=M_mass), fill = "black", alpha = 0.3, na.rm=TRUE, bins=30)+
#   geom_histogram (data = bird_join, mapping = aes(x=F_mass), fill = "blue", alpha = 0.3, na.rm=TRUE, bins=30)+
#   labs (x = "Mass (g)") +
#   scale_x_log10()+
#   facet_wrap(~Family)


# 2. What kind of shark is most likely to participate in a provoked vs an unprovoked attack?
# need shark & prov/unprov dataset 




