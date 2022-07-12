e0F1 <- local({
    e <- new.env()
    load("e01dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$e01dt <- merge(data.table::as.data.table(e$e01dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$e01dt, country_order + country_code + name ~ year, value.var = "e0F")[, `:=`(country_order = NULL)][])
})

#e0F1 <- read.delim(file='e0F.txt', comment.char='#', check.names=FALSE)
