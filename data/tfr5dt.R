# 5-year TFR in long format (as data.table)
tfr5dt <- local({
    e <- new.env()
    load("tfr5dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(data.table::as.data.table(e$countries[, .(country_code, name)]), data.table::as.data.table(e$tfr5dt), by = "country_code", sort = FALSE)
})

