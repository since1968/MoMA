library(dplyr)
library(RCurl) # needed to grab data via https
library(stringr)
library(ggplot2)

download.file("https://raw.githubusercontent.com/MuseumofModernArt/collection/master/Artworks.csv", destfile = "data-raw/Artworks.csv", method = "curl")
csv <- "data-raw/Artworks.csv"
target <- "data/artworks.Rdata"
artworks <- read.csv(csv, header = TRUE, stringsAsFactors = FALSE)

artworks$DateAcquired = as.Date(artworks$DateAcquired) #
artworks = artworks[!is.na(artworks$DateAcquired), ]

artworks$Date = str_extract(artworks$Date, "[0-9]{4}")
artworks = artworks[!is.na(artworks$Date), ]

artworks$Date = paste0(artworks$Date, "-01-01") # sorry for the hack Marc!
artworks$Date = as.Date(artworks$Date)

ggplot(artworks, aes(Date, DateAcquired)) + geom_point(alpha=.10)

?save
save(artworks, file = target)
load("data/artworks.Rdata")

# data(artworks) # for packages
