# annual mx in long format (as data.table)
mx1dt <- local({
    e <- new.env()
    load("mx1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$mx1dt), by = "country_code", sort = FALSE)
})
