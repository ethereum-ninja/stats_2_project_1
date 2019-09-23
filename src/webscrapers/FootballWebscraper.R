#################
# Webscraper for Football Data
# Author: Sean Kennedy
# Last Updated September 23, 2019
#################

library(rvest)
library(stringi)
library(tidyverse)
library(glue)


base_url = 'https://fantasydata.com/nfl/fantasy-football-leaders'
seasons = c(2017, 2018)

for(x in list(seasons)){
  url = glue::glue('{base_url}?season={x}&seasontype=1&scope=2&subscope=1&startweek=1&endweek=1&aggregatescope=1&range=1')
  show(url[1])
  season_page = read_html(url[1])
}