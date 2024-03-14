library(tidyverse)
library(readxl)
#read in snake list as list
species.df <- read_excel("species list.xlsx")
species.list <- as.list(species.excel$Species)
#read in photo list
photos.df <- read_excel("531_snake_photos_RDB_.xlsx")
photos.list <- as.list(photos.df$`snake photos list`)
#make dataframe
snakeInfo.df <-  array()
#loop through species/subspecies
for (x in species.df$Species){
  #reformat species names
  names.list <- strsplit(x," ")
  #make strings
  current.list <- list(name = x,0)
  matchedItems.list <-  list()
  #loop through list of images
  for(y in photos.list){
    # check for match
    if (agrepl(y,x, fixed = T,max.distance = 8) == TRUE){
      # iterate variable
      current.list[[2]] <- (current.list[[2]] + 1)
      # add name to entry
      current.list <- append(current.list, y)
      # save entry as matched
      matchedItems.list <- append(matchedItems.list,nrow(y))
    }
  }
  # bind list to data frame
  snakeInfo.df <- append(snakeInfo.df,current.list)
  #drop all matched entrys
  #species.df <-species.df[-c(matchedItems.list)]
}
# get df with r(species name, number of photos, photo1 ...)
# get list of species with no pictures
# get list of pictures with no species

