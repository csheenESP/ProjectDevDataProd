# rm(list = ls(all = TRUE))
# setwd("c:/carlos/cursosjh/develdataprod/pruebas/projectNEW/")

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Wage Predictor"),
    sidebarPanel(
        sliderInput("a","Age (1-99)", 0, min=0, max=99),
        checkboxInput("s", "Male?", FALSE),
        selectInput("m", "Marital Status", 
                            c("Single"="1. Never Married",
                             "Married"="2. Married",
                             "Widowed"="3. Widowed",
                             "Divorced"="4. Divorced",
                             "Separated"="5. Separated")),
          radioButtons("e", "Education Level", 
                     c("Not Graduated"="1. < HS Grad",
                       "Graduated    "="2. HS Grad",
                       "Some College "="3. Some College",
                       "College Grad."="4. College Grad",
                       "Adv. Degree  "="5. Advanced Degree")),
          submitButton("Submit"),
          helpText("Enter the Age of the person (must be greater than zero), Sex, Marital and Education information",
                   "and press the SUBMIT button",
                   "to get a Wage prediction based on",
                   "a linear regression model"), 
          helpText("You can make any changes and a new prediction will be",
                 "generated every time you press SUBMIT")
            ),
    mainPanel(
        h4("Age entered: "), verbatimTextOutput("age_o"),
        h4("Sex entered: "), verbatimTextOutput("sex_o"),
        h4("Marital Status entered: "), verbatimTextOutput("mar_o"),
        h4("Education entered: "), verbatimTextOutput("edu_o"),
        h4("Wage Forecasted: "), verbatimTextOutput("predict")
        #h4("O"), verbatimTextOutput("oo")
        )
    )
)

