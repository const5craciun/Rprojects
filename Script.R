
rm(list = ls()) ## remove all variables previously stored
library(Hmisc)  ## import package


data <- read.csv("~/Documents/covid_R/COVID19_line_list_data.csv")
describe(data)

### cleaned up death column
data$death_dummy <- as.integer(data$death !=0)

### death rate
sum(data$death_dummy)/nrow(data)

### AGE
# claim: people who die are older

dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)

mean(alive$age, na.rm = TRUE)
mean(dead$age, na.rm = TRUE)


t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.95)
### conclusion: people that die are older, since p-value < 0.05 so we reject the null hypoth

### GENDER
men = subset(data, gender=='male')
women = subset(data, gender=='female')

mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)

t.test(men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = 0.95)

### p-value= 0.002 < 0.05 this is statistical significant