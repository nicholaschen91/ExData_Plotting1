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

png("plot3.png")

with(subsetData, plot(newTime, Sub_metering_1, type = "l", ann = FALSE))
with(subsetData, lines(newTime, Sub_metering_2, ann = FALSE, col = "red"))
with(subsetData, lines(newTime, Sub_metering_3, ann = FALSE, col = "blue"))

title(ylab = "Energy sub metering", cex.lab=0.8, cex.axis=0.8)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.off()

