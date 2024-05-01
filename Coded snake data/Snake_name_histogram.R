# Load required libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(scales)

# Read the Excel file
excel_data <- read_excel("~/Desktop/620 project/snakes_filtered.xlsx")

# Column name containing the snake information
column_name <- "FilterNameColumn" # Replace 'your_column_name' with the actual column name containing the snake information

# Count occurrences of each unique value in the specified column
value_counts <- table(excel_data[[column_name]])

# Convert the result to a data frame
value_counts_df <- data.frame(value = names(value_counts),
                              count = as.numeric(value_counts),
                              stringsAsFactors = FALSE)


print(value_counts_df)


# Split the data into chunks of size 50
chunks <- split(value_counts_df, ceiling(seq_along(value_counts_df$value) / 50))

# Create a directory to save the plots
dir.create("plots", showWarnings = FALSE)

# Plotting each chunk and saving to the plots folder
for (i in seq_along(chunks)) {
  chunk <- chunks[[i]]
  plot <- ggplot(chunk, aes(x = value, y = count)) +
    geom_col() +
    scale_x_discrete(labels = label_wrap(10)) +
    scale_y_continuous(labels = comma) +
    geom_bar(stat = "identity", fill = "skyblue") +
    labs(title = paste("Bar Chart of Value Counts (Chunk", i, ")", sep = " "), x = "Snakes", y = "Count of pictures") +
    theme_minimal() 
  
  # Save the plot as an image in the plots folder
  ggsave(filename = paste0("plots/plot_chunk_", i, ".png"), plot = plot, width = 10, height = 6)
}
