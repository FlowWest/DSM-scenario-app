shinyUI(
  fluidPage(
    theme = shinythemes::shinytheme("readable"), 
    titlePanel("DSM Scenarios", windowTitle = "DSM Scenarios"),
    column(width = 10, 
             tags$h4("Action Type and Units of Effort"),
             fluidRow(column( width = 4, selectInput("Scenario", 
                                                     label = "Scenarios", 
                                                     choices = c('One', 'Two', 'Three', 
                                                                 'Four', 'Five', 'Six', 
                                                                 'Seven', 'Eight', 'Nine', 
                                                                 'Ten', 'Eleven', 'Twelve', 
                                                                 'Thirteen')))),
             tags$br(),
             fluidRow(
             tabsetPanel(type = "tabs",
                         tabPanel("Actions Applied Over Time", plotlyOutput("actions_plot")),
                         tabPanel("Cummulative Acres Actions", plotlyOutput("cumulative_acres_plot"))), 
             htmlOutput("text"))
             
             
      )
    )
)


