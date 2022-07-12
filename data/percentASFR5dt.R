# 5-year percent ASFR in long format (as data.table)
percentASFR5dt <- local({
    e <- new.env()
    load("percentASFR5dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$percentASFR5dt), by = "country_code", sort = FALSE)
})
