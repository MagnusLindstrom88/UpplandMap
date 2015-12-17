library(shiny)
library(leaflet)
library(magrittr)
library(sp)


shinyServer(function(input, output, session) {
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()%>%
      addPolygons(data=uv84)%>%
      # setView(lng = 17.9167, lat = 59.5167, zoom = 13) %>%
      addProviderTiles("CartoDB.Positron")
     
  })


  
})