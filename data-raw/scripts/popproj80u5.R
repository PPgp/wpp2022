# 5-year total population (projected) in wide format (as data.frame)
popproj80u5 <- local({
	source('popproj5dt.R')
    source("functions.R")
    cast.and.order.by.country.pop(popproj5dt, "pop_80u")
})
