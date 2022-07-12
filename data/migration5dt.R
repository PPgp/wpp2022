# 5-year total net migration in long format (as data.table)
migration5dt <- local({
    source('migration1dt.R', local = TRUE)
    yeardf <- data.table::data.table(year = 1950:2099, yearcat = rep(seq(1952, 2097, by = 5), each = 5))
    yeardf[, period := paste(yearcat-2, yearcat + 3, sep = "-")]
    mig1 <- merge(migration1dt, yeardf, by = "year", sort = FALSE)
    data.table::setDT(mig1)
    mig5 <- mig1[, .(mig = sum(mig)), by = c("country_code", "name", "yearcat", "period")]
    data.table::setnames(mig5, "yearcat", "year")
    mig5[]
})
