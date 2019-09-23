###################
# Gathers and Preprocesses Scraped Data from Fantasy Data Site
# Author: Kevin Thompson
# Last Updated September 23, 2019
###################
library(here)

FOOTBALL_WEBSCRAPER_PATH <- here("src", "webscrapers", "FootballWebscraper.R")
source(FOOTBALL_WEBSCRAPER_PATH)

rawFootballData <- getFootballData()