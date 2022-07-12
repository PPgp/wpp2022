library(data.table)
library(usethis)

# Run this from the data-raw directory

source("functions.R")

# Population
#############

# Annual age-specific pop estimates
popM1w <- fread('popM.txt', sep = "\t")[, country := NULL]
popF1w <- fread('popF.txt', sep = "\t")[, country := NULL]
#if("country" %in% colnames(popM1w)) setnames(popM1w, "country", "name")
popM1w <- merge.with.countries(popM1w)
pop1 <- melt.and.merge(NULL, popM1w, "popM", ids = c("country_order", "country_code", "age"))
pop1 <- melt.and.merge(pop1, popF1w, "popF", ids = c("country_code", "age"), by = c("country_code", "year", "age"))
pop1[, pop := popM + popF]
popAge1dt <- pop1[, year := as.integer(year)][order(country_order, year, age)][, country_order := NULL][]
use_data(popAge1dt, overwrite = TRUE)

# create age help dataset
age5categories <- data.table(age1 = 0:100, agecat = c(rep(seq(0, 95, by = 5), each = 5), 100))
age5categories[agecat < 100, age := paste(agecat, agecat+4, sep = "-")]
age5categories[agecat == 100, age := "100+"]
use_data(age5categories, overwrite = TRUE)

# 5-year age-specific pop estimates (created on teh fly)
# pop1 <- merge.with.age5(popAge1dt)
# pop5 <- pop1[, .(popM = sum(popM), popF = sum(popF), pop = sum(pop)), by = c("country_code", "name", "year", "agecat")][year %in% seq(1950, 2020, by = 5)]
# pop5[agecat < 100, age := paste(agecat, agecat+4, sep = "-")]
# pop5[agecat == 100, age := "100+"][, agecat := NULL]
# setcolorder(pop5, c("country_code", "name", "year", "age"))
# popAge5dt <- pop5[]
# use_data(popAge5dt, overwrite = TRUE)

# annual age-specific projections
popM1w <- data.table::fread('popMprojMed.txt', sep = "\t")[, country := NULL]
popF1w <- data.table::fread('popFprojMed.txt', sep = "\t")[, country := NULL]
popF1high <- data.table::fread('popFprojHigh.txt', sep = "\t")[, country := NULL]
popF1low <- data.table::fread('popFprojLow.txt', sep = "\t")[, country := NULL]
popM1high <- data.table::fread('popMprojHigh.txt', sep = "\t")[, country := NULL]
popM1low <- data.table::fread('popMprojLow.txt', sep = "\t")[, country := NULL]
#if("country" %in% colnames(popM1w)) data.table::setnames(popM1w, "country", "name")

popM1w <- merge.with.countries(popM1w)
pop1 <- melt.and.merge(NULL, popM1w, "popM", ids = c("country_order", "country_code", "age"))
pop1 <- melt.and.merge(pop1, popF1w, "popF", ids = c("country_code", "age"), by = c("country_code", "year", "age"))
pop1[, pop := popM + popF]
pop1 <- melt.and.merge(pop1, popM1low, "popM_low", ids = c("country_code", "age"), by = c("country_code", "year", "age"))
pop1 <- melt.and.merge(pop1, popM1high, "popM_high", ids = c("country_code", "age"), by = c("country_code", "year", "age"))
pop1 <- melt.and.merge(pop1, popF1low, "popF_low", ids = c("country_code", "age"), by = c("country_code", "year", "age"))
pop1 <- melt.and.merge(pop1, popF1high, "popF_high", ids = c("country_code", "age"), by = c("country_code", "year", "age"))

popprojAge1dt <- pop1[order(country_order, year, age)][, country_order := NULL]
use_data(popprojAge1dt, overwrite = TRUE)

# annual projections summed over ages
pop <- popprojAge1dt[, .(popM = sum(popM), popF = sum(popF), pop = sum(pop)), by = c("country_code", "year")]
pop80l <- data.table::fread('popproj80l.txt', sep = "\t")[, country := NULL]
pop80u <- data.table::fread('popproj80u.txt', sep = "\t")[, country := NULL]
pop95l <- data.table::fread('popproj95l.txt', sep = "\t")[, country := NULL]
pop95u <- data.table::fread('popproj95u.txt', sep = "\t")[, country := NULL]
pophigh <- data.table::fread('popprojHigh.txt', sep = "\t")[, country := NULL]
poplow <- data.table::fread('popprojLow.txt', sep = "\t")[, country := NULL]

pop[, year := as.character(year)] # temporarily to match the other datasets
pop1 <- melt.and.merge(pop, pop80l, "pop_80l")
pop1 <- melt.and.merge(pop1, pop80u, "pop_80u")
pop1 <- melt.and.merge(pop1, pop95l, "pop_95l")
pop1 <- melt.and.merge(pop1, pop95u, "pop_95u")
pop1 <- melt.and.merge(pop1, poplow, "pop_low")
pop1 <- melt.and.merge(pop1, pophigh, "pop_high")
popproj1dt <- pop1[, year := as.integer(year)][]
use_data(popproj1dt, overwrite = TRUE)
