######################
# Code for creating panels out of the data
# Author: Kevin Thompson
# Last Updated September 28, 2019
######################
library(tidyr)
library(dplyr)
library(purrr)
library(tibble)
library(naniar)


createPanelList <- function(tibble){
  values = tibble %>% select(-c(PlayerID, Week, GameDate)) %>% colnames()
  temp_panel_list = map(values, createPanels, tibble = tibble)
  names(temp_panel_list) <- values
  return(temp_panel_list)
}

# Replace NA with <NA>
createPanels <- function(value, tibble){
  temp_tibble = tibble
  temp_tibble$temp_value = unlist(tibble[,value])
  temp_tibble = temp_tibble %>% select(c(Week, PlayerID, temp_value))
  temp_panel = spread(data = temp_tibble, key = Week, value = temp_value)
  return(temp_panel)
}

