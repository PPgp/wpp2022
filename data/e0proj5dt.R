# 5-year male, female & both projected median of e0 in long format (as data.table)
e0proj5dt <- local({
    e <- new.env()
    load("e0proj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    merge(e$countries[, c("country_code", "name")], data.table::as.data.table(e$e0proj5dt), by = "country_code", sort = FALSE)
})
