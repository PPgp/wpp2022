# 5-year projections of TFR in wide format (data.frame)
tfrprojMed5 <- local({
    e <- new.env()
    load("tfrproj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$tfrproj5dt <- merge(data.table::as.data.table(e$tfrproj5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$tfrproj5dt, country_order + country_code + name ~ period, value.var = "tfr")[, `:=`(country_order = NULL)][])
})

#tfrprojMed5 <- read.delim(file='tfrprojMed5.txt', comment.char='#', check.names=FALSE)

#tfrprojMed5 <- local({
#    source('tfrproj5dt.R')
#    source("functions.R")
#    cast.and.order.by.country(tfrproj5dt, "tfr")
#})
