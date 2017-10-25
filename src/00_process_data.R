# PROCESS DATA

library(dplyr)
library(assertthat)
library(lubridate)
library(tidyr)
library(DBI)
library(RSQLite)


process_df <- function(df) {
  # shift header left and remove last column 
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
    ymd(.)
  # add date to new column
  df <- 
    df %>%
    mutate(date = as.character(date))
  # rename first header to 'location'
  colnames(df)[1] <- "location"
  
  # TIME
  # wide to long format
  df <-
    df %>%
    gather(hour, count, -location, -date) %>%
    # 'hour' to integer format
    mutate(hour = substring(hour, 2)) %>% 
    mutate(hour = as.integer(hour))

  return(df)
}

# get all files
data_folder <- "data/raw/"
raw_files <- dir(data_folder)

# define dataframe to fill with data
df_target <- data.frame(location = as.character(),
                        date = as.character(),
                        hour = as.integer(),
                        count = as.integer())

# EACH source file: read, preprocess, add to 'df_target'
for (raw_file in raw_files) {
  print(paste("reading ", raw_file))
  df_source <- 
    read.csv(paste(data_folder, raw_file, sep = ""),
             sep = ";", row.names = NULL) %>%
    process_df()
  
  df_target <- rbind(df_target, df_source)
}

# write 'df_target' to SQLite database
con <- dbConnect(SQLite(), dbname="data/processed/kfz_data.sqlite")
dbWriteTable(con, "kfz_data", df_target, overwrite = T)
dbDisconnect(con)
