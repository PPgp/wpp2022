# 5-year percent ASFR in wide format (data.frame)
percentASFR5 <- local({
    e <- new.env()
    load("percentASFR5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$percentASFR5dt <- merge(data.table::as.data.table(e$percentASFR5dt), e$countries, by = "country_code", sort = FALSE)
    e$percentASFR5dt[, agecat := rep(1:9, nrow(e$percentASFR5dt)/9)]
    as.data.frame(data.table::dcast(e$percentASFR5dt, country_order + country_code + name + agecat + age ~ period, value.var = "pasfr")[, `:=`(country_order = NULL, agecat = NULL)][])
})
