library(shiny)
library(leaflet)
library(magrittr)
library(sp)
library(htmltools)
library(RColorBrewer)

source("helper.R")



shinyServer(function(input, output, session) {
  

  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()%>%
      addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                  popup = htmlEscape(uv84$NAMN))%>%
       addProviderTiles("CartoDB.Positron")
     
  })
  

  område_popup<-reactive({
    
    områden<-karta(input$var)
    z<-popup(input$var)
   
    
    område_popup <-paste( "<Strong>Område: </strong>",
                          områden[,1],
                          "<br><Strong>",z[1,],":</strong>",
                          områden[,2],
                          "<br><strong>",z[2,],":</strong>",
                          områden[,3],
                          "<br><strong>",z[3,],":</strong>",
                          områden[,4],
                          "<br><strong>",z[4,],":</strong>",
                          områden[,5],
                          "<br><strong>",z[5,],":</strong>",
                          områden[,6])
  })
  
  observe({
    pop_up<-område_popup()
    z<-popup(input$var)
    områden<-karta(input$var)
    factpal <- colorFactor(topo.colors(5), områden$favorit)
    leafletProxy("map")%>%
      clearShapes()%>%
      clearControls()%>%
      addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                  popup = pop_up, color = ~factpal(områden$favorit))%>%
    addLegend("bottomleft", pal = factpal, values = z[,1]
             
    )
    
  })
  
})
