
library(DBI)
library(RSQLite)
library(sqldf)

# load observations from Wolbecker (id = 09040)
wolbecker <-
  sqldf("SELECT * FROM kfz_data
         WHERE location LIKE '%09040%'", 
        dbname = "data/processed/kfz_data.sqlite")

# TODO: plot year and day line-plots