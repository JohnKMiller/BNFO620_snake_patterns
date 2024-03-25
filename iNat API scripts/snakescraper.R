source("filepath") #source of the other R file with the function 
library(readxl) #read in the excel file
library(openxlsx)
library(spocc)
library(dplyr)

looper <- function(specieslist) {
  delay <- 2  # Define delay time outside the loop
  result <- list()  # Initialize an empty list to store results
  
  for (species in specieslist) {
    
    # Pause execution for the specified delay time
    Sys.sleep(delay)  
    
    # Assuming getPhotosINat() returns a dataframe for each species
    photosPlease <- getPhotosINat(species)
    
    # Store the dataframe in the result list
    result[[species]] <- photosPlease
  }
  
  # Combine all dataframes into a single dataframe (assuming photosPlease is a list of dataframes)
  result_df <- bind_rows(result, .id = "Species")
  
  return(result_df)
}

# Usage:
species_df <- read_excel("input.xlsx") #This is your input file
output_file <- "output.xlsx"  # Define output file name
specieslist <- species_df$Species #List of snakes from the excel file
write.xlsx(looper(specieslist), output_file) #This outputs to the named output file assigned and calls the 'looper' function 
