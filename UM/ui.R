library(shiny)
library(leaflet)
library(magrittr)

# 
# shinyUI(fluidPage(leafletOutput("myMap")))
#   

shinyUI(fluidPage(
  titlePanel("title panel"),
                   
         
mainPanel(leafletOutput("map")

))
)