library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# Other indicators
# estimates
births <- data.table::fread('births.txt', sep = "\t")[, country := NULL]
cbr <- data.table::fread('cbr.txt', sep = "\t")[, country := NULL]
cdr <- data.table::fread('cdr.txt', sep = "\t")[, country := NULL]
deaths <- data.table::fread('deaths.txt', sep = "\t")[, country := NULL]
growthrate <- data.table::fread('growthrate.txt', sep = "\t")[, country := NULL]

ind <- merge.with.countries(births)
ind <- melt.and.merge(NULL, ind, "births", ids = c("country_order", "country_code"))
ind <- melt.and.merge(ind, cbr, "cbr")
ind <- melt.and.merge(ind, cdr, "cdr")
ind <- melt.and.merge(ind, deaths, "deaths")
ind <- melt.and.merge(ind, growthrate, "growthrate")

misc1dt <- ind[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]

use_data(misc1dt, overwrite = TRUE)

# projections
births <- data.table::fread('birthsprojMed.txt', sep = "\t")[, country := NULL]
cbr <- data.table::fread('cbrprojMed.txt', sep = "\t")[, country := NULL]
cdr <- data.table::fread('cdrprojMed.txt', sep = "\t")[, country := NULL]
deaths <- data.table::fread('deathsprojMed.txt', sep = "\t")[, country := NULL]
growthrate <- data.table::fread('growthrateprojMed.txt', sep = "\t")[, country := NULL]

ind <- merge.with.countries(births)
ind <- melt.and.merge(NULL, ind, "births", ids = c("country_order", "country_code"))
ind <- melt.and.merge(ind, cbr, "cbr")
ind <- melt.and.merge(ind, cdr, "cdr")
ind <- melt.and.merge(ind, deaths, "deaths")
ind <- melt.and.merge(ind, growthrate, "growthrate")

miscproj1dt <- ind[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]

use_data(miscproj1dt, overwrite = TRUE)
