#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data("mtcars")
modelFit <- lm(mpg ~ wt, data = mtcars)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    # draw the histogram with the specified number of bins
    plot(mpg ~ wt, data = mtcars, ylab = 'Miles per Gallon (MPG)', xlab='Weight (1000 lbs)')
    abline(modelFit)
    abline(v=input$wt, col='red')
  })
  output$inputVal = renderPrint({input$wt})
  output$outputVal = renderPrint({predict(modelFit, newdata=data.frame(wt=input$wt))[[1]]})
})
