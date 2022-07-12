tfr1 <- local({
    e <- new.env()
    load("tfr1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$tfr1dt <- merge(data.table::as.data.table(e$tfr1dt), e$countries, by = "country_code", sort = FALSE)
    tfr1 <- data.table::dcast(e$tfr1dt, country_order + country_code + name ~ year, value.var = "tfr")[, `:=`(country_order = NULL)][]
    as.data.frame(tfr1)
})

#tfr1 <- read.delim(file='tfr.txt', comment.char='#', check.names=FALSE)

