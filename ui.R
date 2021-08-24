shinyUI(
  fluidPage(
    theme = shinythemes::shinytheme("readable"), 
    titlePanel("SIT Candidate Strategies"),
    tags$br(),
    fluidRow(
      column(width = 6, style = "background-color:#d3d3d3;",
             tags$h5("Cummulative Effort"),
             selectInput("Scenario", 
                         label = "Select Strategies", 
                         choices = c('One', 'Two', 'Three', 
                                     'Four', 'Five', 'Six', 
                                     'Seven', 'Eight', 'Nine', 
                                     'Ten', 'Eleven', 'Twelve', 
                                     'Thirteen')),
             plotlyOutput("cumulative_acres_plot"), 
             tags$br(),
             htmlOutput("text")),
      column(width = 4,
             tags$br(),
             tags$h5("Watershed Action Details"),
             uiOutput('watershed_input_ui'),
             plotlyOutput('Watershed_graph'))
      ))
    )


