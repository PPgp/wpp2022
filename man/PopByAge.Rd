\name{pop}
\alias{pop}
\alias{pop5}
\alias{popM}
\alias{popF}
\alias{popM5}
\alias{popF5}
\alias{popB5}
\alias{popMT}
\alias{popFT}
\alias{popMT5}
\alias{popFT5}
\alias{pop1}
\alias{popM1}
\alias{popF1}
\alias{popB1}
\alias{popMT1}
\alias{popFT1}
\alias{pop5dt}
\alias{popAge5dt}
\alias{pop1dt}
\alias{popAge1dt}
\alias{popprojAge1dt}
\alias{popprojAge5dt}
\alias{popMprojMed1}
\alias{popMprojMed5}
\alias{popMprojMed}
\alias{popMprojHigh}
\alias{popMprojLow}
\alias{popMprojHigh1}
\alias{popMprojLow1}
\alias{popMprojHigh5}
\alias{popMprojLow5}
\alias{popFprojMed1}
\alias{popFprojMed5}
\alias{popFprojMed}
\alias{popFprojHigh}
\alias{popFprojLow}
\alias{popFprojHigh1}
\alias{popFprojLow1}
\alias{popFprojHigh5}
\alias{popFprojLow5}
\alias{popBprojMed1}
\alias{popBprojMed5}
\alias{popMTproj}
\alias{popFTproj}
\alias{popMTproj1}
\alias{popFTproj1}
\alias{popMTproj5}
\alias{popFTproj5}
\alias{popproj1dt}
\alias{popproj5dt}
\alias{popproj}
\alias{popproj1}
\alias{popproj5}
\alias{popprojHigh1}
\alias{popprojLow1}
\alias{popprojHigh5}
\alias{popprojLow5}
\alias{popprojHigh}
\alias{popprojLow}
\alias{popproj80l}
\alias{popproj80u}
\alias{popproj95l}
\alias{popproj95u}
\docType{data}
\title{
Estimates and Projections of Population Counts
}
\description{
Annual and 5-year datasets with historical population estimates and projections, in thousands. 
}
\usage{
 # annual estimates (long format)
data(pop1dt)    # totals and sex-specific totals
data(popAge1dt) # sex- and age-specific

# 5-year estimates (long format)
data(pop5dt)    # totals and sex-specific totals
data(popAge5dt) # sex- and age-specific

# annual estimates (wide format)
data(pop1)   # totals
data(popMT1) # totals male
data(popFT1) # totals female
data(popM1)  # age-specific male
data(popF1)  # age-specific female
data(popB1)  # age-specific male + female

# 5-year estimates (wide format)
data(pop5)   # totals
data(popMT5) # totals male
data(popFT5) # totals female
data(popM5)  # age-specific male
data(popF5)  # age-specific female
data(popB5)  # age-specific male + female

# 5-year estimates (wide; legacy names)
data(pop)
data(popMT)
data(popFT)
data(popM)
data(popF) 

# annual projections (long)
data(popproj1dt) # median of totals and sex-specific totals, various bounds
data(popprojAge1dt) # median of sex- and age-specific

# 5-year projections (long)
data(popproj5dt)    # median of totals and sex-specific totals, various bounds
data(popprojAge5dt) # median of sex- and age-specific

# annual projections (wide)
data(popproj1)     # median of totals
data(popprojLow1)  # -1/2 child variant of totals
data(popprojHigh1) # +1/2 child variant of totals
data(popMTproj1)   # median of male totals
data(popFTproj1)   # median of female totals
data(popMprojMed1) # median of male age-specific
data(popFprojMed1) # median of female age-specific
data(popBprojMed1) # median of male + female age-specific
data(popMprojLow1) # -1/2 child variant of male age-specific
data(popMprojHigh1) # +1/2 child variant of male age-specific
data(popFprojLow1) # -1/2 child variant of female age-specific
data(popFprojHigh1) # +1/2 child variant of female age-specific

# 5-year projections (wide)
data(popproj5)
data(popprojLow5)
data(popprojHigh5)
data(popMTproj5)
data(popFTproj5)
data(popMprojMed5)
data(popFprojMed5)
data(popBprojMed5)
data(popMprojLow5)
data(popMprojHigh5)
data(popFprojLow5)
data(popFprojHigh5)

# 5-year projections (wide; legacy names) 
data(popproj)
data(popMTproj)
data(popFTproj)
data(popMprojMed)
data(popFprojMed)

data(popproj80l)
data(popproj80u)
data(popproj95l)
data(popproj95u)
data(popprojHigh)
data(popprojLow)

data(popMprojHigh)
data(popFprojHigh)
data(popMprojLow)
data(popFprojLow)
}
\format{
    Datasets that include 1 in their names are annual while those that include 5 are 5-year data. 
	Datasets that start with \code{popM} or \code{popF} and do not have \dQuote{T} in their names, are age-specific. 
	Datasets that include \dQuote{dt} in their names are in long (data.table) format while the others are in wide (data.frame) format.
	
	Age-specific datasets in wide format are organized as one row per country and age group. For each country there are 21 age groups in case of 5-year data and 101 ages in annual data. It contains the following variables:
  \describe{
    \item{\code{country_code}}{Numerical Location Code (3-digit codes following ISO 3166-1 numeric standard) - see \url{http://en.wikipedia.org/wiki/ISO_3166-1_numeric}.}
    \item{\code{name}}{Country name.}
    \item{\code{age}}{For annual data it is an integer specifying the exact age. For 5-year data it is a character string representing an age interval. In that case, for each country there are 21 values: \dQuote{0-4}, \dQuote{5-9}, \dQuote{10-14}, \dQuote{15-19}, \dQuote{20-24}, \dQuote{25-29}, \dQuote{30-34}, \dQuote{35-39}, \dQuote{40-44}, \dQuote{45-49},  \dQuote{50-54}, \dQuote{55-59}, \dQuote{60-64}, \dQuote{65-69}, \dQuote{70-74}, \dQuote{75-79}, \dQuote{80-84}, \dQuote{85-89}, \dQuote{90-94}, \dQuote{95-99}, and \dQuote{100+} in that order. }
    \item{\code{1950}, (\code{1951}, \dots,) \code{1955}, \dots}{Population estimate or projection (in thousand) for the given time.}
  }
  Non-age-specific datasets in wide format, i.e. those that do not have \dQuote{M} or \dQuote{F}, or have \dQuote{T} in their names,  contain one row per country.
  
  Datasets in the long format (those that contain \dQuote{dt} in their names) have 1 row per country, year and possibly age in case of age-specific datasets.
}

\details{
\bold{Caution:} All annual population datasets are considered to depict population to December 31 of each year. This is different from the official WPP release, which treats population at January 1. Thus, the population numbers in this package are shifted by one year when compared to the official UN data. E.g., population in year 2050 in the R package corresponds to 2051 in UN data. Vital rates and counts at time t refer to the calendar year t, so that they yield population at time t in this R package.

The 5-year datasets are created so that vital rates observed/projected from January 1 of year t to December 31 of year t+4 correspond to population at January 1 of year t+5. E.g. population in 2055 in a 5x5 dataset corresponds to vital rates/counts aggregated over 2050.0-2054.99. Since the 5x5 population is considered to January 1st, it corresponds to the year t-1 in the annual 1x1 dataset, but matches the timing of the UN-published population. 

All values are in thousands. The following datasets are included:
\itemize{
\item \code{pop1dt}, \code{pop5dt}: annual and 5-year estimates of male, female and total population summed over ages, long format.
\item \code{pop1}, \code{pop5}: annual and 5-year estimates of historical total population counts, wide format.
\item \code{popMT1}, \code{popFT1}, \code{popMT5}, \code{popFT5}: annual and 5-year estimates of total counts of male and female population, respectively, in wide format.
\item \code{popAge1dt} (\code{popAge5dt}): annual and 5-year age-specific estimates of the historical male, female and total population counts, in long format.
\item \code{popM1}, \code{popF1}, \code{popB1}, \code{popM5}, \code{popF5}, \code{popB5}: annual and 5-year age-specific estimates of the historical population counts for male, female and both, respectively, in wide format.
\item \code{popproj1dt}, \code{popproj5dt}: annual and 5-year median and various bounds for male, female and total population summed over ages, long format.
\item \code{popproj1}, \code{popproj5}: annual and 5-year median projection of total population counts, i.e. aggregated over sex and age, in wide format.
\item \code{popprojHigh1}, \code{popprojHigh5}, \code{popprojLow1}, \code{popprojLow5}: annual and 5-year  upper and lower variant of total population defined as +- 1/2 child, in wide format.
\item \code{popMTproj1}, \code{popFTproj1}, \code{popMTproj5}, \code{popFTproj5}: annual and 5-year median projection of total counts of male and female population, respectively, in wide format.
\item \code{popXprojMed1}, \code{popXprojMed5}: annual and 5-year  median age-specific projection with X=M for male and X=F for female, in wide format.
\item \code{popXprojHigh1}, \code{popXprojHigh5}, \code{popXprojLow1}, \code{popXprojLow5}: annual and 5-year high and low variants of age-specific projections, respectively, with X=M for male and X=F for female, in wide format.
}
}

\note{For compatibility with previous revisions of the wpp packages, the 5-year datasets in wide format can be also accessed by names that do not include the number 5, e.g. \code{pop} or \code{popM} and \code{popF}.}

\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
  }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}.
}

