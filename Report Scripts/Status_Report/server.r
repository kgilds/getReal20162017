library(shiny)
library(dplyr)
library(knitr)
library(DT)

# Define server logic required to draw a histogram

data_entry <-readRDS("survey_entry_stat.rds") 


server <- function(input, output) {
    
    output$dat_tbl <- renderTable ({
        
        dat_tbl <- filter(data_entry, council == input$council)
        survey_tbl <- count(dat_tbl,dataSource)
        
        #dat_tbl <- with(dat_tbl,table(dataSource))
        
        
    })
    
}
