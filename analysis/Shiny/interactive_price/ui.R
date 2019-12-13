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
  
  titlePanel("Spatial distribution of Airbnb Price"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("distribution_min", 
                   "Price range minimum", 
                   300,
                   min = 0, 
                   max = 10000),
      numericInput("distribution_max", 
                   "Price range maximum", 
                   400,
                   min = 0, 
                   max = 10000)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
