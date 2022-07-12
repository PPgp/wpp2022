# 1x1 male population
popM1 <- local({
    e <- new.env()
    load("popAge1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$popAge1dt <- merge(data.table::as.data.table(e$popAge1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$popAge1dt, country_order + country_code + name + age ~ year, value.var = "popM")[, `:=`(country_order = NULL)][])
})

#popM1 <- read.delim(file='popM.txt', comment.char='#', check.names=FALSE)
#if("country" %in% colnames(popM1)) colnames(popM1)[colnames(popM1) == "country"] <- "name"
