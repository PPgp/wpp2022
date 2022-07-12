# 5-year upper 80% PI bound of TFR projections in wide format (data.frame)
tfrproj80u <- local({
    #source('tfrproj80u5.R')
    #tfrproj80u5
    e <- new.env()
    load("tfrproj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$tfrproj5dt <- merge(data.table::as.data.table(e$tfrproj5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$tfrproj5dt, country_order + country_code + name ~ period, value.var = "tfr_80u")[, `:=`(country_order = NULL)][])
    
})
