#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    ggplot(data = df[(df$price >= input$distribution_min) & (df$price <= input$distribution_max),c("longitude","latitude","price")],
           aes(x=longitude,y=latitude,color = price))+
      geom_point(size=0.01)+
      scale_color_viridis()+
      geom_map(data=nyc_districts_map, 
               map=nyc_districts_map,
               aes(x=long, y=lat, map_id=id),
               color="black",
               size=0.15, 
               fill=NA) + 
      ggthemes::theme_map()+
      coord_map() +
      ggtitle(paste("Spatial distribution of Airbnb Price, price level $", as.character(input$distribution_min), " - $", as.character(input$distribution_max), sep = ""));
  })
  
})
