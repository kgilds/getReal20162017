library(dplyr)
library(sqldf)
library(GetREAL)

setwd("C:/Users/kevin/Dropbox/GetReal/Data/sqlite")


### Make connection with database
getReal_2016db<- dbConnect(SQLite(), dbname="outcome_history.sqlite")

pre_outcomes <- dbReadTable(getReal_2016db, "girl_pre")

hr <- pre_outcomes %>%
    select(girlCode, council, hr.avg)

hr_achieved("Pre")