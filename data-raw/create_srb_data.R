library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# Sex-ratio at birth
###########

# annual 
srb1 <- data.table::fread('sexRatio.txt', sep = "\t")[, country := NULL]
srb1 <- merge.with.countries(srb1)
sexRatio1dt <- melt.and.merge(NULL, srb1, "srb", ids = c("country_order", "country_code"))
sexRatio1dt[, year := as.integer(year)][, country_order := NULL]
use_data(sexRatio1dt, overwrite = TRUE)

# 5-year
srb5 <- data.table::fread('sexRatio5.txt', sep = "\t")[, name := NULL]
srb5 <- merge.with.countries(srb5)
sexRatio5dt <- melt.and.merge(NULL, srb5, "srb", ids = c("country_order", "country_code"), var.name = "period")
sexRatio5dt[, year := as.integer(substr(period, 1, 4)) + 2]
sexRatio5dt <- sexRatio5dt[, .(country_code, year, period, srb)]
use_data(sexRatio5dt, overwrite = TRUE)