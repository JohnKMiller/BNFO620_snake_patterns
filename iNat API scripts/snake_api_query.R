install.packages("spocc")
library(spocc)

#function to Call database and parse info of name and image URL into csv
getPhotosINat <- function(snakeName,inatLimit = 100){
  #makes a df
  snakes.df <-data.frame()
  #query database
  inat.df <- occ(query = snakeName, from = "inat", limit = inatLimit, inatopts = list(quality = "research"),throw_warnings = FALSE)
  #find photos
  photoData.df <- inat.df$inat$data[[1]]$photos
  #collect all photos
  for (y in 1:length(photoData.df)){
      #get the values 
      New_row = list(toString(inat.df$inat$data[[1]]$name[[y]]),photoData.df[[y]]['url'],photoData.df[[y]]['id'])
      #append to df
      snakes.df <- rbind(snakes.df,New_row)
  }
  #update column names
  colnames(snakes.df) <- c('snake_name','url','id')
  return(snakes.df)
}

#testing tools
snake_photos <- getPhotosINat('Lampropeltis californiae')

