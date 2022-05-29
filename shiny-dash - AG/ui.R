











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
        tabItem(
          tabName = "Info",
          #h2("Ames, IOWA"),
          
          fluidRow(
            box
            (
              class = "text-left",
              title = h2("MACHINE LEARNING = THE FUTURE OF REAL ESTATE"),
              img(
                src = "Screenshot 2022-05-28 204005.jpg",
                height = "530px",
                width = "80%"
              ),
              br(),
              width = 9,
              height = "500px"
            ),
            
            flipBox(
              id = "myflipbox2",
              width = 3,
              front = div(
                class = "text-center",
                h2("Ames, IOWA"),
                img(
                  src = "Ames_Montage.JPG",
                  height = "90%",
                  width = "90%"
                )
              ),
              back = div(
                class = "text-left",
                height = "800px",
                width = "100%",
                h2("Ames, Iowa"),
                p(
                  "Ames (/eɪmz/) is a city in Story County, Iowa, United States, located approximately 30 miles (48 km) north of
                      Des Moines in central Iowa. It is best known as the home of Iowa State University (ISU), with
                      leading agriculture, design, engineering, and veterinary medicine colleges. A United States Department of Energy national laboratory,
                      Ames Laboratory, is located on the ISU campus.",
                  br(),
                  br(),
                  
                  "According to the 2020 census, Ames had a population of 66,427, making it the state's ninth largest city.
                        Iowa State University was home to 33,391 students as of fall 2019, which make up approximately one half of
                        the city's population.",
                  br(),
                  br(),
                  
                  "Ames also hosts United States Department of Agriculture (USDA) sites: the largest federal animal disease center
                        in the United States, USDA's Agricultural Research Service's National Animal Disease Center (NADC), as well as,
                        one of two national USDA sites for the Animal and Plant Health Inspection Service (APHIS), which comprises the National
                        Veterinary Services Laboratory and the Center for Veterinary Biologics. Ames also hosts the headquarters for the Iowa
                        Department of Transportation."
                )
              )
            )
          ),
          
          fluidRow(
            userBox(
              width = 3,
              title = userDescription(
                title = "Alex",
                subtitle = "user title",
                type = 1,
                image = "IMG_4575.JPG"
              ),
              status = NULL,
              gradient = TRUE,
              background = "light-blue",
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("Alex Galczak"),
                p(
                  "Brief Description lslajdkahfkdafsjflksjlckjsljc
                        jdflksjflksjfljkslkjfclks
                        jflsjflksjflkjsjf
                        fslkjfdlksjflksj
                        sjflkdjflksfjlj"
                )
              )
              #footer = FALSE
            ),
            
            userBox(
              width = 3,
              title = userDescription(
                title = "Chad Loh",
                subtitle = "user title",
                type = 1,
                image = "image"
              ),
              status = "warning",
              #gradient = TRUE,
              #background = "light-blue",
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("Chad Loh"),
                p(
                  "Brief Description lslajdkahfkdafsjflksjlckjsljc
                        jdflksjflksjfljkslkjfclks
                        jflsjflksjflkjsjf
                        fslkjfdlksjflksj
                        sjflkdjflksfjlj"
                )
              )
              #footer = FALSE
            ),
            
            
            userBox(
              width = 3,
              title = userDescription(
                title = "Michelle",
                subtitle = "user title",
                type = 2,
                image = "IMG_4575.JPG"
              ),
              status = "purple",
              #gradient = TRUE,
              #background = "light-blue",
              boxToolSize = "not sure what this does",
              "something",
              
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("Chad Loh"),
                p(
                  "Brief Description lslajdkahfkdafsjflksjlckjsljc
                        jdflksjflksjfljkslkjfclks
                        jflsjflksjflkjsjf
                        fslkjfdlksjflksj
                        sjflkdjflksfjlj"
                )
              )
              #footer = FALSE
            ),
            
            
            userBox(
              width = 3,
              title = userDescription(
                title = "James",
                subtitle = "user title",
                type = 1,
                image = "image"
              ),
              status = "black",
              #gradient = TRUE,
              #background = "light-blue",
              boxToolSize = "not sure what this does",
              "something",
              
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("Chad Loh"),
                p(
                  "Brief Description lslajdkahfkdafsjflksjlckjsljc
                        jdflksjflksjfljkslkjfclks
                        jflsjflksjflkjsjf
                        fslkjfdlksjflksj
                        sjflkdjflksfjlj"
                )
              )
              #footer = FALSE
            )
          )
        ),
        
        
        tabItem
        (
          tabName = "Map",
          
          fluidRow(
            height = "400px",
            
            box
            (
              title = h4("Neighborhood"),
              status = "success",
              solidHeader=TRUE,
              width = 3,
              height = "200px",
              selectInput
              (
                "hood",
                label = NULL,
                choices = c('All' , hoods),
                multiple = TRUE,
                selected = "NAmes"
              )
            ),
            
            
            box
            (
              title = h4("Price Range"),
              solidHeader = TRUE,
              width = 3,
              height = "150px",
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
            
            

            tabBox(
              title = h4("House Properties"),
              width = 3,
              height = "200px",
              side = "right",
              id = "houseprop",
              
              
              tabPanel(
                title = "Baths",
                "Select number of Bathrooms",
                sliderInput(
                  "FullBath",
                  label = NULL,
                  min = 0,
                  max = 5,
                  value = c(0, 5)
                )
              ),
              
              
              
              tabPanel(
                title = "Beds",
                "Select number of bedrooms",
                sliderInput(
                  "BedroomAbvGr",
                  label = NULL,
                  min = 0,
                  max = 5,
                  value = c(0, 5)
                )
              ),
              
              
              
              tabPanel(
                title = "Area",
                "Select desired area",
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
              
              
            ),
            
            tabBox(
              title = h4("Other filters"),
              width = 3,
              height = "200px",
              side = "right",
              id = "houseprop",
              
              tabPanel(
                title = "Building Type",
                "Select Buidling Type",
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
              
              tabPanel(
                title = "Year Built",
                "Select Year Built",
                width = 12,
                sliderInput
                (
                  "age",
                  label = NULL,
                  min = 1870,
                  max = max(house_price$YearBuilt),
                  value = c(1870, 2010),
                  sep = "",
                  step = 5
                )
              )
            ),
            
            
            fluidRow
            (width = 12,
              box
              (
                #title =NULL,
                girafeOutput("Amesmap", width = "90%", height = "90%"),
                width = 12
              ))
          )
        ),
        
        
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
                  selected = "Blmngtn"
                )
              )),
            column(
              width = 12,
              box
              (
                title = h4("Neighborhood Price Distribution"),
                width = 4,
                plotOutput("density")
              ),
              box
              (width = 4,
                plotOutput("price_qual")),
              box
              (width = 4,
                plotOutput("price_sqft")),
              box
              (width = 4,
                plotOutput("buildingtype")),
              box
              (width = 4,
                plotOutput("beds")),
              box
              (width = 4,
                plotOutput("temp"))
            )
          )),
        
        
        
        
        tabItem(
          tabName = "Predictions",
          fluidRow
          (
              box
              (
                title = h4("Neighborhood"),
                width = 3,
                selectInput
                (
                  input = "hood_prediction",
                  label = NULL,
                  choices = c('All' , hoods),
                  multiple = FALSE,
                  selected = "Blmngtn")),
            
            tabBox(
              title = h4("House Properties"),
              width = 3,
              height = "150px",
              side = "right",
              id = "houseprop",
              
              
              tabPanel(
                title = "Baths",
                "Select number of Bathrooms",
                sliderInput(
                  "FullBath",
                  label = NULL,
                  min = 0,
                  max = 5,
                  value = c(0, 5)
                )
              ),
              
              
              
              tabPanel(
                title = "Beds",
                "Select number of bedrooms",
                sliderInput(
                  "BedroomAbvGr",
                  label = NULL,
                  min = 0,
                  max = 5,
                  value = c(0, 5)
                )
              ),
              
              
              
              tabPanel(
                title = "Area",
                "Select desired area",
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
              
              
            ),
            
            tabBox(
              title = h4("Other filters"),
              width = 3,
              height = "150px",
              side = "right",
              id = "houseprop",
              
              tabPanel(
                title = "Building Type",
                "Select Buidling Type",
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
              
              tabPanel(
                title = "Year Built",
                "Select Year Built",
                width = 12,
                sliderInput
                (
                  "age",
                  label = NULL,
                  min = 1870,
                  max = max(house_price$YearBuilt),
                  value = c(1870, 2010),
                  sep = "",
                  step = 5
                )
              )
            ),
            
            
            
              
              
              box
              (width = 12,
                plotOutput("prediction"))
              
              
              
              
              
              
            )
          )
          
          
          
        )
        
        
        
        
        
      )
    )
  )

