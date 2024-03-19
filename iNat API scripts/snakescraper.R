source("~/Desktop/School/R code/snake_api_query.R")
library(readxl)

getPhotosINat <- function(snakeList) {
  for (i in seq_along(snakeList)) {
    # Pause execution for the specified delay time
    delay <- 2 
    Sys.sleep(delay)
  }
}

species_list <- read_excel("species_list.xlsx")

snakeList <- list(species_list$Species)

getPhotosINat(snakeList)


