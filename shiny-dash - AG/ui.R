#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define UI for application that draws a histogram
# dashboardPage(
#   dashboardHeader(title = "Ames Housing Price Prediction"),
#   dashboardSidebar(
#     sidebarMenu(
#     menuItem("Map", tabName = 'maps', icon = icon("map")))
#   ),
#   dashboardBody(
#     tabItems(
#       tabItem(tabName = 'map', plotOutput('Amesmap'))
#     )
#   )
# )

#theme = bs_theme(version = 4, bootswatch = "lux")



hoods = data.frame(t(nbhd$Neighborhood))
colnames(hoods) <- nbhd$Name
library(bslib)


shinyUI(
  dashboardPage(

    dashboardHeader(title = "Ames, IOWA"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Map", tabName = "Map"),
        menuItem("EDA", tabName = "Analysis"),
        menuItem("Predictions", tabName= "Predictions"))
    ),
    
    
    dashboardBody(
      tabItems(
        tabItem(tabName = "Map",
                h2("Map of Ames, IOWA"),
                
          fluidRow(
            box(plotOutput("Amesmap", width = "90%", height = "90%"))),
                
          fluidRow( 
            box(selectInput(input = "hood",
                                  label = h4("Neighborhood"), 
                                  choices = hoods,
                                  selected = "OldTown")),
                         
            box(sliderInput(input = "price",
                                         label = h5("Price"),
                                         min = 0,
                                         max = 800000,
                                         value = c(100000, 180000), sep = "",
                                         step = 1000,
                                         round = 4)),
      tabItems(
        tabItem(tabName = "Analysis",
          fluidRow(
            box(plotOutput("price_sqft")),
                  
            box(selectInput(input = "hood",
                                              label = h4("Neighborhood"), 
                                              choices = hoods,
                                              selected = "OldTown"))
                
                
        )))))
      )
    )
  )
)



    
   
   
      
     # titlePanel("Analysis by Neighborhood"),
    #fluidRow(  
     #   tabsetPanel(
      #    tabPanel("price/sqft per above ground living area", plotOutput("price_sqft",width ="70%", height = 480)),
       #   tabPanel("price/sqft per quality", plotOutput("price_qual", width = "70%", height = 480)),
        #  tabPanel("Additional Info")),
    
  #  dashboardBody(
   #   titlePanel("Price Distribution"),
    #  fluidRow(
     #   plotOutput("prediction", width = "70%", height = 480)

