# install.packages("RMySQL")
# install.packages("readr")
# install.packages("dplyr")

library(RMySQL)
library(readr)
library(dplyr)

# Define MySQL connection parameters
host<-"localhost"
user<-"root"
password<-"password"
dbname<-"formula_one"

# Establish connection to MySQL
con<-dbConnect(MySQL(),
               host=host,
               user=user,
               password=password,
               dbname=dbname,
               client.flag = CLIENT_LOCAL_FILES)
getwd()
# Define the path to CSV files
csv_path<-"data"
# lap_times<-read_csv(file.path(csv_path,"lap_times.csv"))
# results<-read_csv(file.path(csv_path,"results.csv"))
# driver_standings<-read_csv(file.path(csv_path,"driver_standings.csv"))
# qualifying<-read_csv(file.path(csv_path,"qualifying.csv"))
# pit_stops<-read_csv(file.path(csv_path,"pit_stops.csv"))
# constructor_standings<-read_csv(file.path(csv_path,"constructor_standings.csv"))
# constructor_results<-read_csv(file.path(csv_path,"constructor_results.csv"))
# races<-read_csv(file.path(csv_path,"races.csv"))
# drivers<-read_csv(file.path(csv_path,"drivers.csv"))
# sprint_results<-read_csv(file.path(csv_path,"sprint_results.csv"))
# constructors<-read_csv(file.path(csv_path,"constructors.csv"))
# circuits<-read_csv(file.path(csv_path,"circuits.csv"))
# seasons<-read_csv(file.path(csv_path,"seasons.csv"))
status<-read_csv(file.path(csv_path,"status.csv"))



# Create tables in MySQL and insert the data
# dbWriteTable(con, "lap_times", lap_times, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "results", results, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "driver_standings", driver_standings, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "qualifying", qualifying, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "pit_stops", pit_stops, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "constructor_standings", constructor_standings, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "constructor_results", constructor_results, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "races", races, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "drivers", drivers, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "sprint_results", sprint_results, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "constructors", constructors, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "circuits", circuits, overwrite = TRUE, row.names = FALSE)
# dbWriteTable(con, "seasons", seasons, overwrite = TRUE, row.names = FALSE)
dbWriteTable(con, "status", status, overwrite = TRUE, row.names = FALSE)

# Query the database current time
result <- dbGetQuery(con, "SELECT * FROM status")
result

# Verify that the data has been inserted
dbListTables(con)
# Close the connection
dbDisconnect(con)