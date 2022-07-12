# 5-year total male population (projected) in wide format (as data.frame)
popMTproj5 <- local({
	source('popproj5dt.R')
    cntries.dt <- data.table::data.table(country_code = unique(popproj5dt[, country_code]))
    cntries.dt[, country_order := 1:nrow(cntries.dt)]
    pop <- merge(popproj5dt, cntries.dt, by = "country_code", sort = FALSE)
    pop <- data.table::dcast(pop, country_order + country_code + name ~ year, value.var = "popM")
    pop[, `:=`(country_order = NULL)]
    as.data.frame(pop)
})
