#################
# Webscraper for Football Data
# Author: Sean Kennedy and Kevin Thompson
# Last Updated September 23, 2019
#################

library(tibble)
library(purrr)
library(rjson)
library(glue)


# 7 = team defense
# 1 = offensive positions
getURL = function(position = 1, year = 2017){
  return (glue("https://fantasydata.com/FantasyStatsNFL/FantasyStats_Read?sort=FantasyPoints-desc&pageSize=5000&group=&filter=&filters.position={position}&filters.team=&filters.teamkey=&filters.season={year}&filters.seasontype=1&filters.scope=2&filters.subscope=1&filters.redzonescope=&filters.scoringsystem=&filters.leaguetype=&filters.searchtext=&filters.week=&filters.startweek=1&filters.endweek=17&filters.minimumsnaps=&filters.teamaspect=&filters.stattype=&filters.exportType=&filters.desktop=&filters.dfsoperator=&filters.dfsslateid=&filters.dfsslategameid=&filters.dfsrosterslot=&filters.page=&filters.showfavs=&filters.posgroup=&filters.oddsstate=&filters.aggregatescope=1&filters.rangescope=&filters.range=1"))
}

getFootballData <- function(url){
  football_players = getFootballPlayersJSON(url = url)
  football_players = map(football_players, removeColumnsWithWrongLength)
  football_players = map_df(football_players, as_tibble)
  return(football_players)
}

getFootballPlayersJSON <- function(url){
  json_list = fromJSON(file = url)
  return(json_list$Data)
}

removeColumnsWithWrongLength <- function(data){
  a <- map(data, function(x){if(length(x) == 1){return(x)}})
  a[sapply(a, is.null)] <- NULL
  return(a)
}

