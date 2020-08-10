dashboardPage(
  skin="yellow",
  
  dashboardHeader(title = "Chocolate Ratings", titleWidth = 250),
  
  dashboardSidebar(
    width=250,
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Bean Origin and Rating", tabName="bean_origin", icon=icon("seedling")),
      menuItem("Country_Rankings", tabName="country_rankings", icon=icon("globe-americas")),
      menuItem("Cocoa and Rating", tabName="cocoa", icon=icon("percent")),
      menuItem("Data", tabName = "data", icon=icon("desktop"))
    )
  ),
  
  dashboardBody(
    tags$head(tags$style(HTML('
      .main-header .logo {
        font-family: "Georgia", Times, "Times New Roman", serif;
        font-weight: bold;
        font-size: 20px;
      }
    '))),
    
    tabItems(
      
      tabItem(tabName="home",
              fluidRow(column(width=6, align="left", box(width=12, h1(tags$b("Chocolate Ratings Study: Introduction")),
                                      br(),
                                      img(src = "chocolate_pic.jpeg", width="750"),
                                      br(),
                                      br(),
                                      h3(p("The dataset for this project was retrieved from Kaggle. The data
                                           was compiled by the Manhattan Chocolate Society. This study aims
                                           to answer the following questions:")),
                                      h3(p("1. Based on ratings, which regions
                                           grow the best cocoa beans?\n")),
                                      h3(p("2. Which countries produce the best chocolate
                                           bars?\n")),
                                      h3(p("3. Is there a relationship between the percentage of cocoa solids
                                           and ratings?"))
                                      )))
              ),
      
      tabItem(tabName = "country_rankings",
              fluidRow(
                sidebarLayout(
                  sidebarPanel(width = 2,
                               selectizeInput(inputId = "countries",
                                      label = h3("Choose Rankings:"),
                                      choices = c("Top 20", "21-40", "41-60"), 
                                      selected="Top 20")),
                  mainPanel(
                      tags$h3("Chocolate Ratings by Country"), 
                       plotOutput("countryranks")))),
              br(),
              br(),
              h3("Countries with ~51-150 Data Points and Countries with ~25-50 Data Points"),
              fluidRow(box(width = 6, plotOutput("first_countries")),
                       column(width = 6, plotOutput("second_countries"))
                       )
            ),
      
      tabItem(tabName = "bean_origin",
            fluidPage(
              h1(tags$b("Is There a Correlation Between Bean Origin Region and Chocolate Ratings?")),
              fluidRow(box("The graph on the right shows the frequency with
                           which a bean origin region occurs in the dataset. There were approximately 200 or more 
                           regions present in the dataset, and of those the top 20 regions are displayed here.
                           The top 20 frequently occuring regions have been divided into 3 datasets with regions that
                           share similar amounts of data points. The chocolate ratings regions in these 3 groups 
                           are displayed below.", width = 3, style = "font-size:18px"),
                       box(width = 6, plotOutput("bean_origin_freq"))
                       ),
              br(),
              h2("1st Group: Bean Origin Region and Rating"),
              fluidRow(box(width = 5, plotOutput("first_group_bar")),
                       column(width = 5, plotOutput("first_group_box"))
                       ),
              br(),
              h2("2nd Group: 40-60 Data Points; 3rd Group: 25-39 Data Points"),
              fluidRow(box(width = 6, plotOutput("second_group_box")),
                       column(width = 6, plotOutput("third_group_box"))
                      ))
              ),
      
      tabItem(tabName = "cocoa",
              h1(tags$b("Correlation Between Cocoa Percentage and Rating")),
              fluidRow(box("The linear regression line shows a negative correlation between cocoa percentage and 
                           rating. To confirm, a Pearson's correlation test was run. The results returned a 
                           p-value = 2.122e-12 and a correlation coefficient of -0.1648202. Thus, the null
                           hypothesis was rejected in favor of the alternative hypothesis which stated that the
                           true correlation is not equal to 0. Although there is a negative correlation present,
                           it is very small. Furthermore, the negative correlation does not necessarily mean
                           that chocolates with a higher percentage of cocoa do not taste as good as chocolates
                           with a smaller percentage of cocoa. Instead, the tasters sampling the chocolate in this
                           dataset could have palettes that prefer less bitter chocolates.", width = 3, 
                           style = "font-size:18px"),
                       box(width = 6, plotOutput("cocoa_percent"))
                       )
              ),
          
      tabItem(tabName = "data", 
              h1(tags$b("Chocolate Ratings Data")),
              fluidRow(box(DT::dataTableOutput("chocdata"), width=12))
              )
      )
    )
 )