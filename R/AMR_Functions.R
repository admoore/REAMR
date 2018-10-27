
require(googleway)
require(tidycensus)
require(rgdal)
require(dplyr)
require(rjson)

maps_zipcode_CA<-function(latitude,longitude){
  location<-c(latitude,longitude)
  output<-google_reverse_geocode(location,key='AIzaSyDR7sy8vUWJyCLl2aO11g_Ed7Ucai3yjms')
  string<-output$results$formatted_address[2]
  substr(string, regexpr(" CA ",string)[1]+4,stop=regexpr(" CA ",string)[1]+4+4)
}

maps_address<-function(latitude,longitude){
  location<-c(latitude,longitude)
  output<-google_reverse_geocode(location,key='AIzaSyDR7sy8vUWJyCLl2aO11g_Ed7Ucai3yjms')
  string<-output$results$formatted_address[1]
  string
}

census_tract<-function(latitude,longitude){
  json_file<-paste("https://geocoding.geo.census.gov/geocoder/geographies/coordinates?x=",longitude,"&y=",latitude,"&benchmark=4&vintage=4&format=json", sep="")
  json_data <- fromJSON(paste(readLines(json_file), collapse=""))
  json_data$result$geographies$`Census Tracts`[[1]]$TRACT
}

census_GEOID<-function(latitude,longitude){
  json_file<-paste("https://geocoding.geo.census.gov/geocoder/geographies/coordinates?x=",longitude,"&y=",latitude,"&benchmark=4&vintage=4&format=json", sep="")
  json_data <- fromJSON(paste(readLines(json_file), collapse=""))
  json_data$result$geographies$`Census Tracts`[[1]]$GEOID
  #This function returs...
}


