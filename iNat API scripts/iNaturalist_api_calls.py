import requests 
import pandas as pd

#take input of file name and desired output type 


#"import file of snake names and form them into a query statement
snake_data = pd.read_csv("tempfile.csv")
snake_names = snake_data.species
format_names = ""

# going through the csv and formatting them into a string to make an api call
for i in snake_names:
    format_names.append(i + '&')
# remove & at end of string
format_names_no_end = format_names[0: (len(format_names)-1)]
# make query for taxon names
query = "observations?taxon_name=%s" % (format_names_no_end)

test_query = "observations?taxon_name=Lampropeltis-californiae"
# call api
endpoint = "https://api.inaturalist.org/v1/"
response = requests.get(endpoint + test_query)
data = response.json()

# make list of photos
photo_list = []
photo_dict= {}

x = 0
while x < len(data['results']):
    pic = data['results'][x]['photos']
    photo_list.append(pic[0]['url'])
    photo_dict.update()
    x = x+1
print(len(photo_list))
print(len(data['results']))
# put photo urls and names into dataframe
photo_data = pd.DataFrame(photo_list)
photo_data.to_excel('temp_output.xlsx', header=False, index=False)

# export to desired format

#&Lampropeltis-elapsoides



