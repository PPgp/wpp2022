# 5-year female e0 in wide format (data.frame)
e0F5 <- local({
    e <- new.env()
    load("e05dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$e05dt <- merge(data.table::as.data.table(e$e05dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$e05dt, country_order + country_code + name ~ period, value.var = "e0F")[, `:=`(country_order = NULL)][])
})

#e0F5 <- read.delim(file='e0F5.txt', comment.char='#', check.names=FALSE)

#e0F5 <- local({
#    source('e05dt.R')
#    source("functions.R")
#    cast.and.order.by.country(e05dt, "e0F")
#})
