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
        tabItem
        (
          tabName = "Map",
          fluidRow(
            column(
              width =3,
              box
              (
                width = 12,
                selectInput
                (
                  "hood",
                  label = h4("Neighborhood"),
                  choices = c('All' , hoods),            # ifelse(str_detect(place, ", [A-Z][A-Z]$"), hoods),
                  multiple = TRUE,
                  selected = "All")
              ),
              box
              (
                width = 12,
                sliderInput
                (
                  "price",
                  label = h5("Price"),
                  min = 0,
                  max = 800000,
                  value = c(100000, 180000), 
                  sep = "",
                  step = 1000,
                  round = 4
                )
              ),
              box
              (
                width = 12,
                sliderInput
                (
                  "BedroomAbvGr",
                  label = h5("Number of Bedrooms"),
                  min = 0,
                  max = 5,
                  value = 2
                )
              ),
              box
              (
                width = 12,
                sliderInput
                (
                  "FullBath",
                  label = h5("Number of Bathrooms"),
                  min = 0,
                  max = 3,
                  value = 1)
              ),
              box
              (
                width = 12,
                sliderInput
                (
                  "GrLivArea",
                  label = h5("Total Area (sqft)"),
                  min = 0,
                  max = 5000,
                  value = c(500,2000),
                  step = 200,
                  round = 2)
              ),
              box
              (
                width = 12,
                radioButtons("BldgType",
                             label = h5("Building Type"),
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
                width =12,
                selectInput
                (
                  input = "hood_analysis",
                  label = h4("Neighborhood"), 
                  choices = c('All' , hoods), 
                  multiple = TRUE,
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

