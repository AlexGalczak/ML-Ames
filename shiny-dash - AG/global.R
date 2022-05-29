

library(shiny)
library(shinydashboard)
library(tidyverse)
library(osmdata)
library(sf)
library(ggmap)
library(ggrepel)
library(ggiraph)
library(shinyWidgets)
library(fontawesome)
library(shinydashboardPlus)

?shinydashboardPlus

library(ggridges)
library(viridis)
library(hrbrthemes)
library(ggExtra)
library(RColorBrewer)

options(scipen=10000)

load("ames_mapdata.RData")
df <- as.data.frame(read.csv("Ames_HousePrice_df.csv"))
nbhd <- as.data.frame(read.csv("Ames_HousePrice_nbhd.csv"))
neighborhoods <- as.data.frame(read.csv("neighborhoods.csv"))
house_price <- data.frame(read.csv('Ames_HousePrice_cleaned_new.csv'))
clean_dummy <- read.csv('cleaned_dummies.csv')


