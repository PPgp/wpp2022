# 1-year observed male, female and total population (summed over ages) in long format (as data.table)

pop1dt <- local({
    source("popAge1dt.R")
    data.table::setDT(popAge1dt)
    popAge1dt[, .(popM = sum(popM), popF = sum(popF), pop = sum(pop)), by = c("country_code", "name", "year")]
})
