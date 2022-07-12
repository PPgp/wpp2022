library(data.table)
library(usethis)

# Run this from the data-raw directory

# help dataset for countries order
locs <- fread("../data/UNlocations.txt", sep = "\t")
countries <- locs[, .(country_code, name, country_order = SortOrder)]
use_data(countries, overwrite = TRUE)
