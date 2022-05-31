hoods = data.frame(t(nbhd$Neighborhood))
colnames(hoods) <- nbhd$Name


shinyUI(
  dashboardPage(
    skin = "yellow",
    
    dashboardHeader(title = "AMES, IA"),
    

# Menu Items in the Sidebar -----------------------------------------------

    
    dashboardSidebar(sidebarMenu(

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
      ),
      menuItem(
        "Info",
        tabName = "Info",
        icon = icon("info", lib = "font-awesome")
      )
    )),



    dashboardBody(


# Information page - Info tab from side bar -------------------------------

      tabItems(
        tabItem(
          tabName = "Info",


# Info Section about ML ---------------------------------------------------

          
          
          fluidRow(
            column(width = 6,
                   box(
                     class = "text-left",
                     title = "Price Prediction Model Exploration",
                     img(
                       src = "Screenshot 2022-05-28 204005.jpg",
                       width = "80%",
                       height = "80%"
                     ),
                     width = 12,
                     style = "height:500px"
                   )),
            
            

# Info Section about AMES -------------------------------------------------

            
            column(width = 3,
                   box(
                     width = 12,
                     style = "height:500px",
                     title = "Ames, Iowa",
                     flipBox(
                       id = "myflipbox2",
                       width = 12,
                       front = div(
                         class = "text-center",
                         width = "100%",
                         img(src = "Ames_Montage.JPG",
                             width = "80%")
                       ),
                       back = div(
                         class = "text-left",
                         width = "100%",
                         p(
                           "Ames (/eɪmz/) is a city in Story County, Iowa, United States, located approximately 30 miles (48 km) north of
                    Des Moines in central Iowa. It is best known as the home of Iowa State University (ISU), with
                    leading agriculture, design, engineering, and veterinary medicine colleges. A United States Department of Energy national laboratory,
                    Ames Laboratory, is located on the ISU campus."
                         ),
                         br(),
                         p(
                           "According to the 2020 census, Ames had a population of 66,427, making it the state's ninth largest city.
                    Iowa State University was home to 33,391 students as of fall 2019, which make up approximately one half of
                    the city's population."
                         ),
                         
                       )
                     )
                   )
                   ),





# Info Section about the team ---------------------------------------------

# Info about Alex ---------------------------------------------------------



 
            column(width = 3,
              userBox(
              width = 12,
              collapsed = TRUE,
              title = userDescription(
                title = "Alex",
                type = 2,
                image = "alex2.PNG"
              ),
              div(
                class = "text-center",
                height = "100%",
                width = "100%",
                br(),
            
                h4("Alex Galczak"),
                h6("Data Science Fellow"),
                div(
                  class = "text-center",
                  a(href = 'https://github.com/AlexGalczak',
                    
                    icon("fab fa-github", lib = "font-awesome"),
                    "GitHub",
                    title = "GitHub"), br(),
                  a(href = 'https://www.linkedin.com/in/aleksandragalczak/',
                    icon("fab fa-linkedin", lib = "font-awesome"),
                    "LinkedIn",
                    title = "LinkedIn")
                )

              )
            ),


# Info about Chad ---------------------------------------------------------


            
            userBox(
              width = 12,
              collapsed = TRUE,
              title = userDescription(
                title = "Chad",
                type = 2,
                image = "chad.png"
              ),
              div(
                class = "text-center",
                height = "100%",
                width = "100%",
                br(),
                h4("Chad Loh"), 
                h6("Data Science Fellow")),
              div(
                class = "text-center",
                a(href = 'https://github.com/chadloh',
                  
                  icon("fab fa-github", lib = "font-awesome"),
                  "GitHub",
                  title = "GitHub"), br(),
                a(href = 'https://www.linkedin.com/in/chadloh',
                  icon("fab fa-linkedin", lib = "font-awesome"),
                  "LinkedIn",
                  title = "LinkedIn")
              )
            ),


# Info about Michelle -----------------------------------------------------


            
            
            userBox(
              width = 12,
              collapsed = TRUE,
              title = userDescription(
                title = "Michelle",
                type = 2,
                image = "MB.PNG"
              ),
              
              div(
                class = "text-center",
                height = "100%",
                width = "100%",
                br(),
                h4("Michelle Bui"),
                h6("Data Science Fellow"),
                div(
                  class = "text-center",
                  a(href = 'https://github.com/mb3005',
                    
                    icon("fab fa-github", lib = "font-awesome"),
                    "GitHub",
                    title = "GitHub"), br(),
                  a(href = 'https://www.linkedin.com/in/michellebui3005/',
                    icon("fab fa-linkedin", lib = "font-awesome"),
                    "LinkedIn",
                    title = "LinkedIn")
                )

              )
            ),



# Info about James --------------------------------------------------------

            userBox(
              width = 12,
              collapsed = TRUE,
              title = userDescription(
                title = "James",
                type = 2,
                image = "reno_1x1.jpg"
              ),
              
              div(
                class = "text-center",
                height = "100%",
                width = "100%",
                br(),
                h4("James Reno"),
                h6("Data Science Fellow"),
                div(
                  class = "text-center",
                  a(href = 'https://github.com/jamesreno2',
                    
                    icon("fab fa-github", lib = "font-awesome"),
                    "GitHub",
                    title = "GitHub"), br(),
                  a(href = 'https://www.linkedin.com/in/jamesmichaelreno/',
                    icon("fab fa-linkedin", lib = "font-awesome"),
                    "LinkedIn",
                    title = "LinkedIn")
                ))

              )
            )
          )
        ),
        


# Map page - Map tab from sidebar -----------------------------------------


# Reactive input boxes ----------------------------------------------------



        
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
                  selected = c("All"),
                  choiceNames = c( "All",
                    "Single Family",
                    "2-Family",
                    "Duplex",
                    "Townhouse(Inside)",
                    "Townhouse(End)"
                  ),
                  choiceValues = c("All","1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"),
                  inline = TRUE
                )
              ),
              
              tabPanel(
                title = "Year Built",
                "Select Year Built",
                width = 12,
                sliderInput
                (
                  "YearBuilt",
                  label = NULL,
                  min = 1870,
                  max = max(house_price$YearBuilt),
                  value = c(1870, 2010),
                  sep = "",
                  step = 5
                )
              )
            ),
            

