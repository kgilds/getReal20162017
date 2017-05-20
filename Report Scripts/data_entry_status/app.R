

library(shiny)

ui <- fluidPage(shinyUI(
	fluidPage(
		titlePanel("Life Skills"),
		
		# Create a new Row in the UI for selectInputs
		fluidRow(
			column(12, 
				   selectInput("council", 
				   			"Select a Council:", 
				   			c(unique(as.character(girlSurvey$council))))
			)
		),


      

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

