


library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(rsconnect)
#library(extrafont)
#library(extrafontdb)
#library(Rttf2pt1)
#library(remotes)



library(tidyverse)
library(osmdata)
library(sf)
library(ggmap)
library(ggrepel)
library(ggiraph)
library(fontawesome)
library(reshape2)
library(bslib)
library(ggridges)
library(viridis)
library(hrbrthemes)
library(ggExtra)
library(RColorBrewer)
library(ggthemes)






options(scipen=10000)



load("ames_mapdata.RData")
df <- as.data.frame(read.csv("Ames_HousePrice_df.csv"))
nbhd <- as.data.frame(read.csv("Ames_HousePrice_nbhd.csv"))
neighborhoods <- as.data.frame(read.csv("neighborhoods.csv"))
house_price <- data.frame(read.csv('Ames_HousePrice_cleaned_new.csv'))
clean_dummy <- read.csv('cleaned_dummies.csv')
coef <- read.csv('shinycoeff.csv')


