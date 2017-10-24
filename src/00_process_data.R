# PROCESS DATA

library(dplyr)
library(assertthat)
library(lubridate)
library(tidyr)

data_folder <- "data/raw"
raw_files <- dir(data_folder)

df <- read.csv(paste(data_folder, "/2016_01_01_24mq.csv", sep = ""),
               sep = ";", row.names = NULL)

# move header to left and remove last column 
if (!is.na(colnames(df)[26])) {
  colnames(df) <-
    colnames(df) %>% 
    tail(-1)
  assert_that(df %>% select(26) %>% is.na %>% all)
  df <-
    df %>%
    select(-26)
}

# DATE
# identify date from first column lable
date <-
  df %>%
  colnames %>%
  .[1] %>%
  strsplit("\\.") %>%
  .[[1]] %>%
  last %>%
  ymd(.)
# add date to new column
df <- 
  df %>%
  mutate(date = date)
# rename first header to 'location'
colnames(df)[1] <- "location"

# TIME
# wide to long format
df <-
  df %>%
  gather(hour, count, -location, -date)
# 'hour' to integer format
# TODO
