library(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)

shinyUI(fluidPage(
  tags$style("body {background-color: #74B7E4; }"),
  tags$head(tags$style("#intro {color: black;
                                font-size: 20px;
                                font-face: 'arial bold';
                              }")),
  tags$head(tags$style("#question {color: black;
                                font-size: 20px;
                                font-face: 'arial bold';
                              }")),
  fluidRow(
    column(12,
           htmlOutput("nitrogen_gif"),
           align = "center"
    )
    
  ),
  fluidRow(
    column(12,
           htmlOutput("dilution"),
           align = "center"
    )
  ),
  fluidRow(
    br()
    ),
  fluidRow(
    column(2,
           br()
    ),
    column(3, align = "left",
           textOutput("intro"),
           br(),
           textOutput("question"),
           br(),
           htmlOutput("slider"),
           column(5,
                  htmlOutput("lake_origin_check")
           ),
           column(5,
                  htmlOutput("lake_depth_check")
           )
           
    ),
    column(6, align = "left",
           plotOutput("CyanoMap",  
                      width = "650px", 
                      height = "400px")
    ) 
  ),
  fluidRow(br(),
           br())
  
))


