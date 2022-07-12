\name{e0}
\alias{e0}
\alias{e0_supplemental}
\alias{e0F}
\alias{e0Fproj}
\alias{e0M}
\alias{e0Mproj}
\alias{e0F1}
\alias{e0Fproj1}
\alias{e0M1}
\alias{e0Mproj1}
\alias{e0F5}
\alias{e0Fproj5}
\alias{e0M5}
\alias{e0Mproj5}
\alias{e0B}
\alias{e0Bproj}
\alias{e0B1}
\alias{e0Bproj1}
\alias{e0B5}
\alias{e01dt}
\alias{e05dt}
\alias{e0proj1dt}
\alias{e0proj5dt}
\alias{e0Mproj80l}
\alias{e0Mproj80u}
\alias{e0Mproj95l}
\alias{e0Mproj95u}
\alias{e0Fproj80l}
\alias{e0Fproj80u}
\alias{e0Fproj95l}
\alias{e0Fproj95u}
\alias{e0F_supplemental}
\alias{e0M_supplemental}
\docType{data}
\title{
United Nations Time Series of Life Expectancy
}
\description{
Datasets containing the United Nations' annual and 5-year time series of the life expectancy at birth (e0) for all countries of the world as available in 2022. They are available for each sex (M, F) as well as for both sexes combined (B).
}
\usage{
# historical estimates in long format
data(e01dt) # annual; all sexes
data(e05dt) # 5-year; all sexes 

# historical estimates in wide format
data(e0F1) # annual female
data(e0M1) # annual male
data(e0B1) # annual both
data(e0F5) # 5-year female
data(e0M5) # 5-year male 
data(e0B5) # 5-year both

# projections in long format
data(e0proj1dt) # annual; all sexes; all uncertainty bounds
data(e0proj5dt) # 5-year; all sexes; all uncertainty bounds

# projections median in wide format
data(e0projF1) # annual; female
data(e0projM1) # annual; male
data(e0projB1) # annual; both
data(e0projF5) # 5-year; female
data(e0projM5) # 5-year; male

# 5-year probabilistic bounds in wide format (legacy)
data(e0Fproj80l) # lower 80\%; female
data(e0Fproj80u) # upper 80\%; female
data(e0Fproj95l) # lower 95\%; female
data(e0Fproj95u) # upper 95\%; female
data(e0Mproj80l) # lower 80\%; male
data(e0Mroj80u) # upper 80\%; male
data(e0Mproj95l) # lower 95\%; male
data(e0Mproj95u) # upper 95\%; male

# pre-1950 data
data(e0F_supplemental)
data(e0M_supplemental)
}

\format{
Datasets that include 1 in their names are annual while those that include 5 are 5-year data. 
	Datasets that include \dQuote{dt} in their names are in long (data.table) format while the others are in wide (data.frame) format.
	
  Datasets in the wide format contain one record per country or region. They contain the following variables:
  \describe{
    \item{\code{country_code}}{Numerical Location Code (3-digit codes following ISO 3166-1 numeric standard) - see \url{http://en.wikipedia.org/wiki/ISO_3166-1_numeric}.}
    \item{\code{name}}{Name of country or region (following ISO 3166 official short names in English - see \url{https://www.iso.org/obp/ui/#search/code/} and United Nations Multilingual Terminology Database - see \url{http://unterm.un.org}).}
    \item{\code{1950}, (\code{1951}, \dots,) \code{1955}, \dots}{(Applies to annual data) Average e0 in the various years (i.e. from 1.1. to 31.12. of that year). The \code{e0*proj*1*} datasets start at \code{2022}.}
    \item{\code{1950-1955}, \code{1955-1960}, \dots}{(Applies to 5-year data) Average life expectancy in various five-year time intervals weighted by population. The averages are obtained from the annual data using mid-year population from years 1950-1954, 1955-1959 etc.  The \code{e0*proj*5*} datasets start at \code{2020-2025}. The \code{e0*_supplemental} datasets start at \code{1750-1755}. Missing data have \code{NA} values.}
  }
  Datasets in the long format (those that contain \dQuote{dt} in their names) have 1 row per country and year or time period.
}
\details{
Below the annual datasets are described. 5-year datasets can be retrieved by replacing 1 with 5. For most wide datasets, the 5 can be also left out.
\itemize{
\item \code{e01dt}: estimates of historical e0 for all sexes, in long format.
\item \code{e0F1}, \code{e0M1}, \code{e0B1}: estimates of historical e0 (female, male, both), starting at 1950, in wide format. 
\item \code{e0proj1dt}: projection median of e0 for all sexes, in long format.
\item \code{e0projF1}, \code{e0projM1}, \code{e0projB1}: projection median of e0 (female, male, both), starting at 2022, in wide format. 

}

The historical datasets (\code{e0F_supplemental} and \code{e0M_supplemental} for female and male, respectively) for 29 countries or areas cover the period 1750-1950 (including 20 countries with data since at least 1900) and are based on series for 5-year periods from the following sources: (1) University of California at Berkeley (USA), and Max Planck Institute for Demographic Research (Germany). (2012). Human Mortality Database Available at \url{https://www.mortality.org}. Data downloaded on 9 Jan. 2012; (2) University of California at Berkeley (USA), Max Planck Institute for Demographic Research (Germany), and Institut National d'Etudes Demographiques (France). Human Life-Table Database (2011). Available at \url{https://www.lifetable.de}. Data downloaded on 29 Dec. 2011; (3) Statistics Finland (2006). Statistical Yearbook of Finland 2006; (4) Hungarian Central Statistical Office (2006). Hungary Demographic Yearbook 2005; (5) Japan Ministry of Internal Affairs and Communication (2012). Historical Statistics of Japan. Available at: \code{www.stat.go.jp/english/data/chouki}; (6) Andreev E.M. et al. (1998). Demographic History of Russia 1927-1959. Informatika, Moscow.
}
\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
 
 The pre-1950 datasets and the 5-year datasets were compiled by Patrick Gerland.
 }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}
}

\examples{
data(e01dt)
e01dt

data(e0Fproj5)
str(e0Fproj5)
}
\keyword{datasets}
