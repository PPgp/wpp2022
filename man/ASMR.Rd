\name{mx}
\alias{mxM}
\alias{mxF}
\alias{mx}
\alias{mx1dt}
\alias{mx5dt}
\alias{mxM1}
\alias{mxF1}
\alias{mxB1}
\alias{mxM5}
\alias{mxF5}

\docType{data}
\title{
Age-specific Mortality Data 
}
\description{
Age-specific data on mortality rates for male and female.
}
\usage{
# long format
data(mx1dt) # 1x1
data(mx5dt) # 5x5

# wide format
data(mxM1) # male 1x1
data(mxF1) # female 1x1
data(mxB1) # both 1x1
data(mxM5) # male 5x5
data(mxF5) # female 5x5

}
\format{
  Datasets in the wide format are data frames with one row per country and age group. It contains columns \code{country_code}, \code{name}, \code{age} and one column per year (annual) or five-year time interval (i.e., from 1 January in year t to 31 December in year t+4 such as the period 1950-1955 refers to the period 1950.0-1954.99). 
  
  Datasets in the long format have 1 row per country, year and age group.
}


\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
 
 The 5-year datasets were compiled by Patrick Gerland.
 }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}
}


\examples{
data(mx1dt)
mx1dt

# extract mortality rates for Niger in 2010
mx <- mx1dt[name == "Niger" & year == 2010]

# print all rows
print(mx, topn = nrow(mx))

# plot log mx
plot(mx$age, mx$mxF, col = "red", log = "y", type = "l",
    xlab = "Age", ylab = "mx", main = "Niger 2010") # female
lines(mx$age, mx$mxM, col = "blue") # male
lines(mx$age, mx$mxB) # both
legend("bottomright", legend = c("female", "male", "both"),
      col = c("red", "blue", "black"), lty = 1, bty = "n")
}
\keyword{datasets}
