require(shiny)
require(leaflet)
require(magrittr)
require(sp)
require(htmltools)
library(dplyr)
library(shinyjs)
source("helper.R")



shinyServer(function(input, output, session) {
  

  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()%>%
      addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                  popup = htmlEscape(uv84$NAMN))%>%
       addProviderTiles("CartoDB.Positron")

     
  })
  
  boxCheck<-reactive({
    
   boxCheck<-c(input$Check1,input$Check2,input$Check3,input$Check4,input$Check5)
   print(is.null(boxCheck))
    
  })
  
  observeEvent(input$könButton, {
    toggle("Check1")
  })
  observeEvent(input$utbildningButton, {
    toggle("Check2")
  })
  observeEvent(input$sysselsättningButton, {
    toggle("Check3")
  })
  observeEvent(input$tidIUppväsButton, {
    toggle("Check4")
  })
  observeEvent(input$ålderButton, {
    toggle("Check5")
  })

  område_popup<-reactive({
    
    #box<-boxCheck()
    #if(box==TRUE){
    områden<-urval()
    #områden<-karta(input$var,NULL)
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
#     } else{   
#     
#       
#     områden<-urval()
#     print(områden)
#      z<-popup(input$var)
#     
#     område_popup <-paste( "<Strong>Område: </strong>",
#                           områden[,1],
#                           "<br><Strong>",z[1,],":</strong>",
#                           områden[,2],
#                           "<br><strong>",z[2,],":</strong>",
#                           områden[,3],
#                           "<br><strong>",z[3,],":</strong>",
#                           områden[,4],
#                           "<br><strong>",z[4,],":</strong>",
#                           områden[,5],
#                           "<br><strong>",z[5,],":</strong>",
#                           områden[,6])}
    
  })
  
  observe({
    
    box<-boxCheck()
    if(box==TRUE){
    pop_up<-område_popup()
    områden<-urval()
    #områden<-karta(input$var,NULL)
    factpal <- colorFactor(topo.colors(5), områden$favorit)
    leafletProxy("map")%>%
      clearShapes()%>%
      clearControls()%>%
      addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                  popup = pop_up, color = ~factpal(områden$favorit))%>%
      addLegend("bottomleft", pal = factpal, values = områden$favorit, title ="Frågor" )
        } else{
          pop_up<-område_popup()
          områden<-urval()
          factpal <- colorFactor(topo.colors(5), områden$favorit)
          leafletProxy("map")%>%
            clearShapes()%>%
            clearControls()%>%
            addPolygons(data=uv84, weight = 2, fillOpacity = 0.5, smoothFactor = 0.5,
                        popup = pop_up, color = ~factpal(områden$favorit))%>%
            addLegend("bottomleft", pal = factpal, values = områden$favorit, title ="Frågor" )
        }
    
    
  })

urval<-function(){
  
  y<-data3  
  
if(!is.null(input$Check1)){
   c1<-input$Check1  
  y<-subset(y,Kön==c1)
}
    
if(!is.null(input$Check2)){
   c2<-input$Check2  
   y<-subset(y,Utbildningsnivå==c2)
}
  if(!is.null(input$Check3)){
    c3<-input$Check3  
    y<-subset(y,Sysselsättning==c3)
  }
  if(!is.null(input$Check4)){
    c4<-input$Check4  
    y<-subset(y,Tid.i.UppVäs==c4)
  }
  if(!is.null(input$Check5)){
    c5<-input$Check5
    y<-subset(y,Ålder==c5)
  }

  y2<-subset(y,select=c(X1a:Area))
  y3<-y2 %>%group_by(Area) %>%summarise_each(funs(mean))
  class(y3) <- "data.frame"
  cleanY2<-round_df(y3,1)
  cleanY2<-karta(input$var,cleanY2)
  return(cleanY2)
  
  
  }
  
})
