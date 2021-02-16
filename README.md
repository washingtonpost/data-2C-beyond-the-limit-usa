# Climate change in the contiguous United States

This repository contains analysis code and data supporting The Washington Post's series, "2ºC: Beyond the Limit." The following stories draw from this analysis:

- ["Extreme climate change has arrived in America,"](https://www.washingtonpost.com/graphics/2019/national/climate-environment/climate-change-america/) published August 13, 2019
- ["Fires, floods and free parking: California’s unending fight against climate change,"](https://www.washingtonpost.com/graphics/2019/national/climate-environment/climate-change-california/) published December 5, 2019
- ["In fast-warming Minnesota, scientists are trying to plant the forests of the future,"](https://www.washingtonpost.com/graphics/2020/climate-solutions/climate-change-minnesota/) published April 29, 2020
- ["This giant climate hot spot is robbing the West of its water,"](https://www.washingtonpost.com/graphics/2020/national/climate-environment/climate-change-colorado-utah-hot-spot/) published August 7, 2020

Note that the first two stories, published in 2019, used an earlier version of this analysis that ran through 2018.

## About our analysis

To analyze warming temperatures in the United States, The Washington Post used the National Oceanic and Atmospheric Administration’s Climate Divisional Database (nClimDiv) and Gridded 5km GHCN-Daily Temperature and Precipitation Dataset (nClimGrid) data sets, which provide monthly temperature data between 1895 and 2019 for the Lower 48 states. We calculated annual mean temperature trends in each state and county in the Lower 48 using linear regression — analyzing both annual average temperatures and temperatures for the three-month winter season (December, January and February).

## How to use the data

We are offering several data files that are the product of our analysis of climate change in the contiguous United States from 1895-2019. When publishing a story, graphic or other work based on this data set, please credit The Washington Post, link to this repository and [send us an email](mailto:2c-data@washpost.com) so that we can track the ways in which this data is used.

Annual average temperatures the Lower 48 [`/data/processed/climdiv_national_year.csv`](https://raw.githubusercontent.com/washingtonpost/data-2C-beyond-the-limit-usa/main/data/processed/climdiv_national_year.csv), each state [`/data/processed/climdiv_state_year.csv`](https://raw.githubusercontent.com/washingtonpost/data-2C-beyond-the-limit-usa/main/data/processed/climdiv_state_year.csv) and county [`/data/processed/climdiv_county_year.csv`](https://raw.githubusercontent.com/washingtonpost/data-2C-beyond-the-limit-usa/main/data/processed/climdiv_county_year.csv). The code to produce this file can be found in `/analysis/process_nclimdiv.Rmd`. Each row has the following variables:

- `year`
- `fips` A two digit fips code in the state file and a five digit code in the county file, not present in the national file
- `temp` The average annual temperature in Fahrenheit
- `tempc` The average annual temperature in Celsius

Temperature change estimates for each of the Lower 48 states   [`/data/processed/model_state.csv`](https://github.com/washingtonpost/data-2C-beyond-the-limit-usa/raw/main/data/processed/model_state.csv). The code to produce this file is found in `/analysis/model_temperature_change.Rmd`. Each row has the following variables

- `fips` A two digit fips code for the state
- `STATE_NAME` the state name
- `Annual` Estimate of annual average temperature change in Celsius for the state, 1895-2019
- `Fall` temperature change in September, October and November
- `Spring` temperature change in March, April and May
- `Summer` temperature change in June, July and August
- `Winter` temperature change in December and the following January and February
- `max_warming_season` the season where temperatures are increasing fastest

Temperature change estimates for counties in the contiguous U.S. can be found in [`/data/processed/model_county.csv`](https://github.com/washingtonpost/data-2C-beyond-the-limit-usa/raw/main/data/processed/model_county.csv). The code to produce this file is found in `/analysis/model_temperature_change.Rmd`.  Each row has the following variables

- `fips` A five digit fips code for the county
- `CTYNAME` the name of the county
- `STNAME` the name of the state
- `Annual` Estimate of annual average temperature change in Celsius for the county, 1895-2019
- `Fall` temperature change in September, October and November
- `Spring` temperature change in March, April and May
- `Summer` temperature change in June, July and August
- `Winter` temperature change in December and the following January and February
- `max_warming_season` the season where temperatures are increasing fastest

County temperature change data joined to a shapefile in GeoJSON format [`/data/processed/model_county.geojson`](https://github.com/washingtonpost/data-2C-beyond-the-limit-usa/raw/main/data/processed/model_county.geojson). The code to produce this file is found in `/analysis/model_temperature_change.Rmd`.

Gridded emperature change data for the contiguous U.S. in GeoTiff format [`/data/processed/nclimgrid_slopes_1895_2019.tif`](https://github.com/washingtonpost/data-2C-beyond-the-limit-usa/raw/main/data/processed/nclimgrid_slopes_1895_2019.tif). The code to produce this file is found in `/analysis/analyze_nclimgrid.Rmd`.

## Reproducing the Post's analysis

We have included code that can be used to reproduce our analysis in the following [RMarkdown notebooks](https://rmarkdown.rstudio.com/):

1. [Processing nClimDiv data](https://washingtonpost.github.io/data-2C-beyond-the-limit-usa/analysis/process_nclimdiv.html)
2. [Modeling temperature change](https://washingtonpost.github.io/data-2C-beyond-the-limit-usa/analysis/model_temperature_change.html)
3. [Analyzing nClimGrid raster data](https://washingtonpost.github.io/data-2C-beyond-the-limit-usa/analysis/analyze_nclimgrid.html)

These files were generated using R version 3.5.1 and the following packages: `tidyverse`, `sf`, `raster`, `scales`.

## Licensing

All code in this repository is available under the [MIT License](https://opensource.org/licenses/MIT). Files in the `data/processed/` directory are available under the [Creative Commons Attribution 4.0 International (CC BY 4.0) license](https://creativecommons.org/licenses/by/4.0/).

## Contact

Contact 2c-data@washpost.com with any questions about this repository.
