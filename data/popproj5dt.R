# 5-year male, female and total (projected) population summed over ages in long format (as data.table)
popproj5dt <- local({
    e <- new.env()
    load("popproj1dt.rda", envir= e)
    pop <- data.table::as.data.table(e$popproj1dt)[year %in% seq(2024, 2099, by = 5)]
    pop[, year := year + 1]
    pop
})
