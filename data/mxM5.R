mxM5 <- local({
    e <- new.env()
    load("mx5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$mx5dt <- merge(data.table::as.data.table(e$mx5dt), e$countries, by = "country_code", sort = FALSE)
    e$mx5dt[, agecat := rep(1:22, nrow(e$mx5dt)/22)]
    as.data.frame(data.table::dcast(e$mx5dt, country_order + country_code + name + agecat + age ~ period, value.var = "mxM")[, `:=`(country_order = NULL, agecat = NULL)][])
})
