e0Bproj1 <- local({
    e <- new.env()
    load("e0proj1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$e0proj1dt <- merge(data.table::as.data.table(e$e0proj1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$e0proj1dt, country_order + country_code + name ~ year, value.var = "e0B")[, `:=`(country_order = NULL)][])
})
#e0Bproj1 <- read.delim(file='e0Bproj.txt', comment.char='#', check.names=FALSE)