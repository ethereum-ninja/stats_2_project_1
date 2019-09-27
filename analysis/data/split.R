###################
# Gathers and Preprocesses Scraped Data from Fantasy Data Site
# Author: Kevin Thompson
# Last Updated September 23, 2019
###################
library(here)
library(tibble)
library(purrr)
library(dplyr)
library(rjson)
library(stringr)
library(lubridate)

rawFootballData <- getFootballData(url = URL)
FootballDatawithDates <- rawFootballData
FootballDatawithDates$GameDate <- FootballDatawithDates$GameDate %>%
                                    map_chr(getGameDates) %>%
                                    as_date()

relevant_positions = c("QB", "RB", "WR")

DataListByPosition <- FootballDatawithDates %>% 
                        filter(Position %in% relevant_positions) %>%
                        select(-c(StatSummary)) %>%
                        group_split(Position)
names(DataListByPosition) <- c("QB", "RB", "WR")



QBdata <- DataListByPosition$QB
WRdata <- DataListByPosition$WR
RBdata <- DataListByPosition$RB



rm(DataListByPosition, rawFootballData, FOOTBALL_WEBSCRAPER_PATH,
   relevant_positions, URL, getFootballData, getFootballPlayersJSON,
   removeColumnsWithWrongLength, FootballDatawithDates)
