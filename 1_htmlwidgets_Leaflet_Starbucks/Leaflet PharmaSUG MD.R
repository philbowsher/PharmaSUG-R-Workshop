download.file("https://opendata.socrata.com/api/views/ddym-zvjk/rows.csv?accessType=DOWNLOAD",destfile="data.csv")

starbucks1 <- read.csv("data.csv")

View(starbucks1)

starbucks <- starbucks1[ which(starbucks1$State=='MD' 
                               & starbucks1$Country== 'US'), ]

View(starbucks)

library("leaflet") 

leaflet() %>% addTiles() %>% setView(-76.621384, 39.286072, zoom = 14) %>% 
  
  addMarkers(data = starbucks, lat = ~ Latitude, lng = ~ Longitude, popup = starbucks$Name)
