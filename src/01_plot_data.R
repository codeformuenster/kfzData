
library(DBI)
library(RSQLite)
library(sqldf)
library(dplyr)
library(ggplot2)

# LOAD DATA
wolbecker <- 
  sqldf("SELECT 
         date, hour, count, location,
         CASE location
           WHEN 'MQ_09040_FV3_G (MQ1034)' THEN 'entering_city'
           WHEN 'MQ_09040_FV1_G (MQ1033)' THEN 'leaving_city'
           END 'direction'
         FROM kfz_data
         WHERE location LIKE '%09040%'", 
         dbname = "data/processed/kfz_data.sqlite") 


locations <- wolbecker$location %>% unique()


# PLOTS
# plot aggregated days over year
wolbecker %>%
  group_by(direction, date) %>%
  summarise(count_day = sum(count)) %>%
  ggplot(data = ., aes(x = date, y = count_day)) +
  geom_line(aes(group = direction, color = direction))

# plot days as line plot
wolbecker %>%
  ggplot(data = ., aes(x = hour, y = count)) +
  geom_line(aes(group = interaction(date, direction), color = direction),
            alpha = .3)
  
  