# load artworks from MoMA csv

library(dplyr)
library(RCurl) # needed to grab data via https

download.file("https://raw.githubusercontent.com/MuseumofModernArt/collection/master/Artworks.csv", destfile = "data-raw/Artworks.csv", method = "curl")
csv <- "data-raw/Artworks.csv"
target <- "data/artworks.Rdata"
artworks <- read.csv(csv, header = TRUE, stringsAsFactors = FALSE)
save(artworks, file=target)
