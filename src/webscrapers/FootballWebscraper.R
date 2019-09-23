#################
# Webscraper for Football Data
# Author: Sean Kennedy
# Last Updated September 23, 2019
#################

library(rvest)
library(stringi)
library(tidyverse)
library(glue)


# global variables to be loaded into memory
ROOT_URL = 'https://fantasydata.com/nfl/fantasy-football-leaders'
SEASONS = list(c(2017, 2018))


#'Retrieve Football Data From Fantasy Data Site
#'
#'Input: The root url and a list containing a vector of season years.
#'Output: Football Data in XML format.
#'@param root_url a root url to pass into a get request
#'@param season_list a list object containing a vector of integers corresponding to the years of the desired football seasons 
getFootballData <- function(root_url = ROOT_URL, seasons_list = SEASONS) {
  for(x in seasons){
    url = glue::glue('{base_url}?season={x}&seasontype=1&scope=2&subscope=1&startweek=1&endweek=1&aggregatescope=1&range=1')
    show(url[1])
    season_page = read_html(url[1])
  }
}