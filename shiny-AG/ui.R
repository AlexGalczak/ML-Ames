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
hoods = data.frame(t(nbhd$Neighborhood))
colnames(hoods) <- nbhd$Name
library(bslib)


shinyUI(
  fluidPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  
  # Application title
  titlePanel("Ames Housing Price Prediction"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      #searchbox for neighborhood/ dropdown
      
      selectInput(input = "hood",
      
      #(input = (if hood == "All" {hood = c("Blmngtn","Blueste", "BrDale")} else {hood = hood}), 
                  
                  label = h4("Neighborhood"), 
                  choices = hoods,
                  selected = "OldTown"),
      
      
      #price distribution hist/density output slider underneath the graph
      
      sliderInput(input = "price",
                  label = h5("Price"),
                  min = min(df$SalePrice),
                  max = max(df$SalePrice),
                  value = c(100000, 120000), sep = "",
                  round = 4),
      
      sliderInput(input = "BedroomAbvGr",
                    label = h5("Number of Bedrooms"),
                  min = 0,
                  max = 5,
                  value = 2),
      
      sliderInput(input = "FullBath",
                  label = h5("# of Bathrooms"),
                  min = 0,
                  max = 3,
                  value = 1),
      
      sliderInput(input = "GrLivArea",
                  label = h5("Total Area (sqft)"),
                  min = 0,
                  max = 5000,
                  value = c(500,1000),
                  step = 200,
                  round = 2),
      
      #price distribution density output slider underneath the graph for living area
    
      #year built slider
      
      #price prediction input 
      
      radioButtons(input = "BldgType",
                     label = h4("Building Type"),
                     choices = unique(df$BldgType))
      
      #radioButtons("dist", "dist type",
      #             c("normal"= "norm", "a"="a", "b"="b"))
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      girafeOutput("Amesmap", width = "90%", height = "90%"),
      
    mainPanel(  
      tabsetPanel(
        tabPanel("Price Prediction"),
        tabPanel("EDA"),
        tabPanel("Additional Info"))
      )
    )
  )
))
