\name{percentASFR}
\alias{percentASFR}
\alias{percentASFR1}
\alias{percentASFR5}
\alias{percentASFR1dt}
\alias{percentASFR5dt}

\docType{data}
\title{
Datasets on Age-specific Distribution of Fertility Rates
}
\description{
Annual and 5-year datasets giving the percentage of fertility rates over ages 10-54, from 1950 to 2100. They sum to 100 for each country and time period.
}
\usage{
# long format
data(percentASFR1dt) # annual
data(percentASFR5dt) # 5-year

# wide format
data(percentASFR1) # annual
data(percentASFR5) # 5-year
data(percentASFR)  # 5-year; legacy)
}
\format{
  Datasets in the wide format are data frames with one row per country and age group. Only child-bearing age groups are included, namely 10-54. It contains columns \code{country_code}, \code{name}, \code{age} and one column per year (annual) or five-year time interval (i.e., from 1 January in year t to 31 December in year t+4 such as the period 1950-1955 refers to the period 1950.0-1954.99). 
  
  Datasets in the long format have 1 row per country, year and age group.
}

\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
 
 The 5-year dataset was compiled be Patrick Gerland.
 }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}.
}


\examples{
data(percentASFR5)
str(percentASFR5)
}
\keyword{datasets}
