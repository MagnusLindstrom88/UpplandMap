library(shiny)
library(leaflet)
library(magrittr)
library(sp)

# 
# shinyUI(fluidPage(leafletOutput("myMap")))
#   

shinyUI(fluidPage(
  titlePanel("Title panel"),
    
  sidebarLayout(
    sidebarPanel(
      helpText("Välj ett alternativ"),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("1", "2",
                              "3", "4"),
                  selected = "1")
    ),
         
mainPanel(leafletOutput("map")
          
          

))
)
)