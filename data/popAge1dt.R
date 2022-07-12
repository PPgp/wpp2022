# 1x1 male, female and total age-specific observed population in long format (as data.table)
popAge1dt <- local({
    e <- new.env()
    load("popAge1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$popAge1dt), by = "country_code", sort = FALSE)
})
