# 5-year upper projection 95% bound of female e0 in wide format (data.frame)
e0Fproj95u <- local({
    #source('e0Fproj95u5.R')
    #e0Fproj95u5
    e <- new.env()
    load("e0proj5dt.rda", envir= e)
    load("countries.rda", envir= e)
    e$e0proj5dt <- merge(data.table::as.data.table(e$e0proj5dt), e$countries, by = "country_code", sort = FALSE)
    as.data.frame(data.table::dcast(e$e0proj5dt, country_order + country_code + name ~ period, value.var = "e0F_95u")[, `:=`(country_order = NULL)][])
})
