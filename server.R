function(input, output) {
  
  output$countryranks = renderPlot({
    if(input$countries == "Top 20") {
      countries20 %>%
        ggplot(aes(reorder(`chocolate[, 6]`,chocolate.Rating), chocolate.Rating, fill=chocolate.Rating
        )) + geom_bar(color="blue", stat = "identity") + coord_flip() + theme(text = element_text(size = 18)) +
        scale_y_continuous(name="Rating") +
        scale_x_discrete(name="Countries")
    } else if (input$countries == "21-40") {
      countriesmid %>%
        ggplot(aes(reorder(`chocolate[, 6]`,chocolate.Rating), chocolate.Rating, fill=chocolate.Rating
        )) + geom_bar(color="blue", stat = "identity") + coord_flip() + theme(text = element_text(size = 18)) +
        scale_y_continuous(name="Rating") +
        scale_x_discrete(name="Countries")
    } else {
      countriestail %>%
        ggplot(aes(reorder(`chocolate[, 6]`,chocolate.Rating), chocolate.Rating, fill=chocolate.Rating
        )) + geom_bar(color="blue", stat = "identity") + coord_flip() + theme(text = element_text(size = 18)) +
        scale_y_continuous(name="Rating") +
        scale_x_discrete(name="Countries")
    }
    })
  
  output$cocoa_percent = renderPlot({
    chocolate$Rating = as.numeric(chocolate$Rating)
    chocolate$Cocoa.Percent <- as.numeric(sub("%", "", chocolate$Cocoa.Percent))
    ggplot(chocolate, aes(x=Cocoa.Percent, y=Rating)) +
      geom_point() +
      geom_smooth(method=lm, se=FALSE, fullrange=TRUE) +
      theme(text = element_text(size = 20))
  })
  
  output$bean_origin_freq = renderPlot({
    origin_frequency %>%
      ggplot(aes(reorder(Bean.Origin,Frequency), Frequency, fill=Frequency
      )) + geom_bar(color="green", stat = "identity") + coord_flip() +
      scale_y_continuous(name="Number of Data Points") +
      scale_x_discrete(name="Bean Origin") + theme(text = element_text(size = 18))
  })
  
  output$first_group_bar = renderPlot({
    first_group %>%
      ggplot(aes(Bean.Origin, chocolate.Rating
      )) + geom_bar(color="purple", stat = "identity") + theme(text = element_text(size = 18)) +
      scale_y_continuous(name="Mean Chocolate Rating") +
      scale_x_discrete(name="Bean Origin")
  })
  
  output$first_group_box = renderPlot({
    ggplot(chocolate2, aes(Broad.Bean.Origin, Rating)) + geom_boxplot() +
      theme(text = element_text(size = 18)) +
      scale_y_continuous(name="Chocolate Rating") +
      scale_x_discrete(name="Bean Origin") 
  })
  
  output$second_group_box = renderPlot({
    ggplot(chocolate3, aes(Broad.Bean.Origin, Rating)) + geom_boxplot() +
      theme(text = element_text(size = 18)) +
      scale_y_continuous(name="Chocolate Rating") +
      scale_x_discrete(name="Bean Origin")
  })
  
  output$third_group_box = renderPlot({
    ggplot(chocolate4, aes(Broad.Bean.Origin, Rating)) + geom_boxplot() +
      theme(text = element_text(size = 18)) +
      scale_y_continuous(name="Chocolate Rating") +
      scale_x_discrete(name="Bean Origin")
  })
  
  output$first_countries = renderPlot({
    ggplot(count_rate1, aes(Company.Location, Rating)) + geom_boxplot() +
      theme(text = element_text(size = 18)) +
      scale_y_continuous(name="Chocolate Rating") +
      scale_x_discrete(name="Countries")
  })
  
  output$second_countries = renderPlot({
    ggplot(count_rate2, aes(Company.Location, Rating)) + geom_boxplot() +
      theme(text = element_text(size = 18)) +
      scale_y_continuous(name="Chocolate Rating") +
      scale_x_discrete(name="Countries")
  })
  
  output$chocdata = DT::renderDataTable({
    chocolate
  })
  
}