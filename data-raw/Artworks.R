# load artworks from MoMA csv
# TODO []: load from URL instead of local file for easier updates

# raw <- read.csv("~/Source/since1968/MoMA/data-raw/Artworks.csv", header = TRUE, stringsAsFactors = FALSE)

# artworks(raw) <- c("Title", "Artist", "ArtistBio", "Date", "Medium", "Dimensions", "CreditLine", "MoMANumber", "Classification", "Department", "DateAcquired", "CuratorApproved", "ObjectID", "URL")


library(dplyr)
csv <- "~/Source/since1968/MoMA/data-raw/Artworks.csv"
target <- "~/Source/since1968/MoMA/data/artworks.Rdata"
artworks <- read.csv(csv, header = TRUE, stringsAsFactors = FALSE)
save(artworks, file=target)