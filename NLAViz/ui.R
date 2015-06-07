library(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)

shinyUI(fluidPage(
  tags$style("body {background-color: #74B7E4; }"),
  tags$head(tags$style("#intro {color: black;
                                font-size: 24px;
                                font-face: 'arial bold';
                              }")),
  tags$head(tags$style("#question {color: black;
                                font-size: 24px;
                                font-face: 'arial bold';
                              }")),
  fluidRow(
    htmlOutput("nitrogen_gif"),
    tags$style("#nitrogen_gif img{ 
                                  margin: auto;
                                   }")
    
  ),
  fluidRow(
    htmlOutput("dilution")
  ),
  fluidRow(
    br()
    ),
  fluidRow(
    column(4,
           textOutput("intro"),
           br(),
           textOutput("question"),
           br(),
           htmlOutput("slider"),
           column(4,
                  htmlOutput("lake_origin_check")
           ),
           column(4,
                  htmlOutput("lake_depth_check")
           )
           
    ),
    column(8,
           plotOutput("CyanoMap",  
                      width = "900px", 
                      height = "400px")
    )
  )
  
))


