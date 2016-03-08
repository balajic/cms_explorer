#
#library(rsconnect)
#rsconnect::deployApp('C:/Users/Balaj/Desktop/R/cms')
library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(jsonlite)

function(input,output,session){
  tabCMS <- eventReactive(input$goButton, {
    disable("goButton")
    out1 <- read.csv("HCP.csv")
    enable("goButton")
    out1
  })

  output$outCMS <- renderDataTable({
    datatable(tabCMS(),options = list(), rownames = F, filter = 'top')
  })
}