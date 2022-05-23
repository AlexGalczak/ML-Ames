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
  theme = bs_theme(version = 4, bootswatch = "lux"),
  
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
                  min = 0,
                  max = 800000,
                  value = c(100000, 180000), sep = "",
                  step = 1000,
                  round = 4),
      
      #plotOutput("prediction"),
      
      sliderInput(input = "BedroomAbvGr",
                    label = h5("Number of Bedrooms"),
                  min = 0,
                  max = 5,
                  value = 2),
      
      sliderInput(input = "FullBath",
                  label = h5("Number of Bathrooms"),
                  min = 0,
                  max = 3,
                  value = 1),
      
      sliderInput(input = "GrLivArea",
                  label = h5("Total Area (sqft)"),
                  min = 0,
                  max = 5000,
                  value = c(500,2000),
                  step = 200,
                  round = 2),
      
      #price distribution density output slider underneath the graph for living area
    
      radioButtons(input = "BldgType",
                   label = h5("Building Type"),
                   choiceNames = c("Single Family","Townhouse End Unit" ,"2-Family", "Duplex", "Townhouse Inside Unit"),
                   choiceValues = c("1Fam", "TwnhsE","2fmCon","Duplex","Twnhs"),
                   inline = TRUE),
      
      width = 3),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      titlePanel("AMES, IO"),
      fluidRow(
        girafeOutput("Amesmap", width = "90%", height = "90%")),
      
      titlePanel("Analysis by Neighborhood"),
      fluidRow(  
        tabsetPanel(
          tabPanel("price/sqft per above ground living area", plotOutput("price_sqft",width ="70%", height = 480)),
          tabPanel("price/sqft per quality", plotOutput("price_qual", width = "70%", height = 480)),
          tabPanel("Additional Info")),
    
    mainPanel(
      titlePanel("Price Distribution"),
      fluidRow(
        plotOutput("prediction", width = "70%", height = 480)
      )
    )
      
      
      
    
      )
    )
  )
))
