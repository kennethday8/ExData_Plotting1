## load data and select only entries from two desired dates
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date1 <- as.Date("01/02/2007", "%d/%m/%Y")
date2 <- as.Date("02/02/2007", "%d/%m/%Y")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc, epc$Date == date1 | epc$Date == date2)

## combine date and time columns to create datetime variable
epc$DateTime <- as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S")

## define plotting variables
ylab3 <- "Energy sub metering"
legend3 <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
col3 <- c("black", "red", "blue")

## plot line graph to show how the different sub_meterings change over time
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(epc$DateTime, epc$Sub_metering_1, type = "l", xlab = "", ylab = ylab3)
points(epc$DateTime, epc$Sub_metering_2, col = "red", type = "l")
points(epc$DateTime, epc$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, legend = legend3, col = col3)
dev.off()
