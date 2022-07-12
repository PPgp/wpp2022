mx5dt <- local({
    e <- new.env()
    load("mx5dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$mx5dt), by = "country_code", sort = FALSE)
})
