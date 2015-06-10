library(shiny)

#Prediction model
data(cars)
model <- lm(dist~speed,data=cars)
   
predict_dist <- function(x) {
  df <- data.frame(speed = x)
  round(predict(model,df,interval="confidence"),0)

}

shinyServer(
  function(input,output,session){
    output$inputvalue <- renderPrint({input$speed}) #speed is the value the user input in ui.R
    output$prediction <- renderPrint({predict_dist(input$speed)[1]})
    output$up <- renderPrint({predict_dist(input$speed)[3]})
  }
)
