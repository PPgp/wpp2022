# 5-year male projected median of e0 in wide format (data.frame)
e0Mproj5 <- local({
    e <- new.env()
    load("e0proj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$e0proj5dt <- merge(data.table::as.data.table(e$e0proj5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$e0proj5dt, country_order + country_code + name ~ period, value.var = "e0M")[, `:=`(country_order = NULL)][])
})
#e0Mproj5 <- read.delim(file='e0Mproj5.txt', comment.char='#', check.names=FALSE)
# e0Mproj5 <- local({
#     source('e0proj5dt.R')
#     source("functions.R")
#     cast.and.order.by.country(e0proj5dt, "e0M")
# })
