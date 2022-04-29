## code to prepare `all_data` dataset goes here

library(tidyverse)
library(usethis)

noms <- read_rds('data-raw/names_of_files.rds') %>% as.list
names(noms) <- read_rds('data-raw/names_of_files.rds')


for(i in (noms)){
  assign(i, read_csv(paste0('data-raw/',i,'.csv')) )
}


##
## automate the integration of the data usage.

walk2(noms, names(noms), function(obj, name) {
  assign(name, obj)
  do.call("use_data", list(as.name(name), overwrite = TRUE))
})





