# 5-year lower 80% PI bound of TFR projections in wide format (data.frame)
tfrproj80l <- local({
    e <- new.env()
    load("tfrproj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$tfrproj5dt <- merge(data.table::as.data.table(e$tfrproj5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$tfrproj5dt, country_order + country_code + name ~ period, value.var = "tfr_80l")[, `:=`(country_order = NULL)][])
    
    #source('tfrproj80l5.R')
    #tfrproj80l5
})
