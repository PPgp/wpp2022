# 5-year total female population (observed) in wide format (as data.frame)
popFT5 <- local({
    source('pop5dt.R', local = TRUE)
    e <- new.env()
    load("countries.rda", envir= e)
    e$pop5dt <- merge(data.table::as.data.table(pop5dt), e$countries[,c("country_code", "country_order")], by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$pop5dt, country_order + country_code + name ~ year, value.var = "popF")[, `:=`(country_order = NULL)][])
})
