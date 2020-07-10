library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
      
      model <- lm(Volume ~ Girth, data = trees)

      output$intercept <- renderText({
            coef(model)[1]
      })
      
      output$slope <- renderText({
            coef(model)[2]
      })
            
      modelpred <- reactive({
            slideGirth <- input$slideGirth
            predict(model, newdata = data.frame(Girth = slideGirth))
      })
      
      output$predVolume <- renderText(modelpred())
      
      output$plot <- renderPlot({
            plot(trees$Girth, trees$Volume, xlab = "Girth of Trees", ylab = "Volume of Trees",
                 main = "Trees Dataset", col = "black", cex = 2,
                 bty = "n", pch = 19, xlim = c(8,22), ylim = c(08,80))
            points(trees$Girth, trees$Volume, cex = 1.6, col = "orangered", pch = 19)
            if(input$showModel){
                  modelLines <- predict(model, newdata = data.frame(Girth = 5:25))
                  lines(5:25, modelLines, col = "red", lwd = 2)
            }
            points(input$slideGirth, modelpred(), pch = 19, col = "black", cex = 3)
            points(input$slideGirth, modelpred(), pch = 19, col = "cyan", cex = 2.6)
      })
})
