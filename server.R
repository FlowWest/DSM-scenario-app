server <- function(input, output) {
  selected_scenario <- reactive({
    scenario_data %>% filter(scenario == toupper(input$Scenario)) 
  })
  
  output$cumulative_acres_plot <- renderPlotly({
    watersheds_with_actions <- selected_scenario() %>%
      filter(units_of_effort > 0) %>% 
      pull(watershed) %>% 
      unique() %>% droplevels()

    print(watersheds_with_actions)
    
    plot_data <- selected_scenario() %>%
      mutate(
        action_amount = case_when(
        action_type == "survival" ~ .05 * units_of_effort,
        action_type == "spawn" ~ units_of_effort,
        action_type == "inchannel" ~ 2 * units_of_effort,
        action_type == "floodplain" ~ 3 * units_of_effort)) %>% 
      group_by(watershed, action_type) %>% 
      summarise(total_action_amount = sum(action_amount),
                total_effort = sum(units_of_effort)) %>% 
      ungroup() %>% 
      filter(total_action_amount > 0) %>%
      mutate(watershed = as.character(watershed),
             action_type = factor(action_type, 
                                  levels = c("floodplain", "inchannel", "spawn", "survival")),
             total_action_amount = ifelse(action_type == "survival", 
                                          round(total_action_amount * 100, 2), 
                                          total_action_amount),
             label = ifelse(action_type == "survival", 
                            paste0(total_action_amount, "% increase"), 
                            paste(total_action_amount, "acres")))
    
    plot_data %>% 
      plot_ly(y = ~watershed, x = ~total_effort, color = ~action_type, type = "bar",
              legendgroup = ~action_type, orientation = 'h', 
              hoverinfo = 'text',
              text = ~paste("Units of Effort:",total_effort,
                            "</br></br>Total Added:", label)) %>% 
      layout(yaxis = list(title = list(text ='')),
             xaxis = list(title = list(text ='')),
             showlegend = TRUE, barmode = 'stack',
             legend = list(orientation = 'h')) %>% 
      config(displayModeBar = FALSE)
  })
  
  output$watershed_input_ui <- renderUI({
     option <- selected_scenario() %>%
      filter(units_of_effort > 0) %>% 
      pull(watershed) %>% 
      unique()
    
    selectInput('watershed', 
                label = 'Select Watershed', 
                choices = option)
  })
  
  output$Watershed_graph <- renderPlotly({
    validate(need(
      nrow(selected_scenario()) > 0, ""
    ))
    
    d <- selected_scenario() %>% 
      filter(watershed == input$watershed)
    
    d %>% 
      plot_ly(x = ~year, y = ~units_of_effort, color = ~action_type, 
              type = "bar",
              hovertemplate = paste('Year: %{x}',
                                    '<br><b>Units of Effort </b>: %{y}<br>')) %>% 
      layout(yaxis = list(title = list(text ='Units of Effort')),
             xaxis = list(title = list(text ='')),
             # width = 750, autosize = TRUE,
             legend = list(orientation = 'h')) %>% 
      config(displayModeBar = FALSE)
    
  })
  
  output$text <- renderUI({
    return(HTML(paste("<strong>", scenario_names[[input$Scenario]], "</strong>", ":", descriptions[[input$Scenario]])))
  })
} 