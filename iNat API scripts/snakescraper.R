source("filepath") #source of the other R file with the function 
library(readxl) #read in the excel file
library(writexl)
library(spocc)


looper <- function(specieslist) {
  delay <- 2  # Define delay time outside the loop
  
  photosPlease <- getPhotosINat(specieslist)  # Assuming getPhotosINat() returns a dataframe
  
  # Pause execution for the specified delay time
  Sys.sleep(delay)  
  
  # Write the dataframe to an Excel file
  return(photosPlease)
}

# Usage:
species_df <- read_excel("species_list.xlsx") 
output_file <- "rawphotos.xlsx"  # Define output file name
specieslist <- species_df$Species
writexl::write_xlsx(looper(specieslist),output_file)
