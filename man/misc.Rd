\name{misc}
\alias{misc}
\alias{misc1dt}
\alias{miscproj1dt}
\alias{age5categories}

\docType{data}
\title{
Miscellaneous demographic indicators
}
\description{
Datasets containing annual estimates and projections from various demographic indicators.
}
\usage{
# estimates
data(misc1dt)

# projections
data(miscproj1dt)
}
\format{
  Data frames with one observation per country and year. They contain the following variables:
  \describe{
    \item{\code{country_code}}{Numerical Location Code (3-digit codes following ISO 3166-1 numeric standard) - see \url{http://en.wikipedia.org/wiki/ISO_3166-1_numeric}.}
    \item{\code{name}}{Name of country or region (following ISO 3166 official short names in English - see \url{https://www.iso.org/obp/ui/#search/code/} and United Nations Multilingual Terminology Database - see \url{http://unterm.un.org}).}
    \item{\code{year}}{Corresponding year.}
    \item{\code{births}}{Number of births in 1000.}
    \item{\code{cbr}}{Annual number of live births per 1,000 population.}
    \item{\code{deaths}}{Number of deaths in 1000.}
    \item{\code{cdr}}{Annual number of deaths per 1,000 population.}
    \item{\code{growthrate}}{Annual rate of population change (as \%).}
  }
}
%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
}
\references{
World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}.
}
\examples{
data(misc1dt)
misc1dt
}
\keyword{datasets}
