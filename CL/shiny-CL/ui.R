hoods = data.frame(t(neighborhoods$Neighborhood))
colnames(hoods) <- neighborhoods$Name

shinyUI(
  fluidPage(
    # includeScript(path = "ames_setting.js"),
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
                    value = 100000)
      ),
      # Show a plot of the generated distribution
      mainPanel(
        girafeOutput("Amesmap", width = "90%", height = "90%")
      )
    )
  )
)
