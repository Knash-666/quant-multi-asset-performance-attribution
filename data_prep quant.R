# ==============================================================================
# Project: Multivariate Time-Series & Regression Analysis of a Dynamic Portfolio
# Focus: Data Ingestion and Feature Engineering (Quant Multi Asset Allocation)
# ==============================================================================

# Install the required package (uncomment the line below if you haven't installed it yet)
# install.packages("readxl")
library(readxl)

# 1. ACQUIRING THE DATA ("Reading Data")
# Using the specific local path you provided. 
file_path <- "C:/Users/bedan/Downloads/NAV_2021-04-30_to_2026-04-25.xlsx"

cat("Importing historical NAV data from Excel...\n")
# We skip the first 4 rows to bypass the AMFI metadata and hit the actual column headers
nav_data <- read_excel(file_path, skip = 4)

# AMFI column names can be messy. Let's rename them so they match our code.
# Assuming the standard AMFI format where column 4 is NAV and column 5 is Date.
# (If your data looks different when you view it, we can adjust these index numbers)
colnames(nav_data)[which(names(nav_data) == "Net Asset Value")] <- "NAV"
colnames(nav_data)[which(names(nav_data) == "Date")] <- "Date"

# 2. DATA CLEANSING 
# Convert the 'Date' column from a string into an actual R Date object
# AMFI usually uses a "DD-MMM-YYYY" format (e.g., "25-Apr-2026")
nav_data$Date <- as.Date(nav_data$Date, format="%d-%b-%Y")

# Sort data chronologically (oldest to newest)
nav_data <- nav_data[order(nav_data$Date), ]

# Keep only the essential columns to keep our environment clean
nav_data <- nav_data[, c("Date", "NAV")]

# Handle Missing Values (market holidays)
nav_data <- na.omit(nav_data)

# Ensure NAV is treated as a numeric value (sometimes Excel imports it as text)
nav_data$NAV <- as.numeric(nav_data$NAV)

# 3. FEATURE ENGINEERING
cat("Calculating daily log returns...\n")
nav_data$Log_Return <- c(NA, diff(log(nav_data$NAV)))
nav_data <- na.omit(nav_data)

# Save for Quarto
saveRDS(nav_data, "cleaned_quant_data.rds")
cat("Data successfully cleaned and saved!\n")
