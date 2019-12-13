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
    
    ggplot(data = df[(df$calculated_host_listings_count >= input$large_host_range_min), 
                     c("host_id","longitude","latitude")],
           mapping = aes(x=longitude, 
                         y=latitude,
                         color=host_id))+
      geom_point (size=0.1) +
      geom_map(data=nyc_districts_map, 
               map=nyc_districts_map,
               aes(x=long, y=lat, map_id=id),
               color="black", 
               size=0.15, 
               fill=NA) + 
      coord_map() +
      ggthemes::theme_map()+
      theme(legend.position = "none")+
      ggtitle(paste("The Airbnb housing distribution from owner with greater than or equal to",
                    as.character(input$large_host_range_min),
                    "housing(s)"
                    ,sep = " "))
    
  })
  
})
