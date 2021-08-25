shinyUI(
  fluidPage(
    theme = shinythemes::shinytheme("lumen"), 
    tags$h1("SIT Candidate Restoration Strategies"),
    tags$br(),
    tags$p('The SIT developed 13 candidate restoration strategies to evaluate in the Chinook salmon decision support models. The model output based on these candidate restoration strategies informed the development of the priorities in the CVPIA Near-term Restoration Strategy.'),
    style = "padding: 2rem;",
    fluidRow(
      column(
        width = 12, 
        tags$h2("Cumulative Units of Effort"),
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


