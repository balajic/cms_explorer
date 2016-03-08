# Sriramajayam
library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(jsonlite)

companyList <- c("","Purdue Pharma L.P","Merck","Novartis")
drugList   <- c("",'Oxycontin',"Butrans","Hysingla ER")

dashboardPage(
  dashboardHeader(title = "Filter"),
  dashboardSidebar(
    useShinyjs(),
    h3("Filter Goes here")
  ),
  dashboardBody(
    h3("2014 CMS Open Payments Data explorer")
  )
)