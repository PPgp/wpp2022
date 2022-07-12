# annual female, male and combined projected e0 median in long format (as data.table)
e0proj1dt <- local({
    e <- new.env()
    load("e0proj1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$e0proj1dt), by = "country_code", sort = FALSE)
})
