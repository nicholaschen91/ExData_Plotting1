#assumes data file is saved as "household_power_consumption.txt" in the working directory
#assumes sqldf package is installed

file <- "household_power_consumption.txt"

#subset data from file
require("sqldf")
subsetData <- read.csv.sql(file, sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR DATE = '2/2/2007'", header = TRUE, sep = ";")

#plot graph
hist(subsetData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red",  cex.lab=0.8, cex.axis=0.8)
dev.copy(png, file = "plot1.png")
dev.off()

