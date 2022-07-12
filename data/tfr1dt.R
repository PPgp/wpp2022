# annual TFR in long format (as data.table)
tfr1dt <- local({
    e <- new.env()
    load("tfr1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$tfr1dt), by = "country_code", sort = FALSE)
})
