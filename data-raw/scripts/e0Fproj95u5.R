# 5-year female projected upper 95%PI of e0 in wide format (data.frame)
e0Fproj95u5 <- local({
    source('e0proj5dt.R')
    source("functions.R")
    cast.and.order.by.country(e0proj5dt, "e0F_95u")
})
