require(shiny)
require(leaflet)
require(magrittr)
require(sp)


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
                              label = h4("Välj ett ämne"),
                              choices = c("Parker & grönområden", "Mångfald i bostadsutbudet",
                                          "Levandegöra gemensamma platser", "Kommunikationer",
                                          "Kultur & fritid","Utbildning","Omsorg","Skolan",
                                          "Trygghet","Hållbar utveckling")
                  ),

                    checkboxGroupInput("Check1",label=h4 ("Kön:"), choices = levels(data3$Kön)),
                    checkboxGroupInput("Check2",label=h4 ("Utbildningsnivå:"), choices = levels(data3$Utbildningsnivå)),
                    checkboxGroupInput("Check3",label=h4 ("Sysselsättning:"), choices = levels(data3$Sysselsättning)),
                    checkboxGroupInput("Check4",label=h4 ("Tid I Uppväs:"), choices = levels(data3$Tid.i.UppVäs)),
                    checkboxGroupInput("Check5",label=h4 ("Ålder:"), choices = levels(data3$Ålder))


    )
    )            
    )
        
)
)