######################
# File for filtering unwanted variables
# Author: Kevin Thompson
# Last Updated September 28, 2019
######################
library(rlang)


filterUnwantedVariables <- function(tibble){
  temp_tibble = tibble %>% select(PlayerID, Week, Position, Opponent, TeamIsHome,
                                  GameDate, PassingCompletions,
                                  PassingAttempts, PassingCompletionPercentage,
                                  PassingYards, PassingYardsPerAttempt, PassingTouchdowns,
                                  PassingInterceptions, PassingRating, RushingAttempts,
                                  RushingYards, RushingYardsPerAttempt, RushingTouchdowns,
                                  FumblesLost, FantasyPoints, Team)
  return(temp_tibble)
}