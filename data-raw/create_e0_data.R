library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# e0
#####

# annual estimates
e0F <- data.table::fread('e0F.txt', sep = "\t")[, last.observed := NULL][, country := NULL]
e0M <- data.table::fread('e0M.txt', sep = "\t")[, last.observed := NULL][, country := NULL]
e0B <- data.table::fread('e0B.txt', sep = "\t")[, last.observed := NULL][, country := NULL]
#if("country" %in% colnames(e0M)) data.table::setnames(e0M, "country", "name")

e01 <- merge.with.countries(e0M)
e01 <- melt.and.merge(NULL, e01, "e0M", ids = c("country_order", "country_code"))
e01 <- melt.and.merge(e01, e0F, "e0F")
e01 <- melt.and.merge(e01, e0B, "e0B")
e01dt <- e01[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]

use_data(e01dt, overwrite = TRUE)

# 5-year estimates
e0M <- data.table::fread('e0M5.txt', sep = "\t")[, last.observed := NULL][, name := NULL]
e0F <- data.table::fread('e0F5.txt', sep = "\t")[, last.observed := NULL][, name := NULL]

e0M <- merge.with.countries(e0M)
e0 <- melt.and.merge(NULL, e0M, "e0M", ids = c("country_order", "country_code"))
e0 <- melt.and.merge(e0, e0F, "e0F")
setnames(e0, "year", "period")
e0[, year := as.integer(substr(period, 1, 4)) + 3]

# temporarily before e0B is obtained
yeardf <- data.table::data.table(year = 1951:2021, yearcat = c(rep(seq(1953, 2018, by = 5), each = 5), rep(2023, 1)))
yeardf[, period := paste(yearcat-3, yearcat + 2, sep = "-")]
e01 <- merge(e01dt, yeardf, by = "year", sort = FALSE)
e05 <- e01[, .(e0B = mean(e0B)), by = c("country_code", "yearcat", "period")][yearcat < 2020]
data.table::setnames(e05, "yearcat", "year")
e0 <- merge(e0, e05, by = c("country_code", "year", "period"), sort = FALSE)

e05dt <- e0[order(country_order, year)][, country_order := NULL][]
use_data(e05dt, overwrite = TRUE)

# annual projections
e0F <- data.table::fread('e0Fproj.txt', sep = "\t")[, country := NULL]
e0M <- data.table::fread('e0Mproj.txt', sep = "\t")[, country := NULL]
e0B <- data.table::fread('e0Bproj.txt', sep = "\t")[, country := NULL]
e0F80l <- data.table::fread('e0Fproj80l.txt', sep = "\t")[, country := NULL]
e0F80u <- data.table::fread('e0Fproj80u.txt', sep = "\t")[, country := NULL]
e0F95l <- data.table::fread('e0Fproj95l.txt', sep = "\t")[, country := NULL]
e0F95u <- data.table::fread('e0Fproj95u.txt', sep = "\t")[, country := NULL]
e0M80l <- data.table::fread('e0Mproj80l.txt', sep = "\t")[, country := NULL]
e0M80u <- data.table::fread('e0Mproj80u.txt', sep = "\t")[, country := NULL]
e0M95l <- data.table::fread('e0Mproj95l.txt', sep = "\t")[, country := NULL]
e0M95u <- data.table::fread('e0Mproj95u.txt', sep = "\t")[, country := NULL]
e0B80l <- data.table::fread('e0Bproj80l.txt', sep = "\t")[, country := NULL]
e0B80u <- data.table::fread('e0Bproj80u.txt', sep = "\t")[, country := NULL]
e0B95l <- data.table::fread('e0Bproj95l.txt', sep = "\t")[, country := NULL]
e0B95u <- data.table::fread('e0Bproj95u.txt', sep = "\t")[, country := NULL]
#if("country" %in% colnames(e0M)) data.table::setnames(e0M, "country", "name")

e01 <- merge.with.countries(e0M)
e01 <- melt.and.merge(NULL, e01, "e0M", ids = c("country_order", "country_code"))
e01 <- melt.and.merge(e01, e0F, "e0F")
e01 <- melt.and.merge(e01, e0B, "e0B")
e01 <- melt.and.merge(e01, e0M80l, "e0M_80l")
e01 <- melt.and.merge(e01, e0M80u, "e0M_80u")
e01 <- melt.and.merge(e01, e0M95l, "e0M_95l")
e01 <- melt.and.merge(e01, e0M95u, "e0M_95u")
e01 <- melt.and.merge(e01, e0F80l, "e0F_80l")
e01 <- melt.and.merge(e01, e0F80u, "e0F_80u")
e01 <- melt.and.merge(e01, e0F95l, "e0F_95l")
e01 <- melt.and.merge(e01, e0F95u, "e0F_95u")
e01 <- melt.and.merge(e01, e0B80l, "e0B_80l")
e01 <- melt.and.merge(e01, e0B80u, "e0B_80u")
e01 <- melt.and.merge(e01, e0B95l, "e0B_95l")
e01 <- melt.and.merge(e01, e0B95u, "e0B_95u")

