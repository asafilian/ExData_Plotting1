### Create Plot 1
### Course Project 1: Course course: Exploratory Analysis

# Reading the data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?")
unlink(temp)

# Some Manipulation
names(data) <- tolower(names(data))
data$date <- as.Date(data$date, format = "%d/%m/%Y")
data <- subset(data, date == "2007-02-01" | date == "2007-02-02")
#data <- subset(data, date >= "2007-02-01" & date <= "2007-02-02")
#data$time <- strptime(data$time, format = "%T")


# Making the hisrogram of Global Active Powe
png(file = "plot1.png")
hist(data$global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()