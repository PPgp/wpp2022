# 1x1 female + male population
popB1 <- local({
    e <- new.env()
    load("popAge1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$popAge1dt <- merge(data.table::as.data.table(e$popAge1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$popAge1dt, country_order + country_code + name + age ~ year, value.var = "pop")[, `:=`(country_order = NULL)][])
})

#popF1 <- read.delim(file='popF.txt', comment.char='#', check.names=FALSE)
#if("country" %in% colnames(popF1)) colnames(popF1)[colnames(popF1) == "country"] <- "name"

