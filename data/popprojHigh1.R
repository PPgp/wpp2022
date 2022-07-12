popprojHigh1 <- local({
    e <- new.env()
    load("popproj1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$popproj1dt <- merge(data.table::as.data.table(e$popproj1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$popproj1dt, country_order + country_code + name ~ year, value.var = "pop_high")[, `:=`(country_order = NULL)][])
})


#popprojHigh1 <- read.delim(file='popprojHigh.txt', comment.char='#', check.names=FALSE)