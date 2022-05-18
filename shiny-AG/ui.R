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



shinyUI(fluidPage(
  
  # Application title
  titlePanel("Ames Housing Price Prediction"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("hood", label = h3("Neighborhood"), 
                  choices = hoods, 
                  selected = "OldTown"),
      sliderInput("price",
                  "Price Prediction",
                  min = 50000,
                  max = 200000,
                  value = 100000),
      
      selectInput("arbitrary cat variable",
                  "Basement size", choices = c("poor", "good", "excellent"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("Amesmap"),
      tabsetPanel(
        tabPanel("Diff Distribution Plots"),
        tabPanel("Tab2"),
        tabPanel("Etc.")
      )
    )
  )
))
