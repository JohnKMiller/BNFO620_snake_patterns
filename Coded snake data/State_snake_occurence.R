
# Load necessary packages
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

# Load library
library(tidyverse)
library(ggplot2)
library(ggpmisc)

# Path to your CSV file
csv_file <- "/Users/kylestoecker/Desktop/620 project/snake_similarities.csv"

# Read the CSV file
data <- read.csv(csv_file)

# Assuming your CSV has a column named "State", change it if necessary
state_column <- "Matched_Locations"

# List of US states
us_states <- c(
  "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
  "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho",
  "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
  "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
  "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
  "New Hampshire", "New Jersey", "New Mexico", "New York",
  "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
  "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
  "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
  "West Virginia", "Wisconsin", "Wyoming"
)

# Split the comma-separated values in the State column
data <- data %>%
  separate_rows(Matched_Locations, sep = ", ") %>%
  filter(Matched_Locations %in% us_states)  # Keep only US states


# Create a histogram of state occurrences
ggplot(data, aes(x = Matched_Locations)) +
  geom_bar(fill = "black") +
  labs(title = "Species by US States", x = "State", y = "Number Species") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
                                   panel.border = element_rect(fill='transparent'),
                                   panel.grid.major = element_blank(),
                                   panel.grid.minor = element_blank(),
                                   panel.background = element_rect(fill='transparent'), #transparent panel bg
                                   plot.background = element_rect(fill='transparent', color=NA),
                                   legend.background = element_rect(fill='transparent'), #transparent legend bg
                                   legend.box.background = element_rect(fill='transparent')
        
        ) +
    scale_y_continuous(breaks = seq(0,80,by = 10))



        