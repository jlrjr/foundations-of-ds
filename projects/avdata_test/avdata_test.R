install.packages("dplyr")
library(dplyr)
aircraft <- mdb.get("")



aircraft[1:20, c("dprt.state", "regis.no")] %>% group_by(dprt.state) %>% summarize(count=n()) %>% arrange(desc(count), dprt.state)