popMprojHigh1 <- local({
    e <- new.env()
    load("popprojAge1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$popprojAge1dt <- merge(data.table::as.data.table(e$popprojAge1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$popprojAge1dt, country_order + country_code + name + age ~ year, value.var = "popM_high")[, `:=`(country_order = NULL)][])
})

#popMprojHigh1 <- read.delim(file='popMprojHigh.txt', comment.char='#', check.names=FALSE)