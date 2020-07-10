library(shiny)
shinyUI(fluidPage(
  titlePanel("Analying Trees"),
  sidebarLayout(
    sidebarPanel(
          sliderInput("slideGirth","What is the Girth of the tree?", min = 9, max = 20, value = 14),
          checkboxInput("showModel", "Show Model Fit", value = TRUE),
          submitButton("Submit")
    ),
    mainPanel(
          plotOutput("plot"),
          h3("Model Coefficients : "),
          h4("Intercept : "),
          textOutput("intercept"),
          h4("Slope : "),
          textOutput("slope"),
          em(h3("Predicted Volume of Tree : ")),
          h4(textOutput("predVolume"))
    )
  )
))
