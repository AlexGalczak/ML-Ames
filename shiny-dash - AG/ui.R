hoods = data.frame(t(nbhd$Neighborhood))
colnames(hoods) <- nbhd$Name


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
        font-family: "Helvetica", "Roboto", "Arial", san-serif;
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
              title = "MACHINE LEARNING = THE FUTURE OF REAL ESTATE",
              img(
                src = "Screenshot 2022-05-28 204005.jpg",
                width = "80%"
              ),
              width = 9,
              style = "height:500px"
            ),
            
            box(
              width = 3,
              style = "height:500px",
              title = "Ames, Iowa",
              flipBox(
                id = "myflipbox2",
                width = 12,
                front = div(
                  class = "text-center",
                  width = "100%",
                  img(
                    src = "Ames_Montage.JPG",
                    width = "80%"
                  )
                ),
                back = div(
                  class = "text-left",
                  width = "100%",
                  p(
                    "Ames (/eɪmz/) is a city in Story County, Iowa, United States, located approximately 30 miles (48 km) north of
                    Des Moines in central Iowa. It is best known as the home of Iowa State University (ISU), with
                    leading agriculture, design, engineering, and veterinary medicine colleges. A United States Department of Energy national laboratory,
                    Ames Laboratory, is located on the ISU campus."),
                  br(),
                  p("According to the 2020 census, Ames had a population of 66,427, making it the state's ninth largest city.
                    Iowa State University was home to 33,391 students as of fall 2019, which make up approximately one half of
                    the city's population."),
                  # br(),
                  # p("Ames also hosts United States Department of Agriculture (USDA) sites: the largest federal animal disease center
                  #   in the United States, USDA's Agricultural Research Service's National Animal Disease Center (NADC), as well as,
                  #   one of two national USDA sites for the Animal and Plant Health Inspection Service (APHIS), which comprises the National
                  #   Veterinary Services Laboratory and the Center for Veterinary Biologics. Ames also hosts the headquarters for the Iowa
                  #   Department of Transportation.")
                  )
                )
              )
            ),
          
          fluidRow(
            userBox(
              width = 3,
              title = userDescription(
                title = "Alex",
                type = 1,
                image = "alex_crop.JPG"
              ),
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("Alex Galczak"),
                h6("Data Science Fellow"),
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
                title = "Chad",
                type = 1,
                image = "chad.png"
              ),
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("Chad Loh"),
                h6("Data Science Fellow"),
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
                type = 1,
                image = "IMG_4575.JPG"
              ),
              
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("Michelle Bui"),
                h6("Data Science Fellow"),
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
                type = 1,
                image = "image"
              ),
              
              div(
                class = "text-left",
                height = "100%",
                width = "100%",
                h4("James Reno"),
                h6("Data Science Fellow"),
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
            box
            (
              title = "Neighborhood",
              solidHeader = TRUE,
              width = 3,
              style = "height:120px",
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
              title = "Price Range",
              solidHeader = TRUE,
              width = 3,
              style = "height:120px",
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
              title = "House Properties",
              width = 3,
              height = "160px",
              side = "right",
              id = "houseprop",
              
              
              tabPanel(
                title = "Baths",
                "Select number of Bathrooms",
                sliderInput("FullBath",label = NULL,min = 0,max = 5,value = c(0, 5))),
              
              tabPanel(
                title = "Beds",
                "Select number of bedrooms",
                sliderInput("BedroomAbvGr",label = NULL,min = 0,max = 5,value = c(0, 5))),
              
              tabPanel(
                title = "Area",
                "Select desired area",
                sliderInput("GrLivArea",label = NULL,min = 0,max = 5000,value = c(0, 5000),step = 200,round = 2)),
            ),
            
            tabBox(
              title = "Other filters",
              width = 3,
              height = "160px",
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
            (
              box
              (
                girafeOutput("Amesmap", width = "90%", height = "90%"),
                width = 12
              )
            )
          )
        ),
        
        
        tabItem
        (tabName = "Analysis",
          fluidRow
          (
            box
            (
              title = "Neighborhood",
              width = 12,
              selectInput
              (
                input = "hood_analysis",
                label = NULL,
                choices = c(hoods),
                multiple = FALSE,
                selected = "Blmngtn"
              )
            ),
            box
            (width = 6,
              title = 'Price Distribution of Neighbourhood',
              plotOutput("density")),
            box
            (width = 6,
              title = "Quality by Sq Ft Price",
              plotOutput("price_qual")),
            box
            (width = 6,
              title = "Sq Ft Price by Above Ground Living Area",
              plotOutput("price_sqft")),
            box
            (width = 6,
              title = 'Price by House Building Type',
              plotOutput("buildingtype")
              )
            )
          ),
        
        
        tabItem(
          tabName = "Predictions",
          fluidRow
          (
            box(
              title = "Neighborhood",
              width = 4,
              style = "height:120px",
              selectInput
              (
                input = "hood_prediction",
                label = NULL,
                choices = c('All' , hoods),
                multiple = FALSE,
                selected = "Blmngtn"
              )
            ),
            tabBox(
              title = "House Properties",
              width = 4,
              height = "120px",
              side = "right",
              id = "houseprop",
              
              
              tabPanel(
                title = "Baths",
                "Select number of Bathrooms",
                sliderInput(
                  "FullBath_prediction",
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
                  "BedroomAbvGr_prediction",
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
                  "GrLivArea_prediction",
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
              title = "Other filters",
              width = 4,
              height = "120px",
              side = "right",
              id = "houseprop",
              
              tabPanel(
                title = "Building Type",
                "Select Buidling Type",
                checkboxGroupInput(
                  "BldgType_prediction",
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
                sliderInput
                (
                  "age_prediction",
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
              plotOutput("prediction")
              )
            )
          )
        )
      )
    )
  )

