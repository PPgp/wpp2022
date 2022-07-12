popprojLow1 <- local({
    e <- new.env()
    load("popproj1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$popproj1dt <- merge(data.table::as.data.table(e$popproj1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$popproj1dt, country_order + country_code + name ~ year, value.var = "pop_low")[, `:=`(country_order = NULL)][])
})

#popprojLow1 <- read.delim(file='popprojLow.txt', comment.char='#', check.names=FALSE)