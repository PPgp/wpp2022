# 5-year male, female and total (observed) population summed over ages in long format (as data.table)
pop5dt <- local({
    source('popAge5dt.R', local = TRUE)
    popAge5dt[, .(popM = sum(popM), popF = sum(popF), pop = sum(pop)), by = c("country_code", "name", "year")]
})
