# load artworks from MoMA csv
# TODO []: load from URL instead of local file for easier updates

library(dplyr)
csv <- "data-raw/Artworks.csv"
target <- "data/artworks.Rdata"
artworks <- read.csv(csv, header = TRUE, stringsAsFactors = FALSE)
save(artworks, file=target)
