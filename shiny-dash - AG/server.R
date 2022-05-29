#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output)
{
  output$Amesmap <-
    renderGirafe({
      ggobj <-
        ggplot() +
        geom_sf(
          data = city$osm_multipolygons,
          color = "#ffffff",
          fill = "#e6e6e6",
          alpha = 0.5
        ) +
        geom_sf(
          data = uni$osm_multipolygons,
          color = "#EAD7AF",
          fill = "#EAD7AF",
          size = 0.01,
          alpha = 0.5
        ) +
        geom_sf(
          data = park$osm_polygons,
          color = "#acc388",
          fill = "#acc388",
          size = 0.01,
          alpha = 0.5
        ) +
        geom_sf(
          data = water$osm_multipolygons,
          color = "#B2E3EA",
          fill = "#B2E3EA",
          size = 0.5,
          alpha = 0.5
        ) +
        geom_sf(
          data = road_primary$osm_lines,
          color = "#ebba76",
          alpha = 0.8,
          size = 1
        ) +
        geom_sf(
          data = road_secondary$osm_lines,
          color = "#ebba76",
          alpha = 0.8,
          size = 0.5
        ) +
        geom_point(
          data = df,
          aes(x = Longitude, y = Latitude, color = Neighborhood),
          alpha = 0.05,
          size = 0.1
        ) +
        
        
        
        geom_point(
          data = df %>% filter((Neighborhood %in% input$hood |
                                  input$hood == "All") &
                                 
                                 SalePrice >= input$price[1] &
                                 SalePrice <= input$price[2] &
                                 BedroomAbvGr <= input$BedroomAbvGr &
                                 FullBath <= input$FullBath &
                                 GrLivArea >= input$GrLivArea[1] &
                                 GrLivArea <= input$GrLivArea[2]
          ),
          aes(x = Longitude, y = Latitude, color = Neighborhood),
          alpha = 1,
          size = 0.3
        ) +
        
        # geom_point(data = df %>% filter(SalePrice >= input$price[1] & SalePrice <= input$price[2]),
        #            aes( x = Longitude, y = Latitude, color = Neighborhood), alpha = 0.5, size=0.1) +
        #
        
        geom_text_repel(
          data = nbhd,
          aes(x = Longitude, y = Latitude, label = Name),
          size = 1.5,
          color = "#333333"
        ) +
        # geom_text_interactive(data = nbhd,
        #                       aes(x = Longitude, y = Latitude, data_id = Neighborhood, label=Name),
        #                       size = 1.5, color = "#555555") +
        # geom_sf(data = religion$osm_points,
        #         color = "#EA80B6",
        #         shape=3,
        #         alpha = 0.75) +
        
        #geom_point(data = df %>% filter(SalePrice >= input$price[1] & SalePrice <= input$price[2]),
        #           aes( x = Longitude, y = Latitude, color = SalePrice), alpha = 0.5, size=1) +
        
      
      xlim(-93.7,-93.52) +
        ylim(41.98, 42.08) +
        # scale_color_gradientn(limits = c(0,350000),colours=c("navyblue", "darkmagenta", "darkorange1")) +
        theme(
          axis.line = element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          panel.background = element_rect(fill = 'transparent'),
          panel.border = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          legend.position = "None"
        )
      
      # preselection <- input$hood
      # girafe(ggobj = ggobj,
      #        options = list(opts_hover(css = "fill:#222222;"),
      #                       opts_selection(selected = preselection, type = "single", css = "fill:black;font-weight:700"))
      girafe(ggobj = ggobj,
             options = list(
               opts_hover(css = "fill:#222222;"),
               opts_selection(type = "single", css = "fill:black;font-weight:700")
             ))
    })
  
  output$AmesInfoBox <- renderInfoBox({
    infoBox("Ames Info Page")
    
    
  })
  
  

  
  output$active_side_2 <- renderUI({
    side <- if (input$myflipbox2)
      "front"
    else
      "back"
    dashboardBadge(side, color = "blue")
  })
  
  output$active_side_3 <- renderUI({
    side <- if (input$myflipbox3)
      "front"
    else
      "back"
    dashboardBadge(side, color = "blue")
  })
  
  output$active_side_4 <- renderUI({
    side <- if (input$myflipbox4)
      "front"
    else
      "back"
    dashboardBadge(side, color = "blue")
  })
  
  observeEvent(input$toggle, {
    updateFlipBox("myflipbox")
    
    
    
  })
  
  output$buildingtype <- renderPlot({
    df %>%
      group_by(Neighborhood, BldgType) %>%
      summarise(MedianPrice = median(SalePrice / 1000)) %>%
      arrange(desc(MedianPrice)) %>%
      mutate(BldgType = factor(BldgType)) %>%
      filter(Neighborhood %in% input$hood_analysis |
               input$hood_analysis == "All") %>%
      
      ggplot(aes(
        x = BldgType,
        y = MedianPrice,
        fill = input$hood_analysis
      )) +
      geom_bar(position = position_dodge2(preserve = 'single'), stat = 'identity') +
      theme_bw() +
      theme_ipsum() +
      labs(
        x = 'Building Type',
        y = 'Median Sale Price ($1000 USD)',
        title = 'Price by House Building Type',
        color = 'Neighborhood'
      ) +
      scale_fill_manual(
        values = c("#264D59", "#138086", "#43978D", "#63C0B5", "#90D1C9"),
        name = "Legend",
        labels = c("All Other Neighborhoods", "Bluestem")
      ) +
      theme(axis.text.x = element_text(
        size = 11,
        angle = 30,
        vjust = .8,
        hjust = 0.8
      ))
    
    
    
  })
  
  output$price_sqft <- renderPlot({
    df %>%
      mutate(TotSF = TotalBsmtSF + GrLivArea) %>%
      relocate(TotSF, .after = GrLivArea) %>%
      mutate(SFPrice = round(SalePrice / TotSF, 2)) %>%
      relocate(SFPrice, .after = SalePrice) %>%
      filter(Neighborhood %in% input$hood_analysis |
               input$hood_analysis == "All") %>%
      ggplot(aes(x = GrLivArea, y = SFPrice, color = SFPrice)) +
      geom_point() +
      theme_ipsum() +
      xlim(0, 8000) +
      theme(legend.position = "none") +
      labs(title = "Square Foot Price by Above Ground Living Area",
           x = "Above Ground Living Area (Sq Ft)", y = "Price Per Sq")
    
  })
  
  output$price_qual <- renderPlot({
    df %>%
      mutate(TotSF = TotalBsmtSF + GrLivArea) %>%
      relocate(TotSF, .after = GrLivArea) %>%
      mutate(SFPrice = round(SalePrice / TotSF, 2)) %>%
      relocate(SFPrice, .after = SalePrice) %>%
      mutate(OverallQual = as.factor(OverallQual)) %>%
      filter(Neighborhood %in% input$hood_analysis |
               input$hood_analysis == "All")  %>%
      ggplot(aes(x = OverallQual, y = SFPrice)) +
      geom_boxplot(color = "#5a7fdb",
                   fill = "#ebae34",
                   alpha = 0.3) +
      theme_ipsum() +
      labs(title = "Quality by Sq Ft Price", x = "Overall Quality", y = "Price Per Sq")
    
  })
  
  
  
  output$density <- renderPlot({
    df %>%
      filter(Neighborhood %in% input$hood_analysis |
               input$hood_analysis == "All")  %>%
      mutate(SalePriceShort = round(SalePrice / 1000), 2) %>%
      
      ggplot(aes(
        x = SalePriceShort,
        group = c(
          Neighborhood %in% input$hood_analysis &
            Neighborhood == "All"
        ),
        fill = c(
          Neighborhood %in% input$hood_analysis &
            Neighborhood == "All"
        )
      )) +
      geom_density(adjust = 1.5, alpha = 0.6) +
      scale_fill_viridis(discrete = TRUE) +
      scale_color_viridis(discrete = TRUE) +
      theme_ipsum() +
      #xlim(0, 4000) +
      labs(x = 'SalePrice ($1000 USD)', y = 'Density', title = 'Price Distribution of Neighbourhood') +
      scale_fill_manual(
        values = c("#EEB462", "#CD7672"),
        name = "Legend",
        labels = c(input$hood_analysis, input$hood_analysis == "All")
      )
    
  })
  
  
  
})