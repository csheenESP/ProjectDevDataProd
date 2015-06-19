library(shiny)
library(ISLR)
library(caret)
# url: https://csheenesp.shinyapps.io/projectNEW

data(Wage)
suppressWarnings(m <- train(wage ~ age+sex+maritl+education, method="lm",data=Wage))


shinyServer(
    function(input,output)
    {
        
    observe({
             
            if (input$s==TRUE) sex<- "1. Male"
            else sex<- "2. Female"
            mar <- input$m
            edu <- input$e
            age <- input$a
            o <- data.frame(cbind(age, sex, mar, edu))
            colnames(o) <- c("age","sex", "maritl", "education")
            o$age<-as.integer(age)
            
            if (age>0)
            {
                suppressWarnings(pred <- predict(m, newdata=o))
                output$predict <- renderPrint({ pred })
                output$sex_o <- renderPrint({sex}) 
                output$age_o <- renderPrint({input$a})      
                output$mar_o <- renderPrint({input$m}) 
                output$edu_o <- renderPrint({input$e})
                #output$oo <- renderPrint({str(o)})
            }
            
        
           })
    
    }
)