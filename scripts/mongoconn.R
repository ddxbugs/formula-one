install.packages("mongolite")
install.packages("readr")

# Load necessary libraries
library(mongolite)
library(readr)

# Define MongoDB connection parameters
mongo_url <- "mongodb+srv://<user_name>:<password>@cluster0.j0bowan.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

db_name <- "F1Database"

# Establish connection to MongoDB
drivers_collection <- mongo(collection = "drivers", db = db_name, url = mongo_url)
# races_collection <- mongo(collection = "races", db = db_name, url = mongo_url)
# results_collection <- mongo(collection = "results", db = db_name, url = mongo_url)

result <- collection$find('drivers')  # '{}' selects all documents
# 
# # Define the path to your CSV files
# csv_path <- "path_to_your_csv_files"
# 
# # Read the CSV files into data frames
# drivers <- read_csv(file.path(csv_path, "drivers.csv"))
# races <- read_csv(file.path(csv_path, "races.csv"))
# results <- read_csv(file.path(csv_path, "results.csv"))
# 
# # Insert data into MongoDB collections
# drivers_collection$insert(drivers)
# races_collection$insert(races)
# results_collection$insert(results)

# Verify that the data has been inserted
print(drivers_collection$count())
# print(races_collection$count())
# print(results_collection$count())

# Optional: Display the first few documents of each collection
print(drivers_collection$find(limit = 5))
# print(races_collection$find(limit = 5))
# print(results_collection$find(limit = 5))
