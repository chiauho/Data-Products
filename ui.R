library(shiny)

shinyUI(
  pageWithSidebar(
  
    headerPanel("Your Braking Distance"),
  
    sidebarPanel(
      h3("INSTRUCTIONS"),
      h4("Enter your driving speed (in mph) on the right. Your braking distance (in ft) will be computed and the results return to you."),
      h4("Two sets of results will be returned - average distance and upper boundary distance based on 95% confidence interval."),
      h4("A default value of 10mph is loaded on startup.")    
      
    ),
  
    mainPanel(
      numericInput("speed","Input your speed (4 to 25 mph) using arrow keys. Then hit Submit button.",10, min=4,max=25,step=1),
      submitButton("Submit"),
      h3("R E S U L T S"),
      h4("Your average braking distance (ft) should be"),
      verbatimTextOutput("prediction"),
      h4("But you should give yourself some buffer distance (based on 95% confidence interval)"),
      verbatimTextOutput("up")
      )
  )
)