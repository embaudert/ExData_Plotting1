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

png("plot4.png")

par(mfrow = c(2,2))

with(data, plot(DayTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))

with(data, plot(DayTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

with(data, plot(DayTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(DayTime, Sub_metering_2, type="l", col="red"))
with(data, lines(DayTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"), bty="n")

with(data, plot(DayTime, Global_reactive_power, type="l", xlab = "datetime"))

dev.off()
