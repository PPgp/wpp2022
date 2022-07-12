# annual female, male and combined e0 in long format (as data.table)
e01dt <- local({
    e <- new.env()
    load("e01dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(data.table::as.data.table(e$countries[, .(country_code, name)]), data.table::as.data.table(e$e01dt), by = "country_code", sort = FALSE)
})