e0proj1dt <- e01[, year := as.integer(year)][order(country_order, year)][, country_order := NULL][]
use_data(e0proj1dt, overwrite = TRUE)

# 5-year projection
e0M <- data.table::fread('e0Mproj5.txt', sep = "\t")[, name := NULL]
e0F <- data.table::fread('e0Fproj5.txt', sep = "\t")[, name := NULL]
e0F80l <- data.table::fread('e0Fproj80l5.txt', sep = "\t")[, name := NULL]
e0F80u <- data.table::fread('e0Fproj80u5.txt', sep = "\t")[, name := NULL]
e0F95l <- data.table::fread('e0Fproj95l5.txt', sep = "\t")[, name := NULL]
e0F95u <- data.table::fread('e0Fproj95u5.txt', sep = "\t")[, name := NULL]
e0M80l <- data.table::fread('e0Mproj80l5.txt', sep = "\t")[, name := NULL]
e0M80u <- data.table::fread('e0Mproj80u5.txt', sep = "\t")[, name := NULL]
e0M95l <- data.table::fread('e0Mproj95l5.txt', sep = "\t")[, name := NULL]
e0M95u <- data.table::fread('e0Mproj95u5.txt', sep = "\t")[, name := NULL]


e0 <- merge.with.countries(e0M)
e0 <- melt.and.merge(NULL, e0, "e0M", ids = c("country_order", "country_code"))
e0 <- melt.and.merge(e0, e0F, "e0F")
e0 <- melt.and.merge(e0, e0M80l, "e0M_80l")
e0 <- melt.and.merge(e0, e0M80u, "e0M_80u")
e0 <- melt.and.merge(e0, e0M95l, "e0M_95l")
e0 <- melt.and.merge(e0, e0M95u, "e0M_95u")
e0 <- melt.and.merge(e0, e0F80l, "e0F_80l")
e0 <- melt.and.merge(e0, e0F80u, "e0F_80u")
e0 <- melt.and.merge(e0, e0F95l, "e0F_95l")
e0 <- melt.and.merge(e0, e0F95u, "e0F_95u")
setnames(e0, "year", "period")
e0[, year := as.integer(substr(period, 1, 4)) + 2]
setcolorder(e0, c("country_order", "country_code", "year", "period"))

# temporarily to average the CIs
# yeardf <- data.table::data.table(year = 2020:2099, yearcat = c(rep(seq(2023, 2098, by = 5), each = 5)))
# yeardf[, period := paste(yearcat-3, yearcat + 2, sep = "-")]
# e01dt[, `:=`(e0M_80l = e0M, e0M_80u = e0M, e0M_95l = e0M, e0M_95u = e0M, 
#              e0F_80l = e0F, e0F_80u = e0F, e0F_95l = e0F, e0F_95u = e0F,
#              e0B_80l = e0B, e0B_80u = e0B, e0B_95l = e0B, e0B_95u = e0B
# )]
# e01 <- merge(rbind(e01dt, e0proj1dt), yeardf, by = "year", sort = FALSE)
# e05 <- e01[, .(e0B = mean(e0B),
#                e0M_80l = mean(e0M_80l), e0M_80u = mean(e0M_80u), e0M_95l = mean(e0M_95l), e0M_95u = mean(e0M_95u), 
#                e0F_80l = mean(e0F_80l), e0F_80u = mean(e0F_80u), e0F_95l = mean(e0F_95l), e0F_95u = mean(e0F_95u), 
#                e0B_80l = mean(e0B_80l), e0B_80u = mean(e0B_80u), e0B_95l = mean(e0B_95l), e0B_95u = mean(e0B_95u)
# ), by = c("country_code", "yearcat", "period")]
# data.table::setnames(e05, "yearcat", "year")
# e0 <- merge(e0, e05, by = c("country_code", "year", "period"), sort = FALSE)

e0proj5dt <- e0[order(country_order, year)][, country_order := NULL][]
use_data(e0proj5dt, overwrite = TRUE)
