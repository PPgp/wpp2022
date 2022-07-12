sexRatio1 <- local({
    e <- new.env()
    load("sexRatio1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$sexRatio1dt <- merge(data.table::as.data.table(e$sexRatio1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$sexRatio1dt, country_order + country_code + name ~ year, value.var = "srb")[, `:=`(country_order = NULL)][])
})

#sexRatio <- read.delim(file='sexRatio.txt', comment.char='#', check.names=FALSE)
