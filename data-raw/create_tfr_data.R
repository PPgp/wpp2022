library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# TFR
######
# annual estimates
tfr1 <- fread('tfr.txt', sep = "\t")[, last.observed := NULL][, country := NULL]
#if("country" %in% colnames(tfr1)) colnames(tfr1)[colnames(tfr1) == "country"] <- "name"
tfr1 <- merge.with.countries(tfr1)
tfr1dt <- melt.and.merge(NULL, tfr1, "tfr", ids = c("country_order", "country_code"))
tfr1dt[, year := as.integer(year)][, country_order := NULL]
use_data(tfr1dt, overwrite = TRUE)
#



# 5-year estimates
tfr5 <- fread('tfr5.txt', sep = "\t")[, last.observed := NULL][, name := NULL]
#if("country" %in% colnames(tfr5)) colnames(tfr5)[colnames(tfr5) == "country"] <- "name"
tfr5 <- merge.with.countries(tfr5)
tfr5dt <- melt.and.merge(NULL, tfr5, "tfr", ids = c("country_order", "country_code"), var.name = "period")
tfr5dt[, year := as.integer(substr(period, 1, 4)) + 3]
tfr5dt <- tfr5dt[, .(country_code, year, period, tfr)]
use_data(tfr5dt, overwrite = TRUE)

# annual projections
tfr1 <- data.table::fread('tfrprojMed.txt', sep = "\t")[, country := NULL]
tfr.low <- data.table::fread('tfrprojLow.txt', sep = "\t")[, country := NULL]
tfr.high <- data.table::fread('tfrprojHigh.txt', sep = "\t")[, country := NULL]
tfr80l <- data.table::fread('tfrproj80l.txt', sep = "\t")[, country := NULL]
tfr80u <- data.table::fread('tfrproj80u.txt', sep = "\t")[, country := NULL]
tfr95l <- data.table::fread('tfrproj95l.txt', sep = "\t")[, country := NULL]
tfr95u <- data.table::fread('tfrproj95u.txt', sep = "\t")[, country := NULL]

#if("country" %in% colnames(tfr1)) data.table::setnames(tfr1, "country", "name")

tfr <- merge.with.countries(tfr1)
tfr <- melt.and.merge(NULL, tfr, "tfr", ids = c("country_order", "country_code"))
tfr <- melt.and.merge(tfr, tfr80l, "tfr_80l")
tfr <- melt.and.merge(tfr, tfr80u, "tfr_80u")
tfr <- melt.and.merge(tfr, tfr95l, "tfr_95l")
tfr <- melt.and.merge(tfr, tfr95u, "tfr_95u")
tfr <- melt.and.merge(tfr, tfr.low, "tfr_low")
tfr <- melt.and.merge(tfr, tfr.high, "tfr_high")
tfrproj1dt <- tfr[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]

use_data(tfrproj1dt, overwrite = TRUE)

# 5-year projection
tfr <- data.table::fread('tfrprojMed5.txt', sep = "\t")[, name := NULL]
tfr.low <- data.table::fread('tfrprojLow5.txt', sep = "\t")[, name := NULL]
tfr.high <- data.table::fread('tfrprojHigh5.txt', sep = "\t")[, name := NULL]
tfr80l <- data.table::fread('tfrproj80l5.txt', sep = "\t")[, name := NULL]
tfr80u <- data.table::fread('tfrproj80u5.txt', sep = "\t")[, name := NULL]
tfr95l <- data.table::fread('tfrproj95l5.txt', sep = "\t")[, name := NULL]
tfr95u <- data.table::fread('tfrproj95u5.txt', sep = "\t")[, name := NULL]

tfr <- merge.with.countries(tfr)
tfr <- melt.and.merge(NULL, tfr, "tfr", ids = c("country_order", "country_code"), var.name = "period")
tfr <- melt.and.merge(tfr, tfr80l, "tfr_80l", var.name = "period", by = c("country_code", "period"))
tfr <- melt.and.merge(tfr, tfr80u, "tfr_80u", var.name = "period", by = c("country_code", "period"))
tfr <- melt.and.merge(tfr, tfr95l, "tfr_95l", var.name = "period", by = c("country_code", "period"))
tfr <- melt.and.merge(tfr, tfr95u, "tfr_95u", var.name = "period", by = c("country_code", "period"))
tfr <- melt.and.merge(tfr, tfr.low, "tfr_low", var.name = "period", by = c("country_code", "period"))
tfr <- melt.and.merge(tfr, tfr.high, "tfr_high", var.name = "period", by = c("country_code", "period"))
tfr[, year := as.integer(substr(period, 1, 4)) + 2]
setcolorder(tfr, c("country_order", "country_code", "year", "period"))
tfrproj5dt <- tfr[order(country_order, year)][, country_order := NULL][]
use_data(tfrproj5dt, overwrite = TRUE)

