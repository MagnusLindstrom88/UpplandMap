library(shiny)
library(leaflet)
library(magrittr)
library(sp)
library(htmltools)
library(RColorBrewer)

source("helper.R")


# röd<-colorFactor("Reds", uv84$NAMN)
# blå<-colorFactor("Blues", uv84$NAMN)
# grön<-colorFactor("Greens", uv84$NAMN)

shinyServer(function(input, output, session) {
  

  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()%>%
      addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                  popup = htmlEscape(uv84$NAMN))%>%
       addProviderTiles("CartoDB.Positron")
     
  })
  
  output$dynamicText <- renderText({
    sprintf("Du har valt %s",input$radioB)
  })

  
  färg<-reactive({
    colorFactor(input$radioB, testata$favorit)
    # toupper(input$radioB)
    
  })
  
  observe({
    pal<-färg()
    
    leafletProxy("map")%>%
      clearShapes()%>%
      addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                  popup = htmlEscape(uv84$NAMN), color = ~pal(testata$favorit))
   
  })
  
  observe({
  
    områden<-karta(input$var)
    factpal <- colorFactor(topo.colors(5), områden$favorit)
    leafletProxy("map")%>%
      clearShapes()%>%
      addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                  popup = htmlEscape(områden$favorit), color = ~factpal(områden$favorit))
    
  })
  
})
