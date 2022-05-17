#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
load("ames_mapdata.RData")

# Define server logic required to draw a histogram
shinyServer(
  function(input, output) 
    {
    output$Amesmap <- 
      renderPlot(
        ggplot()+
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
                size = 0.5) +
        # geom_sf(data = religion$osm_points,
        #         color = "#EA80B6",
        #         shape=3,
        #         alpha = 0.75) +
        xlim(-93.7,-93.52)+
        ylim(41.98,42.08)+
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
        )
  }
)