# Reactive output map -----------------------------------------------------

            
            
            
            fluidRow
            (
              box
              (
                girafeOutput("Amesmap", width = "75%", height = "75%"),
                width = 12
              )
            )
          )
        ),
        
# Analysis page - Analysis tab from sidebar --------------------------------
        
        tabItem
        (tabName = "Analysis",
          fluidRow
          (
            

# Reactive input box  -----------------------------------------------------

            
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
                selected = "NAmes"
              )
            ),
            
            

# Reactive output graphs --------------------------------------------------

            
            box
            (width = 6,
              title = 'Price Distribution of Neighborhood',
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
        
        

# Predictions page - Predictions tab from sidebar -------------------------

        
        
        
        tabItem(
          tabName = "Predictions",
          fluidRow
          

# reactive input boxes ----------------------------------------------------

          
          (
            box(
              title = "Neighborhood",
              width = 4,
              style = "height:120px",
              selectInput
              (
                input = "hood_prediction",
                label = NULL,
                choices = c(hoods),
                multiple = FALSE,
                selected = "NAmes"
              )
            ),
            box(
              title = "Baths",
              width = 2,
              style = "height:120px",
              sliderInput(
                "FullBath_prediction",
                label = NULL,
                min = 0,
                max = 5,
                value = 1
              )
            ),
            box(
              title = "Beds",
              width = 2,
              style = "height:120px",
              sliderInput(
                "BedroomAbvGr_prediction",
                label = NULL,
                min = 0,
                max = 5,
                value = 3
              )
            ),
            box(
              title = "Area",
              width = 2,
              style = "height:120px",
              sliderInput
              (
                "GrLivArea_prediction",
                label = NULL,
                min = 0,
                max = 5000,
                value = 1200,
                step = 200,
                round = 2
              )
            ),
            box(
              title = "Building Type",
              width = 2,
              style = "height:120px",
              radioButtons(
                "BldgType_prediction",
                label = NULL,
                #choices  = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"),
                choiceNames = c(
                  "Single Family",
                  "2-Family",
                  "Duplex",
                  "Townhouse(Inside)",
                  "Townhouse(End)"
                ),
                choiceValues = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"),
                inline = TRUE,
                selected = "1Fam"
              )
            )
          ),


# Reactive outputs --------------------------------------------------------


          fluidRow(
            box
            (
              title = "Price Prediction",
              width = 4,
              style = "height: 500px",
              h2(textOutput("prediction"))
            ),
            box(
              title = "Comparison to historic sales",
              width = 8,
              style = "height: 500px",
              plotOutput("prediction_graph")
            )
          
          )
        )
      )
    )
  )
)

