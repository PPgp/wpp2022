# 1x1 projected median female age-specific population in long format (as data.table)
popprojAge1dt <- local({
    e <- new.env()
    load("popprojAge1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$popprojAge1dt), by = "country_code", sort = FALSE)
})
