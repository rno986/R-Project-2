#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#






library(shiny)
require(shinydashboard)
library(ggplot2)
library(dplyr)
library(plotly)
library(shinyWidgets)
library(dslabs)
library(tidyverse)
library(RColorBrewer)





# Define UI for application that draws a histogram

ui <- fluidPage(
    
    setBackgroundColor(
        color = "white",
        gradient = c("linear", "radial"),
        direction = c("bottom", "top", "right", "left"),
        shinydashboard = FALSE
    ),
    # Application title
    titlePanel("National Overdose Deaths"),
    
    
    # Show a plot of the generated distribution
        tabsetPanel(
            tabPanel("Overdose Deaths: Map", plotlyOutput("graph")),
            tabPanel("Overdose Deaths: Data per State", 
                     sidebarLayout(
                         sidebarPanel(
                             selectInput("State","Select State:",
                                         choices=unique(read_csv("./myData2.csv")$State)),
                             
                             selectInput("Causes", "Select Cause of Overdose:",
                                         choices = c ("Unintentional"="D1",
                                                      "Suicide"="D2",
                                                      "Homicide"="D3",
                                                      "Undetermine"="D4")),
                             
                             sliderInput("yearInput", "Select Year Range:", min=1999, max=2019, 
                                         value=c(1999, 2019), sep="")),
                         
                         mainPanel(plotOutput("diseaseplot"), 
                                   
                                   plotOutput("causeplot")))),
            tabPanel("Overdose Deaths: Data per Drug Type",
                     sidebarLayout(
                         sidebarPanel(
                             selectInput("variable","Select Drug Type:",
                                             choices=c("Any Opioid"="Opioids",
                                                       "Prescription Opioids"="P_Opioids",
                                                       "Synthetic Opioids"="S_Opioids",
                                                       "Heroin",
                                                       "Cocaine",
                                                       "Psychostimulants"="Psych",
                                                       "Benzodiazepines"="Benz",
                                                       "Antidepressants"="Anti"), selected="Opioids")),
                     mainPanel(plotOutput("plot"),plotlyOutput("statebox2"),)))
            
                     
                     
        )
    )
    

    
    



# Define server logic required to draw a histogram
server <- function(input, output) {
    
    
    
    
    d <- reactive({
        filtered <-
            read_csv("./myData2.csv") %>%
            filter(State == input$State,
                   MCD...Drug.Alcohol.Induced.Cause.Code %in% input$Causes,
                   Year >= input$yearInput[1],
                   Year <= input$yearInput[2])
        
    }) 
    
    
    
    output$causeplot <- renderPlot({
        ggplot(d(), aes(x=Year, y=Deaths, fill=Gender)) +
            geom_bar(stat = "sum", show.legend=c(size=FALSE)) + 
            scale_fill_brewer(palette="Reds")+
            theme_bw() +
            xlab("Year") +
            ylab("Deaths") 

    })
    
    
    
    
    
    
    
    
    
    d3 <- reactive({
        filtered <-
            read_csv("./myData2.csv") %>%
            filter(State == input$State,
                   MCD...Drug.Alcohol.Induced.Cause.Code %in% input$Causes,
                   Year >= input$yearInput[1],
                   Year <= input$yearInput[2])%>%group_by(Year)%>%summarise(Deaths=sum(Deaths))
        
    }) 
    
    output$diseaseplot <- renderPlot({
        
        ggplot(d3(), aes(x=Year, y = Deaths)) +
            geom_point() + 
            geom_path()+
            theme_bw() 
    })
    
    
    
    
    

    
    output$plot <- renderPlot({
        
        ggplot(data=read_csv("./final1.csv"), aes_string(x ="Year", y = read_csv("./final1.csv")[[input$variable]])) + 
            geom_point()+
            geom_path()+
            theme_bw()+
            xlab("Year") +
            ylab("Deaths") 
        
        
    })
    
    

    library(colorspace)
    red <- hex(HLS(.2, 0.88, .7))
    output$statebox2 <- renderPlotly({
        fig <- plot_ly(x= ~input$variable ,y = ~read_csv("./final1.csv")[[input$variable]], type = "box", color = I(red))%>%
            layout( yaxis = list(title = "Deaths"),  xaxis = list(title = "Drug Type"))
        hide_legend(fig)
    })
    
    
    
    
    
    
    
    
    
    
    
    output$graph <- renderPlotly({
        fig <- plot_geo(read_csv("./map.csv"),
                        locationmode = 'USA-states',
                        frame=~Year)%>%
            add_trace(locations = ~Code,
                      z = ~Deaths, 
                      color = ~Deaths, 
                      colors = 'Reds',
                      zmin=0,
                      zmax=max(read_csv("./map.csv")$Deaths),
                      text= ~hover,
                      hoverinfo='text'
            )%>%
            layout(geo=list(scope='usa'))
        fig
        
    })
    
}



# Run the application 
shinyApp(ui = ui, server = server)
