tfrprojMed1 <- local({
    e <- new.env()
    load("tfrproj1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$tfrproj1dt <- merge(data.table::as.data.table(e$tfrproj1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$tfrproj1dt, country_order + country_code + name ~ year, value.var = "tfr")[, `:=`(country_order = NULL)][])
})
#tfrprojMed1 <- read.delim(file='tfrprojMed.txt', comment.char='#', check.names=FALSE)

