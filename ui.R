
library(shiny)

# Define UI for application that estimate a prediction model
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict the Distances (ft) Taken to Stop from the Speed (mph) of Cars"),
  
  # Sidebar with a slider input for speed 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderMPH",
                   "What is the speed (mph) of the car?",
                   min = 4,
                   max = 25,
                   value = 15),
       sliderInput("sliderX", "Pick Minimum and Maximum X Values Shown in Graph", 
                   0,30, value = c(4,25)),
       sliderInput("sliderY", "Pick Minimum and Maximum Y Values Shown in Graph", 
                   0,150, value = c(2,120)),
       checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
       checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
       submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h5("Please use the controls on the left side bar panel to select:"),
      h5("1. The speed (mph) of the car"),
      h5("2. The minimum and maximum X Values shown in graph"),
      h5("3. The minimum and maximum Y Values shown in graph"),
      h5("4. Show or hide model 1"),
      h5("5. Show or hide model 2"),
      h5("The graph adjusts automatically to reflect the effect of car's speed on the stopping distance.")
      ,
       plotOutput("plot1"),
       h3("Predicted Stopping distance (ft) from Model 1:"),
       textOutput("pred1"),
       h3("Predicted Stopping distance (ft) from Model 2:"),
       textOutput("pred2")
    )
  )
))
