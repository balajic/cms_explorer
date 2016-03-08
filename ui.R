# Sriramajayam
#install.packages('dplyr')
# colnames(tab)
library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(jsonlite)
library(dplyr)
tabHCP <- read.csv("HCP.csv",header=TRUE)
#colnames(tabHCP)
#unique(tabHCP[,24])

#companyList <- unique(tabHCP[,24])
companyList <- distinct(tabHCP["Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name"],Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name)

#drugList   <-  unique(tabHCP[,47])
drugList   <-  distinct(tabHCP["Name_of_Associated_Covered_Drug_or_Biological1"],Name_of_Associated_Covered_Drug_or_Biological1)

dashboardPage(
  dashboardHeader(title = "Filter"),
  dashboardSidebar(
    useShinyjs(),
    h3("Filter Goes here"),
    selectInput("company", "Company Name", c(companyList), selected = NULL, multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
    selectInput("drug", "Drug List", drugList, selected = NULL, multiple = FALSE, selectize = TRUE, width = NULL, size = NULL),
    actionButton("goButton","Query")
  ),
  dashboardBody(
    h3("2014 CMS Open Payments Data explorer"),
    dataTableOutput("outCMS")
  )
)