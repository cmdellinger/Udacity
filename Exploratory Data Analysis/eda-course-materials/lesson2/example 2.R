reddit <- read.csv('reddit.csv')

table(reddit$employment.status)
summary(reddit)

str(reddit)
levels(reddit$age.range)
# create plot to see how many respondents in bins
library(ggplot2)
qplot(data = reddit, x = age.range)
# notice that under 18 is all the way to the right
# this is the reason we might want to have ordered factors

qplot(data = reddit, x = gender)
qplot(data = reddit, x = military.service)
qplot(data = reddit, x = children)
qplot(data = reddit, x = country)
qplot(data = reddit, x = state)
qplot(data = reddit, x = income.range)
qplot(data = reddit, x = cheese)
