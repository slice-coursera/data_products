#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MPG Prediction from Weight"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h4('Description'),
      p('In order to get a prediction of the miles per gallon(MPG) of your car input the weight of your car in the units of 1000lbs.
        For example if you car weighs 3,420 lbs your input should be 3.42.'),
       numericInput("wt",
                   "Weight of the car (1000 lbs):",
                   min = 0,
                   max = 10,
                   value = 3,
                   step = 0.25)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('MPG Prediction Output'),
      h4('Input Weight'),
      verbatimTextOutput('inputVal'),
      h4('Output MPG'),
      verbatimTextOutput('outputVal'),
      h4('Plot on Linear Model Fit'),
      p('This plot shows your input (in red) on the plot of the mtcars dataset and the linear fit (in black)'),
       plotOutput("distPlot")
    )
  )
))
