all: data/shapefiles/cb_2018_us_county_20m/cb_2018_us_county_20m.shp

data/shapefiles/cb_2018_us_county_20m.zip:
	curl https://www2.census.gov/geo/tiger/GENZ2018/shp/cb_2018_us_county_20m.zip -o $@

data/shapefiles/cb_2018_us_county_20m/cb_2018_us_county_20m.shp: data/shapefiles/cb_2018_us_county_20m.zip
	unzip -d data/shapefiles/cb_2018_us_county_20m/ $<
