miscproj1dt <- local({
    e <- new.env()
    load("miscproj1dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$miscproj1dt), by = "country_code", sort = FALSE)
})