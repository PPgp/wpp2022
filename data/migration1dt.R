# annual total net migration in long format (as data.table)
migration1dt <- local({
    e <- new.env()
    load("migration1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$migration1dt), by = "country_code", sort = FALSE)
})
