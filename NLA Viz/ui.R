library(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)

shinyUI(fluidPage(
  titlePanel("How does increasing nutrients affect you?"),
  
  fluidRow(
    column(4,
           helpText("Nutrient inputs, such as nitrogen, can promote cyanobacterial blooms in lakes. Here a range of total nitrogen concentrations (on a log scale) representative of continental U.S. lakes and reservoirs. Choose a nitrogen input using the slider. What happens as you increase total nitrogen concentrations? What happens as you decrease it?")
    )
  ),
  fluidRow(
    column(2,
           htmlOutput("slider")
    )),
  
  mainPanel(
    plotOutput("CyanoMap")
  )
  
))