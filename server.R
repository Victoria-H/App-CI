shinyServer(
  function(input, output) {
    output$conf <- renderPlot({
      mean<-input$mean
      sig<-as.numeric(input$sig)
      n<-input$n
      s<-input$s
      z<-qnorm(sig/200+0.5)
      upper<-mean+z*s/n^0.5
      lower<-mean-z*s/n^0.5
      # tab<-data.frame(c("lower bound","mean","upper bound"),c(1,1,1),c(lower,mean,upper))
      plot(x=c(lower,mean,upper),y=c(0,0,0),type='l',xlim=c(0,20),yaxt='n',ann=FALSE, col="red", frame=FALSE, lwd=3)
     
    })
  
    int <- reactive({
      mean<-input$mean
      sig<-as.numeric(input$sig)
      n<-input$n
      s<-input$s
      z<-qnorm(sig/200+0.5)
      upper<-mean+z*s/n^0.5
      lower<-mean-z*s/n^0.5
      # Compose data frame
     df<-data.frame(c("Lower bound", "Sample mean","Upper bound"), as.character(c(lower,input$mean,upper)),stringsAsFactors=FALSE)
     df<-t(df)
     ##colnames(df)<-c("Lower bound", "Sample mean","Upper bound")
     ##rownames(df)<-c("interval")
    }) 
    
    # Show the values using an HTML table
    output$table <- renderTable({
      int()
    },
    include.rownames=FALSE,
    include.colnames=FALSE)
    
  }
)

