# 5-year lower 80% PI bound of TFR projections TFR in wide format (data.frame)
tfrproj80l5 <- local({
    source('tfrproj5dt.R')
    source("functions.R")
    cast.and.order.by.country(tfrproj5dt, "tfr_80l")
})
