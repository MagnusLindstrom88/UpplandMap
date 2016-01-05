library(shiny)
library(leaflet)
library(magrittr)
library(sp)


shinyUI(
  
  navbarPage("Superzip", id="nav",
                             
  tabPanel("Interactive map",
           
    div(class = "outer",
     tags$head(
          includeCSS("style.css")
     ),
        
      
      leafletOutput("map"),
 
      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                  draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                  width = 330, height = "auto",
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Parker & grönområden", "Mångfald i bostadsutbudet",
                              "Levandegöra gemensamma platser", "Kommunikationer")
                  )
    )
    )            
    )
         
# mainPanel(leafletOutput("map"), textOutput("dynamicText"),
#           
#           selectInput("radioB", "Färg",
#                        choices = c("Greens", "Reds", "Blues"))
# 
#           
# 
# ))
)
)