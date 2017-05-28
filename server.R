
library(shiny)

shinyServer(function(input, output) {
  cars$speedmid <- ifelse(cars$speed - 15 > 0, cars$speed - 15, 0)
  
  model1 <- lm(dist ~ speed, data = cars)
  model2 <- lm(dist ~ speed + speedmid, data = cars)
  
  model1pred <- reactive({
    mphInput <- input$sliderMPH
    predict(model1, newdata = data.frame(speed = mphInput))
  })
  
  model2pred <- reactive({
    mphInput <- input$sliderMPH
    predict(model2, newdata = 
              data.frame(speed = mphInput,
                         speedmid = ifelse(mphInput - 15 > 0,
                                        mphInput - 15, 0)))
  })
  
  output$plot1 <- renderPlot({
    mphInput <- input$sliderMPH
    
    minX <- input$sliderX[1]
    maxX <- input$sliderX[2]
    minY <- input$sliderY[1]
    maxY <- input$sliderY[2]
    
    plot(cars$speed, cars$dist, xlab = "Speed (mph)", 
         ylab = "Stopping distance (ft)", bty = "n", pch = 16, 
         xlim = c(minX, maxX), ylim = c(minY, maxY),
         main = "Speed and Stopping Distances of Cars")
    
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }
    
    if(input$showModel2){
      model2lines <- predict(model2, newdata = data.frame(
        speed = 1:25, speedmid = ifelse(1:25 - 15 > 0, 1:25 - 15, 0)
      ))
      lines(1:25, model2lines, col = "blue", lwd = 2)
    }
    
    legend(18, 20, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
           col = c("red", "blue"), bty = "n", cex = 1.2)
    
    points(mphInput, model1pred(), col = "red", pch = 16, cex = 2)
    
    points(mphInput, model2pred(), col = "blue", pch = 16, cex = 2)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
})  


