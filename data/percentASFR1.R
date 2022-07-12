percentASFR1 <- local({
    e <- new.env()
    load("percentASFR1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$percentASFR1dt <- merge(data.table::as.data.table(e$percentASFR1dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$percentASFR1dt, country_order + country_code + name + age ~ year, value.var = "pasfr")[, `:=`(country_order = NULL)][])
})
#percentASFR <- read.delim(file='percentASFR.txt', comment.char='#', check.names=FALSE)