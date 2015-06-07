library(shiny)
library(RCurl)
library(ggplot2)
library(lme4)
library(data.table)
library(maps)

shinyUI(fluidPage(
  tags$style("body {background-color: #FFFFFF; }"),
  tags$head(tags$style("#intro {color: black;
                                font-size: 14px;
                                font-family: 'Arial';
                                font-weight: 800;
                              }")),
  tags$head(tags$style("#question {color: black;
                                font-size: 14px;
                                font-family: 'Arial';
                                font-weight: 800;
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
    titlePanel("How does cyanobacteria bloom size change with nitrogen input?"),
    align = "center",
    column(3, offset = 2, align = "left",
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
                      width = "647px", 
                      height = "400px")
    ) 
  ),
  fluidRow(br(),
           br())
  
))


