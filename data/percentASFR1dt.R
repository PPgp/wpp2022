# annual percent ASFR in long format (as data.table)
percentASFR1dt <- local({
    e <- new.env()
    load("percentASFR1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$percentASFR1dt), by = "country_code", sort = FALSE)
})
