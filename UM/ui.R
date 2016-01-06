library(shiny)
library(leaflet)
library(magrittr)
library(sp)


shinyUI(
  
  navbarPage("Xplor", id="nav",
                             
  tabPanel("Interaktiv karta",
           
    div(class = "outer",
     tags$head(
          includeCSS("style.css")
     ),
        
      
      leafletOutput("map", width = "100%", height = "100%"),
 
      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                  draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                  width = 300, height = "auto",
      
                  selectInput("var", 
                              label = h4("Choose a variable to display"),
                              choices = c("Parker & grönområden", "Mångfald i bostadsutbudet",
                                          "Levandegöra gemensamma platser", "Kommunikationer",
                                          "Kultur & fritid","Utbildning","Omsorg","Skolan",
                                          "Trygghet","Hållbar utveckling")
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