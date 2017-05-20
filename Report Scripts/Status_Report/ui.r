library(shiny)
library(dplyr)
library(knitr)

data_entry <-readRDS("survey_entry_stat.rds") 

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    bootstrapPage(
        
        
        titlePanel("Status Report"),
        
        sidebarPanel(
            column(12,
                   selectInput("council",
                               "Select a Council:",
                               c(unique(as.character(data_entry$council)))
                   ))
        ),
        
        mainPanel(
            
             tableOutput("dat_tbl")
        )
        
    )
    
)
