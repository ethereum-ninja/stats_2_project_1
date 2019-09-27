###################
# File for Parsing
# Author: Kevin Thompson
# Last Updated September 26, 2019
###################

library(stringr)

getGameDates <- function(gamedate){
  date_number = extractDateNumber(gamedate = gamedate)
  date = convertToDate(extracted_date = date_number)
  return(date)
}

extractDateNumber <- function(gamedate){
  require(stringr)
  temp_string = str_extract(gamedate, "\\d+")
  temp_integer = as.numeric(temp_string)
  return(temp_integer)
}

convertToDate <- function(extracted_date){
  temp_date <- as.POSIXct(extracted_date/1000, origin="1970-01-01", tz = "America/Chicago")
  temp_date <- strftime(temp_date, format = "%Y-%m-%d", usetz = FALSE)
  return(temp_date)
}