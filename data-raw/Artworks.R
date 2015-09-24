# load artworks from MoMA csv

library(dplyr)
library(RCurl) # needed to grab data via https

download.file("https://raw.githubusercontent.com/MuseumofModernArt/collection/master/Artworks.csv", destfile = "data-raw/Artworks.csv", method = "curl")
csv <- "data-raw/Artworks.csv"
target <- "data/artworks.RData"
artworks <- read.csv(csv, header = TRUE, stringsAsFactors = FALSE)
save(artworks, file=target)

# convert DateAcquired from a character to a proper Date
?class
class(artworks$DateAcquired) # character
artworks$DateAcquired = as.Date(artworks$DateAcquired)
class(artworks$DateAcquired) # date

# remove the na values
any(is.na(artworks$DateAcquired)) # TRUE
nrow(artworks) # 120255
artworks = artworks[!is.na(artworks$DateAcquired), ]
nrow(artworks) # 115878


#nrow(artworks) # 123919
#artworks = artworks[artworks$Date != "Unknown", ]
#nrow(artworks) # 123630

# convert Date column (date painted) to a proper date
# step 1: extract a 4 digit year if present
library(stringr)
?str_extract
artworks$Date = str_extract(artworks$Date, "[0-9]{4}")

# step 2: remove na values
nrow(artworks) # 123919
artworks = artworks[!is.na(artworks$Date), ]
nrow(artworks) # 120255

# step 3: add fake year and month and then extract to a "Date"
artworks$Date = paste0(artworks$Date, "-01-01") # sorry for the hack Marc!
head(artworks$Date)
artworks$Date = as.Date(artworks$Date)

# for later: perhaps try lubridate for anon-hack solution
install.packages("lubridate")
library(lubridate)

# now graph as scatterplot with ggplot2
library(ggplot2)
nrow(artworks)
ggplot(artworks, aes(Date, DateAcquired)) + geom_point(alpha=.25)



# what's the oldest painting?
head(artworks[order(artworks$Date),])
)

save(artworks, file=target)


# subscripting in R is wierd
# http://www.johndcook.com/blog/2008/10/23/five-kinds-of-r-language-subscripts/
x = c(1,2,3,4,5)
x
x > 3
x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
x[x > 3]

?is.na


