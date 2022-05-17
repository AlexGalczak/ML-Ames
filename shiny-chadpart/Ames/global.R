library(shiny)
library(shinydashboard)
library(tidyverse)
library(osmdata)
library(sf)
library(ggmap)


load("ames_mapdata.RData")
df <- as.data.frame(read.csv("Ames_HousePrice_df.csv"))
nbhd <- as.data.frame(read.csv("Ames_HousePrice_nbhd.csv"))

