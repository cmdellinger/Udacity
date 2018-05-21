getwd()
setwd("~/Downloads")

getwd()
statesInfo <- read.csv('stateData.csv')
# get all states in the northeast (state.region == 1)
stateSubset <- subset(statesInfo, state.region == 1)
# another way to subset:
#   dataSet[ROWS,COLUMNS]
stateSubsetBravket <- statesInfo[statesInfo$state.region == 1, ] # blank is all columns