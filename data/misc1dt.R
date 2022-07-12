misc1dt <- local({
    e <- new.env()
    load("misc1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$misc1dt), by = "country_code", sort = FALSE)
})