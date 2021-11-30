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
library(forcats)
library(leaflet)
library(viridis)
library(scales)
library(ggmap)
library(gridExtra)
library(rgdal)
library(magrittr)
library(tibble)
library(ozmaps)
library(ggpubr)
library(rmarkdown)

# Adding in data
top_sharks <- read.csv("AustralianSharkIncidentDatabase-main/data/top.sharks.csv")

# Answering the questions 
# 1. Is there a correlation between if an attack is provoked and if the person was killed?



ggplot(data = top_sharks, mapping = aes(x = Provoked.unprovoked, y = Recovery.status)) +
  geom_point() +
  labs(x= "Provoked or Unprovoked", y= "Human Recovery Status") +
  facet_wrap(~Provoked.unprovoked)
#what i wanna do is count how many people had fatal attacks, injured attacks, and uninjured attacks, and plot those against if the attack was provoked or unprovoked. 


# 2. What kind of shark is most likely to participate in a provoked vs an unprovoked attack?
# need shark & prov/unprov dataset 




