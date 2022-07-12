# 5-year TFR in wide format (data.frame)
tfr5 <- local({
    e <- new.env()
    load("tfr5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$tfr5dt <- merge(data.table::as.data.table(e$tfr5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$tfr5dt, country_order + country_code + name ~ period, value.var = "tfr")[, `:=`(country_order = NULL)][])
})
#tfr5 <- read.delim(file='tfr5.txt', comment.char='#', check.names=FALSE)
