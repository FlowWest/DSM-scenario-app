library(shiny)
library(shinycssloaders)
library(shinythemes)
library(tidyverse)
library(plotly)
library(stringr)
library(DT)
library(DSMscenario)

# Load scenario dataframe
scenario_data <- read_rds('data/scenario_data.rds')
colors <- c("#85D4E3", "#F4B5BD", "#9C964A", "#CDC08C", "#FAD77B")
pal <-  c("#00A08A", "#5BBCD6","#F2AD00", "#FF0000")


descriptions <- c('Juvenile perennial habitat restoration focused in upper and lower-mid Sac River; Butte, Deer and Battle Creeks; and the Stanislaus and Feather Rivers',
                  'Juvenile perennial habitat restoration focused in upper and lower-mid Sac River; Butte, Deer and Clear Creeks; and the Stanislaus and Feather Rivers',
                  'Juvenile perennial habitat restoration focused in upper and lower-mid Sac River; Butte and Clear Creeks;  and the Stanislaus, Mokelumne, and Feather Rivers',
                  'Juvenile perennial habitat restoration focused in the mainstem Sac and San Joaquin Rivers',
                  'Juvenile perennial habitat restoration focused in upper, upper-mid, and lower-mid Sac River and Cow and Clear Creeks',
                  'Juvenile perennial habitat restoration focused in the upper and lower-mid Sac River; American River; and Clear Creeks with maintaining existing habitat in Clear and Butte Creeks and the Upper Sac River.',
                  'Juvenile seasonally-inundated habitat restoration focused in the mainstem Sacramento and San Joaquin Rivers',
                  'Optimal habitat restoration actions for winter run in the mainstem Sac with an emphasis on the Sac River below Red Bluff',
                  'Optimal habitat restoration actions for spring run in the upper-mid and lower Sac River; Battle, Butte,  Clear, Deer, Mill, and Antelope Creeks;  and the Feather River with an emphasis on the Sac River and Battle, Butte, and  Clear Creeks',
                  'Optimal habitat restoration actions for spring run in the upper-mid Sac River and Battle, Butte,  Clear, Deer, Mill, and Antelope Creeks;  and the Feather River equally allocated across tributaries',
                  'Optimal habitat restoration actions for fall run with at least one action per year in a tributary in each diversity group',
                  'Optimal habitat restoration actions for fall run in the upper and lower Sac River and the American, Stanislaus, and Calaveras Rivers equally allocated across tributaries',
                  'Optimal habitat restoration actions for fall run in the upper and lower Sac River and the American, Stanislaus, and Mokelumne Rivers equally allocated across tributaries'
                  
                  )

scenario_names <- c('Strategy One', 
                    'Strategy Two', 
                    'Strategy Three', 
                    'Strategy Four', 
                    'Strategy Five', 
                    'Strategy Six', 
                    'Strategy Seven', 
                    'Strategy Eight', 
                    'Strategy Nine', 
                    'Strategy Ten', 
                    'Strategy Eleven', 
                    'Strategy Twelve', 
                    'Strategy Thirteen')

# percent_change <- tibble(
#   `Scenario Name` = rep(scenario_names, 3), 
#   `Description` = rep(descriptions, 3),
#   `Natural Spawners` = paste0(round(runif(39) * 100), "%"),
#   `Juvenile Biomass` = paste0(round(runif(39) * 100), "%"),
#   `Run` = c(rep("Fall Run", 13), rep("Spring Run", 13), rep("Winter Run", 13))
# )

scenario_numbers <- c('One', 'Two', 'Three',
                      'Four', 'Five', 'Six',
                      'Seven', 'Eight', 'Nine',
                      'Ten', 'Eleven', 'Twelve',
                      'Thirteen')
names(scenario_names) <- scenario_numbers
names(descriptions) <- scenario_numbers
