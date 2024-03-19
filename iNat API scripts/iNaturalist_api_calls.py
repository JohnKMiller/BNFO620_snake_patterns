import requests 
import pandas as pd
import time
# Take input of file name and desired output type
#import file of snake names and form them into a query statement

# Take input of file name and desired output type
snake_data = pd.read_csv("inputfile.csv") # assuming your file is in CSV format
snake_names = snake_data.Species
format_names = []

# Initialize a list to store tuples of species name and photo URL
species_photos = []

# Going through the CSV and formatting them into a string to make an API call
for i in snake_names:
    format_names.append(i + '&')

format_names_no_end = ''.join(format_names[:-1])  # Using join to concatenate list of strings

# Make query for taxon names
query = "observations?taxon_name=%s" % (format_names_no_end)

endpoint = "https://api.inaturalist.org/v1/"

for name in snake_names: # Loop through each snake name
    current_query = "observations?taxon_name=" + name
    response = requests.get(endpoint + current_query)
    data = response.json()

    if 'results' in data: # Check if there are any results
        for result in data['results']:
            if 'photos' in result and result['photos']: # Check if photos exist for the current result
                species_photos.append((name, result['photos'][0]['url'])) # Append the tuple (species name, photo URL) to the list

    time.sleep(2) # Introduce a delay of 2 seconds between API calls

# Convert the list of tuples to a DataFrame
photo_data = pd.DataFrame(species_photos, columns=['Species', 'Photo URL'])

# Export to desired format
#photo_data.to_csv('exportfile', header=False, index=False)



#&Lampropeltis-elapsoides



