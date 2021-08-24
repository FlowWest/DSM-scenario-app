server <- function(input, output) {
  selected_scenario <- reactive({
    scenario_data %>% filter(scenario == toupper(input$Scenario)) 
  })
  
  output$cumulative_acres_plot <- renderPlotly({
    watersheds_with_actions <- selected_scenario() %>%
      filter(units_of_effort > 0) %>% 
      pull(watershed) %>% 
      unique()
    print(watersheds_with_actions)
    plot_data <- selected_scenario() %>%
      mutate(action_amount = case_when(
        action_type == "survival" ~ .5 * units_of_effort,
        action_type == "spawn" ~ units_of_effort,
        action_type == "inchannel" ~ 2 * units_of_effort,
        action_type == "floodplain" ~ 3 * units_of_effort)) %>% 
      group_by(watershed, action_type) %>% 
      summarise(total_action_amount = sum(action_amount),
                total_effort = sum(units_of_effort)) %>% 
      ungroup() %>% 
      filter(watershed %in% watersheds_with_actions)
    View(plot_data)
    plot_data %>% 
      plot_ly(y = ~watershed, x = ~total_effort, color = ~action_type, type = "bar",
              legendgroup = ~action_type, orientation = 'h',
              colors = pal) 
  })
  
  output$watershed_input_ui <- renderUI({
     option <- selected_scenario() %>%
      filter(units_of_effort > 0) %>% 
      pull(watershed) %>% 
      unique()
    
    selectInput('watershed', label = 'Select Watershed', 
                choices = option)
  })
  
  output$Watershed_graph <- renderPlotly({
    d <- selected_scenario() %>% 
      filter(watershed == "Upper Sacramento River")
    
    d %>% 
      plot_ly(x = ~year, y = ~units_of_effort, color = ~action_type, 
              colors = c("#00A08A", "#5BBCD6","#F2AD00", "#FF0000"),
              type = "bar")
    
  })
  
  output$text <- renderUI({
    return(HTML(paste("<strong>", scenario_names[[input$Scenario]], "</strong>", ":", descriptions[[input$Scenario]])))
  })
} 