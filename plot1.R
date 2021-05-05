# Clear environment for memory reasons
if (length(ls()) > 0) {
  rm(list=ls())
}

# Read data
data <- read.csv('data/household_power_consumption.txt', sep= ';')
# cleaning the data (Date, Time and select dates between 2007-02-01 and 2007-02-02)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, data$Date >= as.Date("2007-02-01"))
data <- subset(data, data$Date <= as.Date("2007-02-02"))

data$DayTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot1.png")

hist(as.numeric(data$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
