###################
# Gathers and Preprocesses Scraped Data from Fantasy Data Site
# Author: Kevin Thompson
# Last Updated September 23, 2019
###################
library(here)
library(tibble)
library(purrr)
library(dplyr)

FOOTBALL_WEBSCRAPER_PATH <- here("src", "webscrapers", "FootballWebscraper.R")
source(FOOTBALL_WEBSCRAPER_PATH)

rawFootballData <- getFootballData(url = URL)

relevant_positions = c("QB", "RB", "WR")

DataListByPosition <- rawFootballData %>% 
                        filter(Position %in% relevant_positions) %>%
                        select(-c(StatSummary)) %>%
                        group_split(Position)
names(DataListByPosition) <- c("QB", "RB", "WR")

QBdata <- DataListByPosition$QB
WRdata <- DataListByPosition$WR
RBdata <- DataListByPosition$RB

rm(DataListByPosition, rawFootballData, FOOTBALL_WEBSCRAPER_PATH,
   relevant_positions, URL, getFootballData, getFootballPlayersJSON,
   removeColumnsWithWrongLength)



