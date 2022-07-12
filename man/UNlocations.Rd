\name{UNlocations}
\alias{UNlocations}
\alias{countries}

\docType{data}
\title{
United Nations Table of Locations
}
\description{
United Nations table of locations, including regions, for statistical purposes as available in 2022.
}
\usage{
	data(UNlocations)
	}
\format{
  A data frame with one observations per country or region. It contains the following variables:
  \describe{
    \item{\code{name}}{Name of country or region (following ISO 3166 official short names in English - see \cr \url{https://www.iso.org/obp/ui/#search/code/} and United Nations Multilingual Terminology Database - see \url{http://unterm.un.org}).}
    \item{\code{country_code}}{Numerical Location Code (3-digit codes following ISO 3166-1 numeric standard) - see \url{http://en.wikipedia.org/wiki/ISO_3166-1_numeric}.}
    \item{\code{reg_code}}{Code of the regions.}
    \item{\code{reg_name}}{Name of the regions.}
    \item{\code{area_code}}{Area code.}
    \item{\code{area_name}}{Area names, such as \code{Africa}, \code{Asia}, \code{Europe} \code{Latin America and the Caribbean}, \code{Northern America}, \code{Oceania}, \code{World}.}
    \item{\code{location_type}}{Code giving the type of the observation: 0=World, 2=Major Area, 3=Region, 4=Country/Area, 5=Development group, 12=Special groupings. Other numbers are allowed and they can be used for aggregation, see below.}
    \item{\code{SortOrder}}{Sorting order for the locations.}
    \item{\code{agcode_1500000}, \code{agcode_1501000}, \code{agcode_1502000}, \code{agcode_1503000}, \code{agcode_1517000}, \code{agcode_1518000}, \code{agcode_1636000}, \code{agcode_1637000}, \code{agcode_1829000}, \code{agcode_1830000}, \code{agcode_1831000}, \code{agcode_1832000}, \code{agcode_1833000}, \code{agcode_1834000}, \code{agcode_1835000}, \code{agcode_1836000},\code{agcode_901000}, \code{agcode_902000}, \code{agcode_934000}, \code{agcode_941000}, \code{agcode_948000}, \code{tree_level}}{Optional columns that can be used for aggregations. To aggregate a region with \code{country_code}=\eqn{x}, get the value of its \code{location_type}, say \eqn{y}. Then look for the column \code{agcode_y} and locate all records with \code{agcode_y}=\eqn{x} that have \code{location_type}=4, see Example below.}
  }

}

\source{
Data provided by the United Nations Population Division.

The designations employed in this dataset do not imply the expression of any opinion whatsoever on the part of the Secretariat of the United Nations concerning the legal status of any country, territory, city or area or of its authorities, or concerning the delimitation of its frontiers or boundaries. 
}
%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(UNlocations)
# Find high income countries in Africa (based on World Bank groups)
grouprec <- subset(UNlocations, name == "High-income countries")
# grouprec$location_type is 1503000, thus look for column agcode_1503000 
subset(UNlocations, agcode_1503000 == grouprec$country_code & 
                            location_type == 4 & area_name == "Africa")
}
\keyword{datasets}
