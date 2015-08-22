library(shiny)

shinyUI(fluidPage(
titlePanel("Prediction model for economics dataset"),
  
  sidebarLayout(position = "right",
                sidebarPanel(h4("Input Panel"),
                             h5("Please select the sample group and time period below to perform prediction."),
                             selectInput("Sample_for_View","Select group to view:",
                                         list("Personal Savings Rate"=4,
                                              "Personal Consumption Expenditures"=2,
                                              "Number of Unemployed"=6,
                                              "Median Duration of Unemployment"=5),
                                         selected = list("Median Duration of Unemployment"=5)),
                             sliderInput("year", 
                                         "Select the range of base year:", 
                                         value = c(1984,1994),
                                         min = 1970, 
                                         max = 2000),
                            sliderInput("predictPeriod", 
                                        "Select predict periods:", 
                                        value = 20,
                                        min = 1, 
                                        max = 50)
                             ),
                
                mainPanel(h3("Introduction"),
                          h5("The model is based on US economic time series dataset from ggplot2 package.The dataset was produced from US economic time series data available from http://research.stlouisfed.org/fred2.
                             It is a data frame with 478 rows and 6 variables"),
                          h5("To use the model, you can change inputs on variables through right hand input panel. The prediction model used is ARIMA, whose parameters would be defined automatically based on your input by auto.arima function of R."),
                          plotOutput("predictPlot")
                          )
                )
))
