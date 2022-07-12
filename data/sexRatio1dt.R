# annual total net migration in long format (as data.table)
sexRatio1dt <- local({
    e <- new.env()
    load("sexRatio1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$sexRatio1dt), by = "country_code", sort = FALSE)
})
