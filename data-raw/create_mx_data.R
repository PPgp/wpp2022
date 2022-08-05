library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# mx
#####

# annual estimates
mxF <- data.table::fread('mxF.txt', sep = "\t")[, country := NULL]
mxM <- data.table::fread('mxM.txt', sep = "\t")[, country := NULL]
mxB <- data.table::fread('mxB.txt', sep = "\t")[, country := NULL]

mx <- merge.with.countries(mxM)
mx <- melt.and.merge(NULL, mx, "mxM", ids = c("country_order", "country_code", "age"))
mx <- melt.and.merge(mx, mxF, "mxF", ids = c("country_code", "age"), by = c("country_code", "year", "age"))
mx <- melt.and.merge(mx, mxB, "mxB", ids = c("country_code", "age"), by = c("country_code", "year", "age"))

mx1dt <- mx[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]
use_data(mx1dt, overwrite = TRUE)

# 5-year estimates
mxM <- data.table::fread('mxM5.txt', sep = "\t")[, name := NULL]
mxF <- data.table::fread('mxF5.txt', sep = "\t")[, name := NULL]
mx <- merge.with.countries(mxM)
mx <- melt.and.merge(NULL, mx, "mxM", ids = c("country_order", "country_code", "age"))
mx <- melt.and.merge(mx, mxF, "mxF", ids = c("country_code", "age"), by = c("country_code", "year", "age"))
setnames(mx, "year", "period")
mx[, year := as.integer(substr(period, 1, 4)) + 2]

mx5dt <- mx[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]
setcolorder(mx5dt, c("country_code", "year", "period", "age"))
use_data(mx5dt, overwrite = TRUE)
