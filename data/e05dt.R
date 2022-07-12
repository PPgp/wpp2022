# 5-year male, female & both e0 in long format (as data.table)
e05dt <- local({
    e <- new.env()
    load("e05dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$e05dt), by = "country_code", sort = FALSE)
})
