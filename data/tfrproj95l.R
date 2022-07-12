# 5-year lower 95% PI bound of TFR projections in wide format (data.frame)
tfrproj95l <- local({
    #source('tfrproj95l5.R')
    #tfrproj95l5
    e <- new.env()
    load("tfrproj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$tfrproj5dt <- merge(data.table::as.data.table(e$tfrproj5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$tfrproj5dt, country_order + country_code + name ~ period, value.var = "tfr_95l")[, `:=`(country_order = NULL)][])
})
