library(shiny)
library(UsingR)
library(dplyr)
library(ggplot2)
library(forecast)

shinyServer(function(input, output) {
  
  output$predictPlot <- renderPlot({
    # Read data set
    economics_tbl <- tbl_df(economics)  
    min_date <- input$year[1]
    max_date <- input$year[2]
    colLabel <- as.numeric(input$Sample_for_View)
    
    # Data filter
    economics_tbl_year <- mutate(economics_tbl,date_year = substring(date,1,4))
    economics_tbl_filtered <- filter(economics_tbl_year,date_year > min_date & date_year<max_date)
    economics_tbl_filtered_colSelect <- economics_tbl_filtered[,colLabel]
    
    # predict plot    
    predictModel <- auto.arima(economics_tbl_filtered_colSelect)
    forecastResult <- forecast(predictModel,h=input$predictPeriod)
    plot(forecastResult)
    lines(economics_tbl_filtered_colSelect)
  })
})
