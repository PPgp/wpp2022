# 5-year total population (projected) in wide format (as data.frame)
popprojHigh5 <- local({
    source('popproj5dt.R', local = TRUE)
    e <- new.env()
    load("countries.rda", envir= e)
    e$popproj5dt <- merge(data.table::as.data.table(popproj5dt), e$countries[,c("country_code", "country_order")], by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$popproj5dt, country_order + country_code + name ~ year, value.var = "pop_high")[, `:=`(country_order = NULL)][])
})
