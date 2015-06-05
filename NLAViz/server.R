library(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  # ui buttons
  output$slider <- renderUI({
    sliderInput(inputId="nut",
                label="Choose your nitrogen input (mg/L)",
                value=2.5, min=1, max=5.0)
  })
  output$lake_origin_check <- renderUI({
    dt <- getData()
    lake_choices <- as.character(unique(dt[, LAKE_ORIGIN]))
    checkboxGroupInput(inputId = "lake_origin",
                label = "Choose a Lake Origin",
                choices = lake_choices,
                selected = lake_choices)
  })
  output$lake_depth_check <- renderUI({
    dt <- getData()
    lake_choices <- as.character(unique(dt[, check_lake_depth]))
    checkboxGroupInput(inputId = "lake_depth",
                       label = "Choose a Lake Depth",
                       choices = lake_choices,
                       selected = lake_choices)
  })
  output$banner <- renderUI({
    return(HTML("<img src = \"C:/Users/kmenciso/Desktop/EPA_Visualization/Vizualizing-Nutrients/NLAViz/Banner.png\">"))
  })
  output$nitrogen_gif <- renderUI({
    return(HTML("<img src=\"C:/Users/kmenciso/Desktop/EPA_Visualization/Vizualizing-Nutrients/NLAViz/Nitrogen.gif\">"))
  })
  # reactive functions
  getData <- reactive({
    df <- data.table(NLA_MB)
    return(df)
  })
  filterData <- reactive({
    dt <- getData()
    dt <- dt[LAKE_ORIGIN %in% input$lake_origin &
               check_lake_depth %in% input$lake_depth]
    validate(
      need(nrow(dt) != 0, "Please check at least one option in Lake Origin or Lake Depth")
    )
    dt <- dt[, list(LON_DD, 
                    LAT_DD, 
                    ECO_NUTA,
                    ni = input$nut)]
    return(dt)
  })
  predictData <- reactive({
    dt <- filterData()
    validate(
      need(nrow(dt) != 0, "Please check at least one option Lake Origin or Lake Depth")
    )
    setnames(dt, old = "ni", new =  c("log10NTL"))
    predictions <- predict(mod, newdata = dt)
    dt[, `:=`(predictions = predictions)]
    return(dt)
  })
  output$test <- renderDataTable({
    dt <- predictData()
    return(dt)
  })
  output$CyanoMap <- renderPlot({
    Cyano <- predictData()
    all_states <- map_data("state")
    p <- ggplot()+geom_polygon(data=all_states, aes(x=long, y=lat, group = group),colour="#939597", fill="#939597")+
      geom_point(data=Cyano, aes(colour=ECO_NUTA, x=LON_DD, y=LAT_DD, size = predictions))+
      theme(axis.text.y = element_blank())+
      theme(axis.ticks = element_blank())+
      theme(axis.text.x = element_blank())+
      theme(axis.title.x = element_blank())+
      theme(axis.title.y = element_blank())+
      theme(panel.grid.major = element_blank())+
      theme(panel.grid.minor = element_blank())+
      theme(panel.background = element_rect(fill = "white"))+
      scale_size_continuous(range = c(1,7))+
      scale_colour_manual(values = c("#C39A6B","#B51F2D", "#009344","#FFF100","#A87B4F","#1B75BB","#74B7E4","#808284","#FEDD4E","#006738","white"))+
      guides(colour=FALSE)+
      scale_size_continuous(name="Cyanobacterial biomass")+
      theme(legend.title = element_text(size=12))+
      theme(legend.key = element_blank())
    
    return(p)
  })

})