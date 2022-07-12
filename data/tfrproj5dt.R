# 5-year projections of TFR (median,80 & 95% PIs, low & high variants) in long format (as data.table)
tfrproj5dt <- local({
    e <- new.env()
    load("tfrproj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(data.table::as.data.table(e$countries[, .(country_code, name)]), data.table::as.data.table(e$tfrproj5dt), by = "country_code", sort = FALSE)
})
