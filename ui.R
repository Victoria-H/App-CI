library(shiny)



shinyUI(pageWithSidebar(
  headerPanel("Exploring confidence intervals for a mean"),
  
  
  sidebarPanel(
    h5("See what happens to the confidence interval when you change the parameters below."),
    br(),
    selectInput("sig", label = ("Select a significance level %"), 
                choices = list("90%" = 90, "95%" = 95, "99%" = 99), 
                selected = 1),
    
    sliderInput('mean', 'Select a value for the sample mean',value = 10, min = 7, max = 13, step = 0.5,),
  
    
 
    
    
    sliderInput('n', 'Select a value for n (sample size)',value = 100, min = 30, max = 200, step = 10,),
  
    sliderInput('s', 'Select a value for the sample standard deviation',value = 5, min = 0, max = 10, step = 0.5,)
  ),
  mainPanel(
    h4("You wish to give an interval estimate of the population mean from a sample."),
    p("How does that interval change according to the confidence level you specify, the sample size (n) and the mean and standard deviation of the sample?"),
    plotOutput('conf'),
    tableOutput("table"),
    p("NOTES:"),
    p("This app is designed for students and teachers of statistics to further understanding of how a confidence interval changes when parameters are varied."),
    p("It requires a basic understanding of what a confidence interval for a mean is, and this is assumed without explanation")
  )
))


