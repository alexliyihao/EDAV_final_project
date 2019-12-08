library(tidyverse)
data = read.delim("listings.csv",sep = ",")
data_cleaned = data[-c(1:39,42:48,51,60,62:63,68:77,82:86,94:98,100,101,103:105)]
data_cleaned[,1] = as.character(data_cleaned[,1])
data_cleaned[,13] = as.numeric(gsub("\\$", "", as.character(data_cleaned[,13])))
data_cleaned[,14] = as.numeric(gsub("\\$", "", as.character(data_cleaned[,14])))
data_cleaned[,15] = as.numeric(gsub("\\$", "", as.character(data_cleaned[,15])))
data_cleaned[,17] = as.numeric(gsub("\\$", "", as.character(data_cleaned[,17])))
write.csv(data_cleaned,'cleaned_nyc_data.csv', row.names=FALSE)

URL <- "http://services5.arcgis.com/GfwWNkhOj9bNBqoJ/arcgis/rest/services/nycd/FeatureServer/0/query?where=1=1&outFields=*&outSR=4326&f=geojson"
fil <- "nyc_community_districts.geojson"

if (!file.exists(fil)) download.file(URL, fil)
