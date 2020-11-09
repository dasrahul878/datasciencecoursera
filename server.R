#Server File
library(shiny)

shinyServer(function(input, output) {
  
  output$SelectState <- renderUI({
    selectInput("choosestate", "Choose States", state.name[state.region==input$region])
  })
  
  output$regionname <- renderText(input$region)
  
  output$statename <- reactive(input$choosestate)
  
  output$crimeplot <- renderPlot({
    
    #Loading Data
    dataframe<- USArrests[input$choosestate,]
    bhs <- c(dataframe$Murder, dataframe$Rape, dataframe$Assault)
    matplotting <- matrix(nrow=1, ncol=3, data=bhs)
    namecolumns(matplotting) <- c("Murder", "Rape", "Assault")
    
    ## Feature Calculation
    average_nationale <- c(mean(USArrests$Murder),mean(USArrests$Rape),mean(USArrests$Assault))
    stateaverage<-state.region==input$region
    crimeplace<-mean(USArrests$Murder[instates])
    balaatkaar<- mean(USArrests$Rape[instates])
    violence<- mean(USArrests$Assault[instates])
    meanofplace<-c(crimeplace, balaatkaar, violence)
    comparedtocountryavg <- round(bhs/average_nationale, digits=2)
    comparedtoplacemean <- round(bhs/meanofplace, digits=2)
    
    # Formatting
    colour<-"gray"
    if(input$region=="South"){colour<-"purple"}
    if(input$region=="West"){colour<-"coral"}
    if(input$region=="Northeast"){colour<-"light blue"}
    if(input$region=="North Central"){colour<-"hotpink"}
    
    # Plotting
    echs<-barplot(matplotting, 
               ylim=c(0,375), 
               col=regioncolor,
               main="Arrest frequency vs national avg",
               ylab="each 100k people arrest frequency")
    why<- c(dataframe$Murder, dataframe$Rape, dataframe$Assault)
    echs
    legend('topleft', ncol = 3L, title = 'vs state avg', bg="wheat",
           legend = c("Crime", "Murder" , "Rape", "Assault", "Nation",
                      comparedtocountryavg, "Region", comparedtoplacemean))
  }) 
  
})   



