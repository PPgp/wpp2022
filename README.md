# wpp2022

## Introduction

**Maintainer's note:**

We are very pleased to provide the wpp2022 R package that contains various datasets from the newly published revision of the United Nations World Population Prospects, the [WPP 2022](https://population.un.org/wpp), released on July 11, 2022. The Population Estimates and Projection Section of the UN Population Division, under the leadership of Patrick Gerland, compiled these data, while dealing with difficult challenges including the impact of COVID on estimates and projections, as well as switching from 5-year data to one-year data. 

In addition to the expert analysts working at the UN, Patrick Gerland  assembled an international group of respected  scientists to support this work, in order to ensure that the underlying methodology is cutting edge, including assessing uncertainty around estimates and projections.

[Read about the key highlights on the UN website.](https://www.un.org/development/desa/pd/sites/www.un.org.development.desa.pd/files/wpp2022_key_messages.pdf)

[Details about the methodology]( https://population.un.org/wpp/Publications/Files/WPP2022_Methodology.pdf)

## About the R package

Although all the WPP data can be accessed from the [UN website](https://population.un.org/wpp), the wpp2022 R package provides an easy way to access the main demographic indicators, including projection uncertainty. Unlike the previous **wpp** packages available on CRAN, this revision includes annual and 1-year age group (1x1) data . This makes the size of the package too big for a CRAN release, and thus it will be accessible from GitHub, for now. 

Five-year datasets are also included. These are not official UN datasets, but were provided by Patrick Gerland. 

[Shiny interface to the 5-year data](https://bayespop.shinyapps.io/wpp2022explorer/)

#### Data copyright

2022 United Nations, DESA, Population Division. Licensed under [Creative Commons license CC BY 3.0 IGO](http://creativecommons.org/licenses/by/3.0/igo).
Source: United Nations, DESA, Population Division. [World Population Prospects 2022](http://population.un.org/wpp/).

#### Acknowledments

The work of the package maintainer is supported by the Eunice Kennedy Shriver National Institute of Child Health and Human Development (NICHD) under grant number R01 HD-070936, and the BayesPop research group at the University of Washington.



## Installation and usage

As with any GitHub R package, you can install it using the **devtools** package. In addition, as the package is quite big you might need to increase the timeout for the download:

```
library(devtools)
options(timeout = 600)
install_github("PPgp/wpp2022")
```


All datasets described below can be accessed via the function `data()`, e.g. 

```
data(pop1dt)
pop1dt
```

Help files are available to give more details about the datasets. Simply type e.g. `?pop1dt`

## Dataset format


Previous **wpp** packages provide datasets in a wide format, where countries and ages are in rows and years correspond to columns. In this revision, most datasets are stored in a long format (countries, ages and time correspond to rows and indicators correspond to columns). However, to keep consistency and not to break any package dependencies, we offer the wide format as well. Note that many of these datasets are created on the fly using the stored long format. 
 
Thus, most indicators in the package are included in four versions (with the corresponding suffix in parentheses): 

1. Long format annual (`1dt`)
2. Long format 5-years (`5dt`)
3. Wide format annual (`1`)
4. Wide format 5-years (`5`, sometimes without any number)

We used the **data.table** package for the long format data, while wide datasets are returned as `data.frame`. 

In the following sections we summarize the main indicators. We only list the one-year datasets; for 5-year data, replace the number 1 in their names with 5. For example, `pop1dt` becomes `pop5dt`.

## Population datasets

**_Caution_:** All annual population datasets are considered to depict population to December 31 of each year. This is different from the official WPP release, which treats population at January 1. Thus, the population numbers in this package are shifted by one year when compared to the official UN data. E.g., population in year 2050 in the R package corresponds to 2051 in UN data. Vital rates and counts at time t refer to the calendar year t, so that they yield population at time t in this R package.

The 5-year datasets are created so that vital rates observed/projected from January 1 of year t to December 31 of year t+4 correspond to population at January 1 of year t+5. E.g. population in 2055 in a 5x5 dataset corresponds to vital rates/counts aggregated over 2050.0-2054.99. Since the 5x5 population is considered to January 1st, it corresponds to the year t-1 in the annual 1x1 dataset, but matches the timing of the UN-published population. 

All values are in thousands.

### Historical estimates

Data from 1949 to 2021.

* Long format:
    * age-specific:
        * `popAge1dt`: columns _popM_ (male), _popF_ (female), _pop_ (total)
    * totals across ages: 
    	 * `pop1dt`: columns _popM_ (male), _popF_ (female), _pop_ (total)
* Wide format: 
	* age-specific: 
		* `popF1` (female), `popM1` (male), `popB1` (total)
	* totals by sex: 
		* `popFT1` (female), `popMT1` (male)
   * totals across sex and age: `pop1`

    	 

### Projections

Data from 2022 to 2100.

 * Long format:
    * age-specific:
        * `popprojAge1dt`: columns _popM_ (median male), _popF_ (median female), _pop_ (median total), _*\_low_, _*\_high_ (-+ 1/2 child variants)
    * totals across ages: 
    	 * `popproj1dt`: columns _popM_ (median male), _popF_ (median female), _pop_ (median total), _*\_80l_, _*\_80u_ (80% lower and upper bounds), _*\_95l_, _*\_95u_ (95% lower and upper bounds), _*\_low_, _*\_high_ (-+ 1/2 child variants)
* Wide format: 
	* age-specific: 
		* `popFprojMed1` (median female), `popMprojMed1` (median male), `popBprojMed1` (median total)
   * totals across sex and age: 
   		* `popproj1` (median total), `popprojHigh1`, `popprojLow1` (-+ 1/2 child variants)
   		* Various 5-year legacy datasets available, e.g. `popproj80l` and `popproj80u`.

## Fertility datasets

### Total fertility rate
* **Historical estimates**: `tfr1dt` (long), `tfr1` (wide) 
* **Projections**:
	* Long format: 
		* `tfrproj1dt` (median, lower and upper bounds of the 80 and 90% probability intervals and +-1/2 child variants)
	* Wide format: 
		* `tfrprojMed1` (median), `tfrprojLow1`, `tfrprojHigh1` (-+1/2 child variants)
	* Various 5-year legacy datasets available, e.g. `tfrproj80l` and `tfrproj80u`.
* **Pre-1950 estimates**: `tfr_supplemental` (5-year)

### Percent age-specific fertility rate
 
* **Historical estimates and projections**: `percentASFR1dt` (long), `percentASFR1` (wide)


## Mortality datasets

### Life expectancy at birth
#### Historical estimates
* Long format: 
	* `e01dt`: columns _e0M_ (male), _e0F_ (female), _e0B_ (combined sexes)
* Wide format:
	* `e0F1` (female), `e0M1` (male), `e0B1` (combined sexes)
	* Pre-1950 5-year: `e0M_supplemental`, `e0F_supplemental`

#### Projections
* Long format: 
	* `e0proj1dt`: columns _e0M_, _e0F_, _e0B_ (sex-specific median), _*\_80l_, _*\_80u_, _*\_95l_, _*\_95u_ (sex-specific lower and upper bounds of the 80 and 90% probabiltity intervals)
* Wide format:
	* `e0Fproj1`, `e0Mproj1`, `e0Bproj1` (sex-specific median)
	* Other 5-year legacy datasets available, e.g. `e0Mproj80l` etc.

### Mortality rates
These datasets contain age- and sex-specific historical estimates and projections (1950-2100) in one file.

* Long format: 
	* `mx1dt`: columns _mxM_ (male), _mxF_ (female)
* Wide format:
	* `mxF1` (female) `mxM1` (male) 

## Migration datasets
The package contains historical estimates and deterministic projection for total net migration counts (1950-2100) in 1000.

* `migration1dt` (long format), `migration1` (wide format) 

## Other datasets

### Sex ratio at birth
The sex ratio at birth is defined as the ratio of male to female. The datasets contain both, historical estimates as well as projections (1950-2100).

* `sexRatio1dt` (long format) `sexRatio1` (wide format)


### Births and deaths
Other indicators are available in the miscellaneous dataset, such as births- and deaths-related indicators. These are only available in the long format on the one-year scale. 

* `misc1dt` (historical estimates), `miscproj1dt` (projections). Both datasets contain the following columns:
	* _births_ : number of births in 1000
	* _cbr_ : number of live births per 1,000 population
	* _deaths_ : number of births in 1000
	* _cdr_ : number of deaths per 1,000 population
	* _growthrate_ : annual rate of population change (as %)
 
### Locations
The dataset on UN locations is stored in `UNlocations`. 
