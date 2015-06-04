library(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)

shinyUI(fluidPage(
  titlePanel("How does increasing nutrients affect you?"),
  
  sidebarPanel(
    helpText("Cynobacteria blooms are caused by nutrient input. What happens as you increase nitrogen? What happens if you decrease it?"),
  htmlOutput("slider")
  ),
  
  mainPanel(
  plotOutput("CyanoMap")
  )
  
))