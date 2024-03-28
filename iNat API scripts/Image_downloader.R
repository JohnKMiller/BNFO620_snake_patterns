library(tidyverse)
library(readxl)
library(dplyr) 

#read in list
toget.df <- read_excel("rawphotos.xlsx")
## vector column removal
bad.ls <- c()
for (i in 1:nrow(toget.df)){
  if( grepl(',',toget.df[i,]$id, fixed = T) == T){
      bad.ls <- append(bad.ls, i)
  }
}
vectorsgone.df <- toget.df[-c(bad.ls),]

#get ten random for each species
snake.ls <- unique(vectorsgone.df$Species)
randomsnakes.df <- data.frame()
for (i in snake.ls){
  rowholder.ls <- which(vectorsgone.df$Species == i)
  rowholder.df <-vectorsgone.df[rowholder.ls,]
  randomholder.df <- sample_n(rowholder.df,replace = T, 5)
  randomsnakes.df <- rbind(randomsnakes.df,randomholder.df)
}

#downloading URLS
for (i in 1:nrow(randomsnakes.df)){
  filename.st <- (sub(" ", "_", paste(randomsnakes.df[i,]$Species,randomsnakes.df[i,]$id,'.jpeg',sep = "")))
  fileURL.st <- sub("square","original",randomsnakes.df[i,]$url)
  filePath.st <- 'C:/projects/snake_project/SnakePhotosDownloadedJohn/'
  download.file(fileURL.st, paste(filePath.st, filename.st, sep = ""), mode = "wb")
}

for (i in 1:nrow(randomsnakes.df)){
filename.st <- (sub(" ", "_", paste(randomsnakes.df[i,]$Species,randomsnakes.df[i,]$id,'.jpeg',sep = "")))
fileURL.st <- sub("square","original",randomsnakes.df[i,]$url)
filePath.st <- 'C:/projects/snake_project/SnakePhotosTest1/'
download.file(fileURL.st, paste(filePath.st, filename.st, sep = ""), mode = "wb")
}

  
