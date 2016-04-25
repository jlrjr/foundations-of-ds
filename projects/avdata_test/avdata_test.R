#install.packages("dplyr")
library(dplyr)
library(Hmisc)
setwd("~/Downloads");

# load aircraft table from avall.mdb file
aircraft <- mdb.get("avall.mdb", tables="aircraft")

#view first 100 rows
aircraft[1:100, c("dprt.state", "regis.no")]



# count of rows grouped by dprt.state for USA only
loc_filter_field <- "dprt.country"
loc_field <- "dprt.state"
aircraft[aircraft$dprt.country=="USA", c("dprt.country", "dprt.state", "regis.no")] %>% 
  group_by(dprt.state) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count), dprt.state)


# TODO - how to use variables as field names, and concat table and variable field
loc_filter_field <- "dprt.country"
loc_field <- "dprt.state"
aircraft[aircraft$dprt.country=="USA", c("dprt.country", "dprt.state", "regis.no")] %>% 
  group_by(dprt.state) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count), dprt.state)
