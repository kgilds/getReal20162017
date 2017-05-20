


library(shiny)
library(dplyr)

data_entry <-readRDS("data_entry_stat.rds") 

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
	
   
   
# Define server logic required to draw a histogram
server <- function(input, output) {
	
	output$dat_tbl <- renderTable ({

		dat <- filter(data_entry, council == input$council)
		dat_tbl <- with(dat,table(dataSource))
		
	    })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

####Academic Engagement


