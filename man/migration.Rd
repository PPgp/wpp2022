\name{migration}
\alias{migration}
\alias{migration1}
\alias{migration5}
\alias{migration1dt}
\alias{migration5dt}

\docType{data}
\title{
Datasets on Migration
}
\description{
Annual and 5-year estimates and projections of total net migration.
}
\usage{
# long format
data(migration1dt) # annual
data(migration5dt) # 5-year

# wide format
data(migration1) # annual
data(migration5) # 5-year
data(migration)  # 5-year; legacy
}
\format{
  Datasets in wide format are data frames with one row per country.  They contain the following variables:
  \describe{
  	\item{\code{country_code}}{Numerical Location Code (3-digit codes following ISO 3166-1 numeric standard) - see \url{http://en.wikipedia.org/wiki/ISO_3166-1_numeric}.}
    \item{\code{name}}{Country name.}
    \item{\code{1950}, (\code{1951}, \dots,) \code{1955}, \dots}{(Applies to annual data) Net migration (in thousand) for the specific year.}
    \item{\code{1950-1955}, \code{1955-1960},  \dots}{(Applies to 5-year data) Net migration (in thousand) for the specific five-year time period (i.e., from 1 January in year t to 31 December in year t+4 such as the period 1950-1955 refers to the period 1950.0-1954.99).}
  }
  Datasets in the long format have 1 row per country and year/time period.
}

\details{
\itemize{
\item \code{migration1}, \code{migration1dt}: annual estimates and projections of total net migration, from 1950 to 2100, in wide and long format, respectively.
\item \code{migration5}, \code{migration5dt}: 5-year estimates and projections of total net migration, from 1950-1955 to 2095-2100, in wide and long format, respectively.
}
}

\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
 }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}.
}

\examples{
data(migration1)

# select records for the US
subset(migration1, country_code == 840)

# select records where the name contains the word "America"
subset(migration1, grepl("America", name, fixed = TRUE))

# in long format
# select migration for the US for years between 2000 and 2021
data(migration1dt)
migration1dt[country_code == 840 & year >= 2000 & year <= 2021]
}
\keyword{datasets}
