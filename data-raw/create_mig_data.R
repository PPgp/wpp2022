library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# Migration
###########

# annual 
migration1 <- data.table::fread('migration.txt', sep = "\t")[, country := NULL]
mig1 <- merge.with.countries(migration1)
migration1dt <- melt.and.merge(NULL, mig1, "mig", ids = c("country_order", "country_code"))
migration1dt[, year := as.integer(year)][, country_order := NULL]
use_data(migration1dt, overwrite = TRUE)

