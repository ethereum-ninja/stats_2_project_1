library(tidyr)
library(dplyr)
library(purrr)
library(tibble)
library(naniar)
library(QuantTools)

addDerivedFeatures = function(tibble, min_weeks_played=8){
  temp_tibble = tibble
  temp_tibble = temp_tibble %>% group_by(PlayerID) %>% filter(n() >= min_weeks_played)%>% arrange(Week)%>% mutate(CumulativeAveragePassingYards=cummean(PassingYards)
                                                                                                    , CumulativeAveragePassingTouchdowns=cummean(PassingTouchdowns)
                                                                                                    , CumulativeAveragePassingInterceptions=cummean(PassingInterceptions)
                                                                                                    , CumulativeAveragePassingRating=cummean(PassingRating)
                                                                                                    , CumulativeAverageCompletions = cummean(PassingCompletions) # not sure that completions matter much - most leagues don't reward them
                                                                                                    , CumulativeAverageCompletionPercentage = cummean(PassingCompletionPercentage)
                                                                                                    , CumulativeMaxPassingTouchdowns = cummax(PassingTouchdowns) 
                                                                                                    , CumulativeMaxPassingYards = cummax(PassingYards)
                                                                                                    , CumulativeMaxPassingAttempts = cummax(PassingAttempts)
                                                                                                    , CumulativeMaxPassingRating = cummax(PassingRating)
                                                                                                    , CumulativeMaxCompletions = cummax(PassingCompletions)
                                                                                                    , CumulativeMaxPassYardsPerAttempt = cummax(PassingYardsPerAttempt)
                                                                                                    , CumulativeMinPassingYards = cummin(PassingYards)   #Let's get mins to capture downside risk
                                                                                                    , CumulativeMinPassingAttempts = cummin(PassingAttempts)
                                                                                                    , CumulativeMinPassingRating = cummin(PassingRating)
                                                                                                    , CumulativeMinCompletions = cummin(PassingCompletions)
                                                                                                    , CumulativeMinPassYardsPerAttempt = cummin(PassingYardsPerAttempt)
                                                                                                    , CumulativeAverageFantasyPoints = cummean(FantasyPoints)
                                                                                                    , CumulativeMaxFantasyPoints = cummax(FantasyPoints)
                                                                                                    , CumulativeMinFantasyPoints = cummin(FantasyPoints)
                                                                                                    , NextWeekFantasyPoints = lead(FantasyPoints) #Target Variable
                                                                                                    , NextOpponent = lead(Opponent)
                                                                                                    , IsHomeNextWeek = lead(TeamIsHome)
                                                                                                    )
  return(temp_tibble)
}



addDerivedFeaturesWLag = function(tibble, min_weeks_played=8, lag=3){
  temp_tibble = tibble
  temp_tibble = temp_tibble %>% 
    group_by(PlayerID) %>% 
    filter(n() >= min_weeks_played) %>% 
    arrange(Week) %>% 
    mutate(CumulativeAveragePassingYards=ema(PassingYards, 3)
           , CumulativeAveragePassingTouchdowns=ema(PassingTouchdowns, 3)
           , CumulativeAveragePassingInterceptions=ema(PassingInterceptions, 3)
           , CumulativeAveragePassingRating=ema(PassingRating, 3)
           , CumulativeAverageCompletions = ema(PassingCompletions, 3) # not sure that completions matter much - most leagues don't reward them
           , CumulativeAverageCompletionPercentage = ema(PassingCompletionPercentage, 3)
           , CumulativeMaxPassingTouchdowns = cummax(PassingTouchdowns) 
           , CumulativeMaxPassingYards = cummax(PassingYards)
           , CumulativeMaxPassingAttempts = cummax(PassingAttempts)
           , CumulativeMaxPassingRating = cummax(PassingRating)
           , CumulativeMaxCompletions = cummax(PassingCompletions)
           , CumulativeMaxPassYardsPerAttempt = cummax(PassingYardsPerAttempt)
           , CumulativeMinPassingYards = cummin(PassingYards)   #Let's get mins to capture downside risk
           , CumulativeMinPassingAttempts = cummin(PassingAttempts)
           , CumulativeMinPassingRating = cummin(PassingRating)
           , CumulativeMinCompletions = cummin(PassingCompletions)
           , CumulativeMinPassYardsPerAttempt = cummin(PassingYardsPerAttempt)
           , CumulativeAverageFantasyPoints = ema(FantasyPoints, 3)
           , CumulativeMaxFantasyPoints = cummax(FantasyPoints)
           , CumulativeMinFantasyPoints = cummin(FantasyPoints)
           , NextWeekFantasyPoints = lead(FantasyPoints) #Target Variable
           , NextOpponent = lead(Opponent)
           , IsHomeNextWeek = lead(TeamIsHome)
  )
  return(temp_tibble)
}