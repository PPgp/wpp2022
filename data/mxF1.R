mxF1 <- local({
    e <- new.env()
    load("mx1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$mx1dt <- merge(data.table::as.data.table(e$mx1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$mx1dt, country_order + country_code + name + age ~ year, value.var = "mxF")[, `:=`(country_order = NULL)][])
})
