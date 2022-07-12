\name{sexRatio}
\alias{sexRatio}
\alias{sexRatio1}
\alias{sexRatio5}
\alias{sexRatio1dt}
\alias{sexRatio5dt}

\docType{data}
\title{
Sex Ratio at Birth
}
\description{
Annual and 5-year data of the sex ratio at birth derived as the number of male divided by the number of female.
}
\usage{
    data(sexRatio1, sexRatio5) # wide format
    data(sexRatio1dt, sexRatio5dt) # long format
}
\format{
  Datasets in the wide format are data frames with one record per country. It contains columns \code{country_code}, \code{name}, and one column per year (annual) or per five-year time interval (i.e., from 1 July in year t to 1 July in year t+5 such as the period 1950-1955 refers to the period 1950.5-1955.5 and the mid of the period is 1953.0).
  
  Datasets in the long format have 1 row per country and year or time period.
}

\details{
\itemize{
\item \code{sexRatio1}, \code{sexRatio1dt}: annual data on sex ratio at birth, from 1950 to 2100, in wide and long format, respectively.
\item \code{sexRatio5}, \code{sexRatio5dt}: 5-year data on sex ratio at birth, from 1950-1955 to 2095-2100, in wide and long format, respectively.
}
}


\source{
 This dataset is based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
 
 The 5-year dataset was compiled by Patrick Gerland.
 }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}.
}

\examples{
data(sexRatio5)
str(sexRatio5)
}
\keyword{datasets}
