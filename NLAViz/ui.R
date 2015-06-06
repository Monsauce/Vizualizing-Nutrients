blibrary(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)

shinyUI(fluidPage(
  tags$style("body {background-color: grey; }"),
  titlePanel(strong(h1("How does increasing nutrients affect you?"))),
  fluidRow(
    # Calls Banner.png
    htmlOutput("banner")
    
  ),
  fluidRow(
    htmlOutput("nitrogen_gif")

  ),
  fluidRow(
    htmlOutput("dilution")
  ),
  fluidRow(
    column(4,
           helpText("Here a range of total nitrogen concentrations (on a log scale) representative of continental U.S. lakes and reservoirs (data source: US EPA 2009, National Lakes Assessment (2007)). Choose a nitrogen input using the slider. What happens as you increase total nitrogen concentrations? Does the type of lake and depth change how big the bloom is? Each color is a different region of the US."),
           br(),
           htmlOutput("slider"),
           htmlOutput("lake_origin_check"),
           htmlOutput("lake_depth_check")
    ),
    column(8,
           plotOutput("CyanoMap",  width = "900px", height = "400px")
    )
  )
  
))