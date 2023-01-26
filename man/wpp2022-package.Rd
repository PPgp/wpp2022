\name{wpp2022-package}
\alias{wpp2022-package}
\alias{wpp2022}
\docType{package}
\title{
World Population Prospects 2022
}

\description{
Data from the United Nations World Population Prospects 2022, released on July 11, 2022.
}
\details{
The package contains annual as well as 5-year datasets. Below only annual datasets are shown. For 5-year datasets, replace the number 1 in their names with 5. For example, \code{pop1} becomes \code{pop5}. For legacy reasons, some of the wide 5-year  datasets can be also accessed by removing the number completely, e.g. \code{pop}.

The same data can be retrieved in both, the wide format as well as the long format. Datasets in long format have the suffix \dQuote{dt} and are returned as \code{data.table} objects, while wide tables are returned as \code{data.frame}s.


\subsection{Datasets on population}{
\bold{Caution:} All annual population datasets are considered to depict population to December 31 of each year. This is different from the official WPP release, which treats population at January 1. Thus, the population numbers in this package are shifted by one year when compared to the official UN data. E.g., population in year 2050 in the R package corresponds to 2051 in UN data. Vital rates and counts at time t refer to the calendar year t, so that they yield population at time t in this R package.

The 5-year datasets are created so that vital rates observed/projected from January 1 of year t to December 31 of year t+4 correspond to population at January 1 of year t+5. E.g. population in 2055 in a 5x5 dataset corresponds to vital rates/counts aggregated over 2050.0-2054.99. Since the 5x5 population is considered to January 1st, it corresponds to the year t-1 in the annual 1x1 dataset, but matches the timing of the UN-published population. 

\itemize{
\item \bold{Historical estimates}
Data from 1949 to 2021.
\itemize{
\item Long format:
\itemize{
\item age-specific: \link{popAge1dt} (male, female, total)
\item totals across age: \link{pop1dt} (male, female, total)
}
\item Wide format:
\itemize{
\item age-specific:  \link{popF1} (female), \link{popM1} (male), \link{popB1} (total)
\item totals by sex: \link{popFT1} (female), \link{popMT1} (male)
\item totals across sex and age: \link{pop1}
}
}
\item \bold{Projections}
Data from 2022 to 2100.
\itemize{
\item Long format:
\itemize{
\item age-specific: \link{popprojAge1dt} (median male, female, total, +-1/2 child variant)
\item totals across age: \link{popproj1dt} (median male, female, total, various bounds)
}
\item Wide format:
\itemize{
\item age-specific:  \link{popFprojMed1} (median female), \link{popMprojMed1} (median male), \link{popBprojMed1} (median total)
\item totals across sex and age: \link{popproj1} (median)
\item various other datasets on the variant bounds are available.
}

}
}
}
\subsection{Datasets on fertility}{
\itemize{
\item \bold{Total fertility rate}
\itemize{
\item Historical estimates: \link{tfr1dt} (long), \link{tfr1} (wide)
\item Projections: 
\itemize{
\item Long format: \link{tfrproj1dt} (median, 80 and 90\% probability intervals, and +-1/2 child variants)
\item Wide format: \link{tfrprojMed1} (median), \link{tfrprojLow1}, \link{tfrprojHigh1} (-+1/2 child variants)
}
\item Pre-1950 estimates: \link{tfr_supplemental} (5-year)
}
\item \bold{Percent age-specific fertility rate}
\itemize{
\item Historical estimates and projections: \link{percentASFR1} (wide), \link{percentASFR1dt} (long)
}
}
}

\subsection{Datasets on mortality}{
\itemize{
\item \bold{Life expectancy at birth}
\itemize{
\item Historical estimates: \link{e01dt} (male, female, both; long format), \link{e0F1} (female; wide), \link{e0M1} (male; wide), \link{e0B1} (combined sexes; wide), 
\item Projections: 
\itemize{
\item Long format: \link{e0proj1dt} (all sexes; median and all probabilistic bounds)
\item Median in wide format: \link{e0Fproj1} (female), \link{e0Mproj1} (male), \link{e0Bproj1} (both) 
}
\item Pre-1950 estimates: \link{e0F_supplemental}, \link{e0M_supplemental} (5-year), \link{e0F_supplemental1}, \link{e0M_supplemental1} (1-year)
}
\item \bold{Mortality rates}
These datasets contain age- and sex-specific historical estimates and projections (1950-2100) in one file.
\itemize{
\item Long format: \link{mx1dt} (male, female, both)
\item Wide format: \link{mxF1} (female), \link{mxM1} (male), \link{mxB1} (both)
}
}
}

\subsection{Migration}{
The package contains historical estimates and deterministic projection for total net migration counts (1950-2100).
\itemize{
\item \link{migration1dt} (long format), \link{migration1} (wide format) 
}
}

\subsection{Other datasets}{
\itemize{
\item \bold{Sex ratio at birth}
\itemize{
\item \link{sexRatio1dt}, \link{sexRatio1}: ratio of male to female, in long and wide format, respectively.
}
\item \bold{Births and deaths}
\itemize{
\item \link{misc1dt}, \link{miscproj1dt}: estimates and projections of additional demographic indicators, including births, deaths and growth rate. Only available for annual data in long format.
}

\item \bold{Locations:} \link{UNlocations} (dataset of UN locations)
}}
}


\note{The package \pkg{wppExplorer} offers a shiny user interface to explore these datasets, as well as functions for convenient extraction of information from the data, see function \code{wpp.indicator()} in \pkg{wppExplorer}, or \url{https://bayespop.shinyapps.io/wpp2022explorer/}.
}

\source{
 These datasets are based on estimates and projections of United Nations, Department of Economic and Social Affairs, Population Division (2022). 
 }
 
 \references{
 World Population Prospects: The 2022 Revision. \url{http://population.un.org/wpp}.
}

\examples{
# plot World population with 80\% PI
data(pop1dt, popproj1dt)

# join observed and projected data
world <- rbind(pop1dt[name == "World"], popproj1dt[name == "World"], fill = TRUE)
plot(world$year, world$pop, type = "l", col = "red", 
    ylim = range(world[, .(pop_80l, pop_80u, pop)], na.rm = TRUE),
    xlab = "Year", ylab = "Population", main = "World population (in thousand)")
lines(world$year, world$pop_80l, lty = 2, col = "red") # lower bound
lines(world$year, world$pop_80u, lty = 2, col = "red") # upper bound
legend("topleft", legend = c("median", "80\% PI"), col = "red", lty = c(1, 2), bty = "n")

# See more examples in ?pop
}

\keyword{ package }