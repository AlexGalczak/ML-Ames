library(shiny)

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
                                 BedroomAbvGr >= input$BedroomAbvGr[1] &
                                 BedroomAbvGr <= input$BedroomAbvGr[2] &
                                 FullBath >= input$FullBath[1] &
                                 FullBath <= input$FullBath[2] &
                                 GrLivArea >= input$GrLivArea[1] &
                                 GrLivArea <= input$GrLivArea[2] &
                                 (BldgType %in% input$BldgType |
                                    input$BldgType == "All") &
                                 YearBuilt >= input$YearBuilt[1] &
                                 YearBuilt <= input$YearBuilt[2] 
                          
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
  

  
  observeEvent(input$toggle, {
    updateFlipBox("myflipbox")
    
    
    
  })
  
  output$buildingtype <- renderPlot({
    
    df_bldg <- df %>%
      group_by(BldgType) %>%
      summarise(MedianPrice = median(SalePrice / 1000))
    
    df_bldg_sel <- df %>%
      filter(Neighborhood %in% input$hood_analysis) %>%
      group_by(BldgType) %>%
      summarise(MedianPrice_sel = median(SalePrice / 1000))
      
    df_bldg_join <- df_bldg %>%
      left_join(df_bldg_sel) %>%
      melt(id.vars='BldgType')
      
      ggplot() +
        geom_bar(data = df_bldg_join, aes(x = BldgType, y = value, fill = variable), width = 0.5, stat = 'identity', position = 'dodge') +
      theme_ipsum() +
      labs(
        x = 'Building Type',
        y = 'Median Sale Price ($1000 USD)',
        color = 'Neighborhood'
      ) +
      scale_fill_manual(
        values = c("#EEB462", "#CD7672"),
        name = "Legend",
        labels = c("Ames", (neighborhoods %>% filter(Neighborhood == input$hood_analysis))$Name)
      ) +
        scale_x_discrete("Building Type", 
                         breaks = c("1Fam", "2fmCon", "Duplex", "Twnhs", "TwnhsE"), 
                         labels=c("Single Family","2-Family", "Duplex", "Townhouse(Inside)","Townhouse(End)")) +
      theme(axis.text.x = element_text(
        size = 11,
        angle = 30,
        vjust = .8,
        hjust = 0.8
      ))
  })
  
  output$price_sqft <- renderPlot({
      ggplot()+
      geom_point(data = df %>%
                   mutate(SFPrice = round(SalePrice / (TotalBsmtSF + GrLivArea), 2)),
                 aes(x = GrLivArea, y = SFPrice),  color = '#dddddd', alpha = 0.5)+
      geom_point(data = df %>%
                   mutate(SFPrice = round(SalePrice / (TotalBsmtSF + GrLivArea), 2)) %>%
                   filter(Neighborhood %in% input$hood_analysis),
                 aes(x = GrLivArea, y = SFPrice), color = '#CD7672', size = 3)+
      theme_ipsum() +
      xlim(0, 4000) +
      ylim(0,150) +
      theme(legend.position = "none") +
      labs(x = "Above Ground Living Area (Sq Ft)", y = "Price Per Sq")
    
  })
  
  output$price_qual <- renderPlot({
    df_qual <- df %>%
      mutate(TotSF = TotalBsmtSF + GrLivArea) %>%
      mutate(SFPrice = round(SalePrice / TotSF, 2)) %>%
      mutate(OverallQual = as.factor(OverallQual))
    
      ggplot() +
      geom_jitter(data = df_qual, aes(x = OverallQual, y = SFPrice),
                  color = '#dddddd', alpha = 0.5) +
      geom_jitter(data = df_qual %>% filter(Neighborhood %in% input$hood_analysis), aes(x = OverallQual, y = SFPrice),
                  color = "#222222", fill = "#222222", size = 2, alpha = 0.75) +
      geom_boxplot(data = df_qual %>% filter(Neighborhood %in% input$hood_analysis), aes(x = OverallQual, y = SFPrice),
                   color = "#CD7672", fill = "#CD7672", alpha = 0.5) +
      theme_ipsum() +
      labs(x = "Overall Quality", y = "Price Per Sq")
  })

  
  
  output$density <- renderPlot({
    df_density <- df %>%
      mutate(SalePriceShort = round(SalePrice / 1000), 2)
    ggplot()+
      geom_density(data = df_density, aes(x = SalePriceShort, fill = "#000000"), alpha = 0.5) +
      geom_density(data = df_density %>% filter (Neighborhood %in% input$hood_analysis),
                   aes(x = SalePriceShort, fill = "#ffffff"), alpha = 0.5) +
      theme_ipsum() +
      labs(x = 'SalePrice ($1000 USD)', y = 'Density') +
      scale_fill_manual(
        values = c("#EEB462", "#CD7672"),
        name = "Legend",
        labels = c("Ames", (neighborhoods %>% filter(Neighborhood == input$hood_analysis))$Name)
      )
  })
  
  
  output$prediction <- renderText({
    predict = coef[1:4,2] %*% c(1,input$BedroomAbvGr_prediction,input$FullBath_prediction,input$GrLivArea_prediction)
    if (input$BldgType_prediction != '1Fam')
      predict = predict + coef[coef$X == paste("BldgType", input$BldgType_prediction, sep='_'),2]
    if (input$hood_prediction != 'Blmngtn')
      predict = predict + coef[coef$X == paste("Neighborhood", input$hood_prediction, sep='_'),2]
    predict = round(predict,-2)
    paste("The predicted price is: $", predict, sep = "")
  })
  
  output$prediction_graph <- renderPlot({
    predict = coef[1:4,2] %*% c(1,input$BedroomAbvGr_prediction,input$FullBath_prediction,input$GrLivArea_prediction)
    if (input$BldgType_prediction != '1Fam')
      predict = predict + coef[coef$X == paste("BldgType", input$BldgType_prediction, sep='_'),2]
    if (input$hood_prediction != 'Blmngtn')
      predict = predict + coef[coef$X == paste("Neighborhood", input$hood_prediction, sep='_'),2]
    predict = round(predict,-2)
    
    ggplot()+
      geom_point(data = df,
                 aes(x = GrLivArea, y = SalePrice),  color = '#dddddd', alpha = 0.5)+
      geom_point(data = df %>%
                   filter(Neighborhood == input$hood_prediction &
                            BedroomAbvGr == input$BedroomAbvGr_prediction &
                            FullBath >= input$FullBath_prediction &
                            GrLivArea >= input$GrLivArea_prediction -250 &
                            GrLivArea <= input$GrLivArea_prediction +250 &
                            BldgType == input$BldgType_prediction),
                 aes(x = GrLivArea, y = SalePrice), color = '#EEB462', size = 3, alpha = 1)+
      
      geom_point(data = data.frame(GrLivArea = input$GrLivArea_prediction, SalePrice = predict),
                 aes(x = GrLivArea, y = SalePrice), fill = '#CD7672',  color = '#222222', shape = 22, size = 5, alpha = 1)+
      geom_text(data = data.frame(GrLivArea = input$GrLivArea_prediction, SalePrice = predict), 
                 aes(x = GrLivArea, y = SalePrice+30000, label = "Our Prediction"), size = 5)+
      
      theme_ipsum() +
      xlim(0, 3000) +
      ylim(0,500000) +
      theme(legend.position = "none") +
      labs(x = "Above Ground Living Area (Sq Ft)", y = "Historic Sales Price (USD)")
  })
})