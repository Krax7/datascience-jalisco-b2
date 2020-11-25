library(tidyverse)
library(nycflights13)
detach("package:dplyr", unload = TRUE)
library(dplyr)

str(iris)

tiris <- as_tibble(iris)

flights[,c('year','month','day')]
select(flights,year,month,day)
select(flights,year:dep_delay)
select(flights,-(dep_delay:carrier))

select(tiris, starts_with("Petal"))
select(tiris, ends_with("Width"))
select(tiris, contains("etal"))

select(tiris, Species, everything())

#### Filter

mtcars[mtcars$cyl == 8,]
filter(mtcars, cyl == 8)
filter(mtcars, cyl < 6)
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6 | vs == 1 | am == 0)

flights_nov_dec <- filter(flights, month %in% c(1, 2, 11, 12))

#### Arrange
arrange(mtcars, cyl, desc(disp))

#### Mutate

flights_sml <- select(flights,   year:day,   ends_with("delay"),   distance,   air_time)

mutate(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60, total_distance = sum(distance))

summarise(baseball,duration = max(year) - min(year), nteams = length(unique(team)))

#### Summarise

library(plyr)
??baseball

baseball <- as_tibble(baseball)

detach(package:plyr, unload = TRUE)

str(baseball)
summary(baseball$year)

summarise(baseball, duration = max(year) - min(year), )

#### Group by

by_player <- group_by(baseball, id)
summarise(by_player, mean_hits = mean(h, na.rm = TRUE))

by_player_year <- group_by(baseball, id, year)
result <- summarise(by_player_year, mean_hits = mean(h, na.rm = TRUE))

filter(result, id == 'forceda01')

by_player_year_team <- group_by(baseball, id, year, team)
summarise(by_player_year_team, mean_hits = mean(h, na.rm = TRUE))

table(baseball$h, useNA = 'ifany')
