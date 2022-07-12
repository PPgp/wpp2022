# 5x5 male population median projection in long format (as data.table)
popprojAge5dt <- local({
    source("popprojAge1dt.R")
    e <- new.env()
    load("age5categories.rda", envir= e)
    pop1 <- data.table::as.data.table(merge(data.table::as.data.table(popprojAge1dt), e$age5categories[,.(age1, agecat, age5=age)], by.x = "age", by.y = "age1", sort = FALSE))
    pop5 <- pop1[, .(popM = sum(popM), popF = sum(popF), pop = sum(pop), 
                     popM_low = sum(popM_low), popM_high = sum(popM_high),
                     popF_low = sum(popF_low), popF_high = sum(popF_high)), 
                 by = c("country_code", "name", "year", "agecat", "age5")][year %in% seq(2025, 2100, by = 5)][, agecat := NULL]
    data.table::setnames(pop5, "age5", "age")
    pop5[]
})
