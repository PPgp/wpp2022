# 1-year projected male, female and total population summed across ages in long format (as data.table)

popproj1dt <- local({
    e <- new.env()
    load("popproj1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(data.table::as.data.table(e$countries[, .(country_code, name)]), data.table::as.data.table(e$popproj1dt), by = "country_code", sort = FALSE)
})
