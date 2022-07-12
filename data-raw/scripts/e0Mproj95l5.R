# 5-year male projected lower 95%PI of e0 in wide format (data.frame)
e0Mproj95l5 <- local({
    source('e0proj5dt.R')
    source("functions.R")
    cast.and.order.by.country(e0proj5dt, "e0M_95l")
})
