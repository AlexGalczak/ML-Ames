

library(shiny)
library(shinydashboard)
library(tidyverse)
library(osmdata)
library(sf)
library(ggmap)
library(ggrepel)
library(ggiraph)


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



maptest = ggplot()+
  geom_sf(data = city$osm_multipolygons,
          color = "#ffffff",
          fill = "#e6e6e6",
          alpha = 1) +
  geom_sf(data = park$osm_polygons,
          color = "#ffffff",
          fill = "#acc388",
          size = 0,
          alpha = 1) +
  geom_sf(data = water$osm_multipolygons,
          color = "#B2E3EA",
          fill = "#B2E3EA",
          size = 0.5,
          alpha = 1) +
  geom_sf(data = uni$osm_multipolygons,
          color = "#EAD7AF",
          fill = "#EAD7AF",
          size = 0.5,
          alpha = 1) +
  geom_sf(data = road_primary$osm_lines,
          color = "#ebba76",
          alpha = 1,
          size = 1)+
  geom_sf(data = road_secondary$osm_lines,
          color = "#ebba76",
          alpha = 1,
          size = 0.5)+
  xlim(-93.7,-93.52)+
  ylim(41.98,42.08)+
  scale_color_gradientn(limits = c(0,350000),colours=c("navyblue", "darkmagenta", "darkorange1"))+
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        panel.background=element_rect(fill='transparent'),
        panel.border=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank())

#