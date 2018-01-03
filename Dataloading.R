


if (!file.exists("./db/PowerConsumption.csv")) {
  # Read the db to a db frame
  db <- read.table("./db/household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
  attach(db)
  db <- db[(Date == "1/2/2007" | Date == "2/2/2007"), ]
  attach(db)
  db$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  rownames(db) <- 1 : nrow(db)
  attach(db)
  db <- cbind(db[, 10], db[, 3:9])
  colname <- colnames(db)
  colname[1] <- "Date_time"
  colnames(db) <- colname
  attach(db)
  write.csv(db, file = "./db/PowerConsumption.csv", row.names = FALSE)
} else {
  # Read the db to a db frame
  db <- read.csv(file = "./db/PowerConsumption.csv", header = TRUE)
  
  attach(db)
}
