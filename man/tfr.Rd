\name{tfr}
\alias{tfr}
\alias{tfr1}
\alias{tfr5}
\alias{tfr1dt}
\alias{tfr5dt}
\alias{tfr_supplemental}
\alias{tfrprojMed}
\alias{tfrprojMed1}
\alias{tfrprojMed5}
\alias{tfrproj1dt}
\alias{tfrproj5dt}
\alias{tfrprojHigh}
\alias{tfrprojLow}
\alias{tfrprojHigh1}
\alias{tfrprojLow1}
\alias{tfrprojHigh5}
\alias{tfrprojLow5}
\alias{tfrproj80l}
\alias{tfrproj80u}
\alias{tfrproj95l}
\alias{tfrproj95u}
\docType{data}
\title{
United Nations Time Series of Total Fertility Rate
}
\description{
Datasets containing the United Nations' annual and 5-year time series of the total fertility rate (TFR) for all countries of the world as available in 2022. 
}
\usage{
# estimates in long format
data(tfr1dt)
data(tfr5dt)

# estimates in wide format
data(tfr1) # annual
data(tfr5) # 5-year
data(tfr)  # 5-year legacy

data(tfr_supplemental) # 5-year pre-1950

# projections in long format (median and all bounds)
data(tfrproj1dt) # annual
data(tfrproj5dt) # 5-year

# projections in wide format
# medians
data(tfrprojMed1) # annual 
data(tfrprojMed5) # 5-year 
data(tfrprojMed) # 5-year; legacy

# 5-year probabilistic bounds in wide format
data(tfrproj80l) # lower 80\%
data(tfrproj80u) # upper 80\%
data(tfrproj95l) # lower 95\%
data(tfrproj95u) # upper 95\%

# +-1/2 child variants in wide format
data(tfrprojLow1)  # annual lower
data(tfrprojHigh1) # annual upper
data(tfrprojLow5)  # 5-year lower
data(tfrprojHigh5) # 5-year upper
data(tfrprojLow)   # 5-year lower; legacy
data(tfrprojHigh)  # 5-year upper; legacy

}

\format{
  Datasets that include 1 in their names are annual while those that include 5 are 5-year data. 
	Datasets that include \dQuote{dt} in their names are in long (data.table) format while the others are in wide (data.frame) format.
	
  Datasets in the wide format contain one record per country or region. It contains the following variables:
  \describe{
    \item{\code{country_code}}{Numerical Location Code (3-digit codes following ISO 3166-1 numeric standard) - see \url{http://en.wikipedia.org/wiki/ISO_3166-1_numeric}.}
    \item{\code{name}}{Name of country or region (following ISO 3166 official short names in English - see \url{https://www.iso.org/obp/ui/#search/code/} and United Nations Multilingual Terminology Database - see \url{http://unterm.un.org}).}
    \item{\code{1950}, (\code{1951}, \dots,) \code{1955}, \dots}{(Applies to annual data) Average TFR in the various years (i.e. from 1.1. to 31.12. of that year). The \code{tfrproj*1*} datasets start at \code{2022}.}
    \item{\code{1950-1955}, \code{1955-1960}, \dots}{(Applies to 5-year data) Average TFR in various five-year time intervals weighted by population. The averages are obtained from the annual data using mid-year population from years 1950-1954, 1955-1959 etc. The \code{tfrproj*5*} datasets start at \code{2020-2025} (corresponding to an average from 2020-2024). The \code{tfr_supplemental} datasets start at \code{1740-1745}. Missing data have \code{NA} values.}
  }
  Datasets in the long format (those that contain \dQuote{dt} in their names) have 1 row per country and year or time period.
}


\details{
\itemize{
\item \code{tfrproj1dt}, \code{tfrproj5dt}: annual and 5-year TFR projections including all variants and probability intervals, in long format.
\item \code{tfr1}, \code{tfr5}: annual and 5-year estimates of historical TFR, starting at 1950, in wide format.
\item \code{tfr1dt}, \code{tfr5dt}: annual and 5-year estimates of historical TFR, in long format.
\item \code{tfrprojMed1}, \code{tfrprojMed5}: annual and 5-year median projections, in wide format.
\item \code{tfrproj80l}, \code{tfrproj80u}: lower (l) and upper (u) bound of the 80\% probability interval for annual and 5-year projections, in wide format.
\item \code{tfrproj95l}, \code{tfrproj95u}: lower (l) and upper (u) bound of the 95\% probability interval for annual and 5-year projections, in wide format.
\item \code{tfrprojLow1}, \code{tfrprojLow5}, \code{tfrprojHigh1}, \code{tfrprojHigh5}: annual and 5-year low and high projection variants defined as -+ 1/2 child, in wide format.
}
Dataset \code{tfr_supplemental} contains a subset of countries for which data prior 1950 are available. 

The historical dataset \code{tfr_supplemental} (for 103 countries or areas) covers the period 1740-1950 (including 24 countries with data before 1850), and is based on series for five-year periods from the following sources: (1) Max Planck Institute for Demographic Research (Germany) and Vienna Institute of Demography (Austria). (2012). Human Fertility Database (HFD). Available at \url{https://www.humanfertility.org}. Data downloaded on 13 May 2012; (2) Festy, P. (1979). La fecondite des pays occidentaux de 1870 a 1970. Paris: Presses universitaires de France; (3) Chesnais, J.C. (1992). The demographic transition: stages, patterns, and economic implications: a longitudinal study of sixty-seven countries covering the period 1720-1984. Oxford ; New York: Clarendon Press; (4) Bhat, P.N.M. (1989). "Mortality and fertility in India, 1881-1961: a reassessment." pp. 73-118 in India's historical demography: studies in famine, disease and society, edited by T. Dyson. London and Riverdale, Md: Curzon and Riverdale Co.; (5) Hofsten, E.A.G.v. and H. Lundstrom. (1976). Swedish population history: Main trends from 1750 to 1970. Stockholm: Statistiska centralbyran: LiberForlag; (6) Ajus, F. and M. Lindgren. (2012). Gapminder fertility dataset, 2010 (including documentation for Children per Woman (Total Fertility Rate) for countries and territories, Version 2. The Gapminder Foundation. Sweden, Stockholm. \url{http://www.gapminder.org/data/documentation/gd008/}. Data downloaded on 8 April 2012.}

\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
 
 The pre-1950 dataset and the 5-year datasets were compiled by Patrick Gerland.
 }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}.
}

\examples{
data(tfrproj1dt)
tfrproj1dt

data(tfr5)
str(tfr5)
}
\keyword{datasets}
