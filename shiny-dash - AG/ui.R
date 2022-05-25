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

?validColors
shinyUI(
  dashboardPage(skin="black",

    dashboardHeader(title = "AMES, IA"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Map", tabName = "Map", icon= icon("map-marked-alt", lib="font-awesome")),
        menuItem("Analysis", tabName = "Analysis", icon= icon("chart-area", lib="font-awesome")),
        menuItem("Predictions", tabName= "Predictions", icon= icon("dollar-sign", lib="font-awesome")))
    ),
    dashboardBody(
      
      tags$head(tags$style(HTML('
      .main-header .logo {
        font-family: "Georgia", Times, "Times New Roman", serif;
        font-weight: bold;
        font-size: 24px;
      }
    '))),
      
      tabItems(
        tabItem
        (
          tabName = "Map",
          fluidRow(
            column(
              width =3,
              box
              (
                title = h4("Neighborhood"),

                color = "black",
                width = 12,
                selectInput
                (
                  "hood",
                  label = NULL,
                  choices = c('All' , hoods),           
                  multiple = TRUE,
                  selected = "All")
              ),
              box
              (
                title = h4("Price Range"), status = "primary", solidHeader = TRUE,
                collapsible = TRUE, color = "black",
                width = 12,
                sliderInput
                (
                  "price",
                  label = NULL,
                  min = 0,
                  max = 800000,
                  value = c(0, 800000), 
                  sep = "",
                  step = 10000,
                  round = 4
                )
              ),
              box
              (
                title = h4("Number of Bedrooms"),
                width = 12,
                sliderInput
                (
                  "BedroomAbvGr",
                  label = NULL,
                  min = 0,
                  max = 5,
                  value = 5
                )
              ),
              box
              (
                title = h4("Number of Bathrooms"),
                
                width = 12,
                sliderInput
                (
                  "FullBath",
                  label = NULL,
                  min = 0,
                  max = 4,
                  value = 4)
              ),
              box
              (
                title = h4("Total Area (sqft)"),
                width = 12,
                sliderInput
                (
                  "GrLivArea",
                  
                  label = NULL,
                  min = 0,
                  max = 5000,
                  value = c(0,5000), 
                  step = 200,
                  round = 2)
              ),
              box
              (
                title = h4("Building Type"),
                width = 12,
                
                checkboxGroupInput("BldgType",
                             
                             label = NULL,
                             selected = c("1Fam","2fmCon","Duplex","Twnhs","TwnhsE"),
                             choiceNames = c("Single Family","2-Family", "Duplex", "Townhouse(Inside)","Townhouse(End)"),
                             choiceValues = c("1Fam","2fmCon","Duplex","Twnhs","TwnhsE"),
                             
                             inline = TRUE)
              )
            ),
            column
            (
              width = 9,
              box
              (
                title = h3("Map of Ames, IA"),
                girafeOutput("Amesmap", width = "90%", height = "90%"),  width = 12
              )
            )
          )
        ),
        tabItem
        (
          tabName = "Analysis",
          fluidRow
          (
            column
            (
              width = 3,
              box
              (
                title = h4("Neighborhood"),
                width =12,
                selectInput
                (
                  input = "hood_analysis",
                  label = NULL, 
                  choices = c('All' , hoods), 
                  multiple = FALSE,
                  selected = "All")
              )
            ),
            column(
              width = 9,
              box
              (
                width = 6,
                plotOutput("price_sqft")
              ),
              box
              (
                width = 6,
                plotOutput("price_qual")
              ),
              box
              (
                width = 6,
                plotOutput("density")
              ),
              box
              (
                width = 6,
                plotOutput("prediction")
              )
            )
          )
        )
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

