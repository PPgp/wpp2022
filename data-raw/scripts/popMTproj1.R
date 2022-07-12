# 1x1 total projected male population in wide format (data.frame)
popMTproj1 <- local({
    source('popproj1dt.R')
    # to keep the same order add temporary columns for countries
    cntries.dt <- data.table::data.table(country_code = unique(popproj1dt[, country_code]))
    cntries.dt[, country_order := 1:nrow(cntries.dt)]
    pop <- merge(popproj1dt, cntries.dt, by = "country_code", sort = FALSE)
    pop <- data.table::dcast(pop, country_order + country_code + name ~ year, value.var = "popM")
    pop[, `:=`(country_order = NULL)]
    as.data.frame(pop)
})
