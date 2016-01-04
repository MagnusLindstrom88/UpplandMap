library(shiny)
library(leaflet)
library(magrittr)
library(sp)


shinyUI(fluidPage(
  titlePanel("Title panel"),
    
  sidebarLayout(
    sidebarPanel(
      helpText("Välj ett alternativ"),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Parker & grönområden", "Mångfald i bostadsutbudet",
                              "Levandegöra gemensamma platser", "Kommunikationer")
                  )
    ),
                  
 
         
mainPanel(leafletOutput("map"), textOutput("dynamicText"),
          
          selectInput("radioB", "Färg",
                       choices = c("Greens", "Reds", "Blues"))

          

))
)
)