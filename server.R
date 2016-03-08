#
#library(rsconnect)
#rsconnect::deployApp('C:/Users/Balaj/Desktop/R/cms')
# tabCMS<- read.csv("HCP.csv")
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
    #tabRes <- read.csv("HCP.csv")
    tabRes = tabCMS()
    #print(input$company)
    #print(input$drug)
    
    #print(subset(tabRes, Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name == input$company))
    #print(subset(tabCMS, tabCMS$Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name == input$company))
    #print(subset(tabRes, tabCMS$Name_of_Associated_Covered_Drug_or_Biological1 == input$drug))
    
    #tabRes[tabRes$Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name == input$company,]
    
    #tabRes <- ifelse(input$company == "", tabRes, data.frame(tabRes[tabRes$Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name == input$company,]))
    tabRes <- ifelse(input$drug    == "", tabRes, tabRes[tabRes$Name_of_Associated_Covered_Drug_or_Biological1            == input$drug,])

    #print(count(tabRes1))
    
    datatable(tabRes,options = list(), rownames = F, filter = 'top')
  })
}