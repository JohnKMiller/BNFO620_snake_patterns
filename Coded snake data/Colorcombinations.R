library(ggplot2)
library(readxl)

# Read the Excel file containing color combinations
data <- read_excel("C:/Users/kyler/OneDrive/Desktop/BNFO620/R_files/CombinedColorCodingData2024.xlsx")

# Initialize lists to store number of colors in each combination
colors_column <- data$color

# Initialize lists to store number of colors in each combination
num_colors <- numeric()
color_counts <- list()

# Iterate through each row of the data frame
for (row in 1:length(colors_column)) {
  # Split the color combinations into individual colors
  colors <- unlist(strsplit(as.character(colors_column[row]), " "))
  
  # Determine the number of colors in the combination and store
  num_colors[row] <- length(colors)
  
  # Update color counts
  for (color in colors) {
    if (is.null(color_counts[[color]])) {
      color_counts[[color]] <- 1
    } else {
      color_counts[[color]] <- color_counts[[color]] + 1
    }
  }
}

# Count the frequency of color combinations with 1, 2, or 3 colors
num_1_color <- sum(num_colors == 1)
num_2_colors <- sum(num_colors == 2)
num_3_colors <- sum(num_colors == 3)

# Create a data frame with number of colors
color_data <- data.frame(num_colors)

# Create histogram using ggplot2
ggplot(color_data, aes(x = num_colors)) +
  geom_bar( fill = "black", color = "black") +
  labs(title = "Distribution of Color Combinations by Number of Colors",
       x = "Number of Colors",
       y = "Frequency of Occurence") +
  geom_text(aes(label = paste("1 color:", num_1_color, "\n2 colors:", num_2_colors, "\n3 colors:", num_3_colors)), 
            x = 4, y = max(table(num_colors)) / 2, size = 5) +
  theme(axis.text.x = element_text(angle = 0, hjust = 1),
        panel.border = element_rect(fill='transparent'),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill='transparent'), #transparent panel bg
        plot.background = element_rect(fill='transparent', color=NA),
        legend.background = element_rect(fill='transparent'), #transparent legend bg
        legend.box.background = element_rect(fill='transparent')
        
  )