\examples{
data(popproj1dt)
popproj1dt

data(pop1dt)
pop1dt

# plot population with 80\% PI for various aggregated areas
# World, Asia, Africa, Northern America, Europe, Latin America
locations <- c(900, 935, 903, 905, 908, 904)

# join observed and projected total population
regpop <- rbind(pop1dt[country_code \%in\% locations], 
            popproj1dt[country_code \%in\% locations], fill = TRUE)

par(mfrow=c(2,3))
for(loc in locations) {
    dat <- regpop[country_code == loc]
    plot(dat$year, dat$pop, type = "l", col = "red", 
        ylim = range(dat[, .(pop_80l, pop_80u, pop)], na.rm = TRUE),
        xlab = "Year", ylab = "Population (in thousand)", main = paste0(dat$name[1], ": population"))
    lines(dat$year, dat$pop_80l, lty = 2, col = "red") # lower bound
    lines(dat$year, dat$pop_80u, lty = 2, col = "red") # upper bound
    legend("topleft", legend = c("median", "80\% PI"), col = "red", lty = c(1, 2), bty = "n")
}

# potential support ratio (PSR)
data(popAge1dt, popprojAge1dt)

# join observed and projected age-specific population
aspop <- rbind(popAge1dt[country_code \%in\% locations], 
            popprojAge1dt[country_code \%in\% locations], fill = TRUE)

# compute PSR
psr <- merge(aspop[age > 19 & age < 65, .(`pop20-64` = sum(pop)), by = .(year, country_code, name)],
             aspop[age >= 65, .(`pop65+` = sum(pop)), by = .(year, country_code, name)], 
                by = c("year", "country_code", "name")
             )[, psr := `pop20-64`/`pop65+`]
# plot
par(mfrow=c(2,3))
for(loc in locations) {
    dat <- psr[country_code == loc]
    plot(dat$year, dat$psr, type = "l", xlab = "Year", ylab = "Potential support ratio", 
        main = paste0(dat$name[1], ": PSR"))
}

}
\keyword{datasets}
