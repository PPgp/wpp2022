library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# PASFR
#####

# annual estimates
pasfr <- data.table::fread('percentASFR.txt', sep = "\t")[, country := NULL]

pasfr <- merge.with.countries(pasfr)
pasfr <- melt.and.merge(NULL, pasfr, "pasfr", ids = c("country_order", "country_code", "age"))

percentASFR1dt <- pasfr[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]
setcolorder(percentASFR1dt, c("country_code", "year", "age"))
use_data(percentASFR1dt, overwrite = TRUE)

# 5-year estimates
pasfr <- data.table::fread('percentASFR5.txt', sep = "\t")[, name := NULL]
pasfr <- merge.with.countries(pasfr)
pasfr <- melt.and.merge(NULL, pasfr, "pasfr", ids = c("country_order", "country_code", "age"))
setnames(pasfr, "year", "period")
pasfr[, year := as.integer(substr(period, 1, 4)) + 2]

percentASFR5dt <- pasfr[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]
setcolorder(percentASFR5dt, c("country_code", "year", "period", "age"))
use_data(percentASFR5dt, overwrite = TRUE)
