




hoods = data.frame(t(nbhd$Neighborhood))
colnames(hoods) <- nbhd$Name
library(bslib)

? validColors
shinyUI(
  dashboardPage(
    skin = "yellow",
    
    dashboardHeader(title = "AMES, IA"),
    dashboardSidebar(sidebarMenu(
      menuItem(
        "Info",
        tabName = "Info",
        icon = icon("info", lib = "font-awesome")
      ),
      menuItem(
        "Map",
        tabName = "Map",
        icon = icon("map-marked-alt", lib = "font-awesome")
      ),
      menuItem(
        "Analysis",
        tabName = "Analysis",
        icon = icon("chart-area", lib = "font-awesome")
      ),
      menuItem(
        "Predictions",
        tabName = "Predictions",
        icon = icon("dollar-sign", lib = "font-awesome")
      )
    )),
    dashboardBody(
      tags$head(
        tags$style(
          HTML(
            '
      .main-header .logo {
        font-family: "Roboto", Roboto, "Roboto", serif;
        font-weight: medium;
        font-size: 24px;
      }


      .box.box-solid.box-danger>.box-header {
  color:#9966ff;
  background:#9966ff
                    }

.box.box-solid.box-danger{
border-bottom-color:#534666;
border-left-color:#534666;
border-right-color:#534666;
border-top-color:#534666;
}

.box.box-danger>.box-header {
  color:#fff;
  background:#534666
                    }

.box.box-danger{
border-bottom-color:#534666;
border-left-color:#534666;
border-right-color:#534666;
border-top-color:#534666;
#background: #FFFFFF;
}

.box.box-solid.box-info>.box-header {
  color:#000000;
  background:#534666
                    }

.box.box-solid.box-info{
border-bottom-color:#FFAE66;
border-left-color:#FFAE66;
border-right-color:#FFAE66;
border-top-color:#FFAE66;
}

.box.box-info>.box-header {
  color:#fff;
  background:#534666
                    }

.box.box-info{
border-bottom-color:#FFAE66;
border-left-color:#FFAE66;
border-right-color:#FFAE66;
border-top-color:#FFAE66;
background: #FFAE66;
}

    ')
        )
      ),
      
      
      #info box
      tabItems(
        tabItem
        (tabName = "info",
          fluidRow(
            column(
              width = 3,
              infoBox
              (
                "testing",
                title = h4("Neighborhood"),
                "Lets see if this works",
                color = "black",
                width = 12
              ),
              infoBoxOutput("AmesInfoBox")
            )
          )),
        
        
        
        tabItem
        (tabName = "Map",
          fluidRow(
            column(
              width = 3,
              box
              (
                title = h4("Neighborhood"),
                
                status = "danger",
                width = 12,
                selectInput
                (
                  "hood",
                  label = NULL,
                  choices = c('All' , hoods),
                  multiple = TRUE,
                  selected = "All"
                )
              ),
              box
              (
                title = h4("Price Range"),
                solidHeader = TRUE,
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
                  value = 4
                )
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
                  value = c(0, 5000),
                  step = 200,
                  round = 2
                )
              ),
              box
              (
                title = h4("Building Type"),
                width = 12,
                
                checkboxGroupInput(
                  "BldgType",
                  
                  label = NULL,
                  selected = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"),
                  choiceNames = c(
                    "Single Family",
                    "2-Family",
                    "Duplex",
                    "Townhouse(Inside)",
                    "Townhouse(End)"
                  ),
                  choiceValues = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"),
                  
                  inline = TRUE
                )
              ),
              box
              (
                title = h4("Age"),
                width = 12,
                sliderInput
                (
                  "age",
                  label = NULL,
                  min = 0,
                  max = 100,
                  value = c(0, 100),
                  sep = "",
                  step = 1
                )
                
              )
            ),
            column
            (width = 9,
              box
              (
                title = h3("Map of Ames, IA"),
                girafeOutput("Amesmap", width = "90%", height = "90%"),
                width = 12
              ))
          )),
        tabItem
        (tabName = "Analysis",
          fluidRow
          (
            column
            (width = 3,
              box
              (
                title = h4("Neighborhood"),
                width = 12,
                selectInput
                (
                  input = "hood_analysis",
                  label = NULL,
                  choices = c('All' , hoods),
                  multiple = FALSE,
                  selected = "All"
                )
              )),
            column(
              width = 9,
              box
              (width = 6,
                plotOutput("price_sqft")),
              box
              (width = 6,
                plotOutput("price_qual")),
              box
              (width = 6,
                plotOutput("density")),
              box
              (width = 6,
                plotOutput("prediction"))
            )
          ))
      )
    )
  )
)
