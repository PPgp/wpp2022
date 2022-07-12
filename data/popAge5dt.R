# 5x5 male, female and total age-specific observed population in long format (as data.table)
popAge5dt <- local({
    source("popAge1dt.R")
    e <- new.env()
    load("age5categories.rda", envir= e)
    pop1 <- merge(data.table::as.data.table(popAge1dt), e$age5categories[,.(age1, agecat, age5=age)], by.x = "age", by.y = "age1", sort = FALSE)
    pop5 <- pop1[, .(popM = sum(popM), popF = sum(popF), pop = sum(pop)), 
                 by = c("country_code", "name", "year", "agecat", "age5")][year %in% seq(1949, 2019, by = 5)][, agecat := NULL]
    data.table::setnames(pop5, "age5", "age")
    pop5[, year := year + 1]
    pop5[]
})
