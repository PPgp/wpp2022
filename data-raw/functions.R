merge.with.countries <- function(dt) {
    # to keep the same order add temporary columns for countries
    cntries.dt <- data.table::data.table(country_code = unique(dt[, country_code]))
    cntries.dt[, country_order := 1:nrow(cntries.dt)]
    merge(dt, cntries.dt, by = "country_code", sort = FALSE)
}

merge.with.age5 <- function(dt) {
    agedf <- data.table(age = 0:100, agecat = c(rep(seq(0, 95, by = 5), each = 5), 100))
    merge(dt, agedf, by = "age", sort = FALSE)
}

cast.and.order.by.country <- function(dt, colname) {
    res <- merge.with.countries(dt)
    res <- data.table::dcast(res, country_order + country_code + name ~ period, value.var = colname)
    res[, `:=`(country_order = NULL)]
    as.data.frame(res)
}

cast.and.order.by.country.pop <- function(dt, colname) {
    res <- merge.with.countries(dt)
    res <- data.table::dcast(res, country_order + country_code + name ~ year, value.var = colname)
    res[, `:=`(country_order = NULL)]
    as.data.frame(res)
}

cast.and.order.by.country.and.age.pop <- function(dt, colname) {
    # dt should have column agecat which gets deleted
    res <- merge.with.countries(dt)
    res <- data.table::dcast(res, country_order + country_code + name + agecat + age ~ year, value.var = colname)
    res[, `:=`(country_order = NULL, agecat = NULL)]
    as.data.frame(res)
}

melt.and.merge <- function(dt1, dt2, colname, ids = "country_code", var.name = "year", by = c("country_code", "year")){
    res <- data.table::melt(dt2, id.vars = ids, variable.name = var.name, 
                            value.name = colname, variable.factor = FALSE)
    if(!is.null(dt1))
        res <- merge(dt1, res, by = by, sort = FALSE)
    return(res)
}