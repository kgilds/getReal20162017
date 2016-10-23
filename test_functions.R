library(dplyr)
library(sqldf)
library(pander)
library(getREALpackage)


setwd("C:/Users/kevin/Dropbox/GetReal/Data/sqlite")


### Make connection with database
getReal_2016db<- dbConnect(SQLite(), dbname="outcome_history.sqlite")

pre_outcomes <- dbReadTable(getReal_2016db, "girl_pre")

pre_hr <- pre_outcomes %>%
    select(girlCode, council, Time, hr.avg)

head(pre_hr)





hr_achieved_pre()