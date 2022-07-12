migration1 <- local({
    e <- new.env()
    load("migration1dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$migration1dt <- merge(data.table::as.data.table(e$migration1dt), e$countries, by = "country_code", sort = FALSE)
    migration1 <- data.table::dcast(e$migration1dt, country_order + country_code + name ~ year, value.var = "mig")[, `:=`(country_order = NULL)][]
    as.data.frame(migration1)
})

#migration <- read.delim(file='migration.txt', comment.char='#', check.names=FALSE)
