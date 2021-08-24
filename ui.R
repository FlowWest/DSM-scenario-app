shinyUI(
  fluidPage(
    theme = shinythemes::shinytheme("lumen"), 
    tags$h1("SIT Candidate Strategies"),
    tags$br(),
    style = "padding: 2rem;",
    fluidRow(
      column(
        width = 12, 
        tags$h2("Cummulative Units of Effort"),
        selectInput("Scenario", 
                    label = "Select Strategy", 
                    choices = c('One', 'Two', 'Three', 
                                'Four', 'Five', 'Six', 
                                'Seven', 'Eight', 'Nine', 
                                'Ten', 'Eleven', 'Twelve', 
                                'Thirteen')),
        plotlyOutput("cumulative_acres_plot"), 
        tags$br(),
        htmlOutput("text"),
        tags$hr()),
        tags$br(),
    ),
    fluidRow(
      column(
        width = 12,
        tags$h2("Watershed Action Details"),
        uiOutput('watershed_input_ui'),
        plotlyOutput('Watershed_graph'))
    ))
)


