#UI File

library(shiny)


# Plot Application
shinyUI(fluidPage(
  
  # Heading
  titlePanel("United States Crime Stats, Nineteen Seventy Three"),
  
  # Bar in the side
  sidebarLayout(
    sidebarPanel(
      selectInput("place", "Select Place:",
                  unique(state.region)),
      uiOutput("SelectState"),
      p("Instructions for using this:"),
      p("This application utilizes information from the USArrests informational index in R to give a representation of 
Capture records by state for the wrongdoings of Murder, Assault and Rape in 1973. 
The client chooses the state for which he might want to see Arrest information 
by first choosing a Region and afterward a State (after choosing a district, 
the States in that Region will populate under the decision of State).
The bar statures mirror the Arrest rates per 100,000 individuals. The table in the upper 
left hand corner shows records demonstrating 
the capture pace of that state comparative with the normal of all states in the country and the 
chosen locale. 
(1 methods the Arrest Rate rises to the normal). 
The shade of the bars mirrors the locale chose.")
    ), 
    
    #
    mainPanel(
      h3(textOutput("nameofplce")),
      h3(textOutput("nameofstate")),
      plotOutput("graph")
      
      
    ))
)
)