
# Install and load necessary packages if not already installed
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Load libraries
library(readxl)
library(ggplot2)

# Path to your Excel file
excel_file <- "path/to/your/excel/file.xlsx"

# Read the Excel file
data <- readxl::read_excel(excel_file)

# Assuming the column containing colors is named "Color", change it if necessary
color_column <- "Color"

# Create a histogram of color counts
ggplot(data, aes(x = !!sym(color_column))) +
  geom_bar(fill = "blue") +
  labs(title = "Histogram of Color Counts", x = "Color", y = "Count")
```

Replace `"path/to/your/excel/file.xlsx"` with the actual path to your Excel file and `"Color"` with the name of the column containing colors if it's different in your Excel file.

This code will create a histogram where each bar represents the count of a specific color in the specified column of your Excel file. You can customize the appearance of the histogram as needed.