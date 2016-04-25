#install.packages("dplyr")
library(dplyr)
library(Hmisc)
setwd("~/Downloads");

# load aircraft table from avall.mdb file
aircraft <- mdb.get("avall.mdb", tables="aircraft")


# TODO - error in class query
class(aircraft)

#view first 100 rows
aircraft[1:100, c("dprt.state", "regis.no")]


# count of rows grouped by dprt.country
#TODO - how to filter out blank country
# !is.null()
# !is.na()
# != ""

# TODO filter on data frame aircraft[is.null(),] vs dplyr filter()

ac_by_country <- 
  aircraft[, c("dprt.country", "dprt.state", "regis.no")] %>% 
  filter(dprt.country != "", !is.null(dprt.country), !is.na(dprt.country)) %>%
  group_by(dprt.country) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count),dprt.country) 


# shop top 5 countries
top_n(ac_by_country, 5)

#TODO show percent of total by country



# count of rows grouped by dprt.state for USA only
ac_by_usastate <- 
  aircraft[aircraft$dprt.country=="USA", c("dprt.country", "dprt.state", "regis.no")] %>% 
  group_by(dprt.country, dprt.state) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count),dprt.state)


#TODO get sum, mean, max, dev of state counts
min(ac_by_usastate$count, na.rm = FALSE)
max(ac_by_usastate$count, na.rm = FALSE)
mean(ac_by_usastate$count, na.rm = FALSE)
sd(ac_by_usastate$count, na.rm = FALSE)



# TODO - how to use variables as field names, and concat table and variable field
loc_filter_field <- "dprt.country"
loc_field <- "dprt.state"
aircraft[aircraft$dprt.country=="USA", c("dprt.country", "dprt.state", "regis.no")] %>% 
  group_by(dprt.state) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count), dprt.state)
