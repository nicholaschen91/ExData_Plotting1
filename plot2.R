#assumes data file is saved as "household_power_consumption.txt" in the working directory
#assumes sqldf package is installed

file <- "household_power_consumption.txt"

#subset data from file
require("sqldf")
subsetData <- read.csv.sql(file, sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR DATE = '2/2/2007'", header = TRUE, sep = ";")

#convert Date and Time entries from character variable to POSIXlt and POSIXt variables 
subsetData$newTime <- paste(subsetData$Date, subsetData$Time)
subsetData$newTime <- strptime(subsetData$newTime, format = "%d/%m/%Y %H:%M:%S")

#plot graph
with(subsetData, plot(newTime , Global_active_power, type = "l", 
                      xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab=0.8, cex.axis=0.8))

dev.copy(png, file = "plot2.png")
dev.off()

