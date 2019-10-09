###################
# Gathers and Preprocesses Scraped Data from Fantasy Data Site
# Author: Kevin Thompson, SK
# Last Updated September 23, 2019
###################
library(here)
library(tibble)
library(purrr)
library(dplyr)
library(rjson)
library(stringr)
library(lubridate)
library(tidyr)
library(rlang)
library(naniar)



QBCrossSectional <- getFootballData(url = getURL()) %>%  # FootballWebscraper.R
                      filterUnwantedVariables() %>%  # VariableFilter.R
                      withGameDates() %>%  # parsing_dates.R
                      filter(Position == "QB") %>%
                      addDerivedFeatures() #derivedFeatures.R
                  


QBCrossSectional_Test <- getFootballData(url = getURL(2018)) %>%  # FootballWebscraper.R
  filterUnwantedVariables() %>%  # VariableFilter.R
  withGameDates() %>%  # parsing_dates.R
  filter(Position == "QB") %>%
  addDerivedFeatures() #derivedFeatures.R


QBPanels <- QBCrossSectional %>% select(-c(Position)) %>% createPanelList()  # createPanels.R

