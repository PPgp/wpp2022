# 5-year SRB in wide format (data.frame)
sexRatio5 <- local({
    e <- new.env()
    load("sexRatio5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$sexRatio5dt <- merge(data.table::as.data.table(e$sexRatio5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$sexRatio5dt, country_order + country_code + name ~ period, value.var = "srb")[, `:=`(country_order = NULL)][])
})
