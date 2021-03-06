### Create Plot 4
### Course Project 1: Course course: Exploratory Analysis

# Reading the data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?")
unlink(temp)

# Some Manipulation
names(data) <- tolower(names(data))
#data$date <- as.Date(data$date, format = "%d/%m/%Y")
#data <- subset(data, date >= "2007-02-01" & date <= "2007-02-02")
data <- subset(data, as.character(date) == "1/2/2007" | as.character(date) == "2/2/2007")
data$datetime <- strptime(paste(data$date, data$time), format = "%d/%m/%Y %H:%M:%S")

# Create a plot
png(file = "plot4.png")
par(mfrow = c(2, 2))
plot(data$datetime, data$global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(data$datetime, data$voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(data$datetime, data$sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$sub_metering_1)
lines(data$datetime, data$sub_metering_2, col = "red")
lines(data$datetime, data$sub_metering_3, col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), bty = "n")
plot(data$datetime, data$global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()