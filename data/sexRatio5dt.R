# 5-year sex ratio at birth in long format (as data.table)
sexRatio5dt <- local({
    e <- new.env()
    load("sexRatio5dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(data.table::as.data.table(e$countries[, .(country_code, name)]), data.table::as.data.table(e$sexRatio5dt), by = "country_code", sort = FALSE)
})
